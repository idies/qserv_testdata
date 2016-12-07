import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class Translator {

	private Database database;
	private File infolder;
	private File outfolder;
	private File queryfolder;

	private boolean doLoad, doQuery;

	public static Pattern create_table = Pattern.compile("create[ ]+table", Pattern.CASE_INSENSITIVE);
	public static Pattern parens = Pattern.compile("(\\w*)(\\(([^()]*|\\([^()]*\\))*\\))"); // (\w+)(\(([^()]*|\([^()]*\))*\))
	public static Pattern quotedname = Pattern.compile("`(\\w+)`"); // (\w+)(\(([^()]*|\([^()]*\))*\))
	public static Pattern p_bigint = Pattern.compile("bigint(\\s*)[\\((\\w+\\)]?", Pattern.CASE_INSENSITIVE); // (\w+)(\(([^()]*|\([^()]*\))*\))
	public static Pattern p_int = Pattern.compile("int(\\s*)[\\((\\w+\\)]?", Pattern.CASE_INSENSITIVE); // (\w+)(\(([^()]*|\([^()]*\))*\))
	public static Pattern pk = Pattern.compile("primary[ ]+key[ ]*\\(([^()]*)\\)", Pattern.CASE_INSENSITIVE); // (\w+)(\(([^()]*|\([^()]*\))*\))
	public static Pattern p_index = Pattern.compile("key[ ]+`(\\w+)`[ ]+\\(([^()]*)\\)", Pattern.CASE_INSENSITIVE); // (\w+)(\(([^()]*|\([^()]*\))*\))

	public static final String NL="\n";
	
	public static void main(String[] args) throws Exception {
		if (args.length != 2) {
			System.out.println("usage: java Translator <LQ | Q | L> <lsst-case-folder>");
			System.out.println("<mode> is either L (load data), or Q (run queries) or LQ (do both)");

			return;
		}
		try {
			Translator t = new Translator(args[1], new Database());
			t.doLoad = args[0].indexOf("L") > -1;
			t.doQuery = args[0].indexOf("Q") > -1;

			t.run();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Translator(String _f, Database _d) {
		this.infolder = new File(_f + "/data");
		this.outfolder = new File(_f + "/mssql-data");
		this.outfolder.mkdirs();
		this.queryfolder = new File(_f + "/mssql-queries");
		this.queryfolder.mkdirs();
		this.database = _d;
	}

	private void run() throws Exception {
		String now = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		if (doLoad) {
			database.clean();
			// 1. translate DDLs
			List<Table> tables = translateDDLs(infolder, outfolder);

			// 2. create tables for DDLs
			createTables(tables);

			// 3. copy data files
			copyData(tables);

			// 4. load data in db
			loadData(tables);

			StringBuffer sb = new StringBuffer(String.format("Log of table load run at %s\n=========================\n",now));
			for (Table table : tables) {
				sb.append(table.toString()).append(NL);
			}
			String s = sb.toString();
			System.out.println(s);
			writeToFile(s,new File(outfolder.getAbsolutePath()+"/LOAD_LOG_"+now+".txt"));
		}
		if (doQuery) {
			// 4. try queries
			StringBuffer sb = new StringBuffer(String.format("Log of query execution run at %s\n=========================\n",now));
			List<Query> queries = tryQueries();
			for (Query query : queries) {
				sb.append(query.toString()).append(NL);
			}
			String s = sb.toString();
			System.out.println(s);
			writeToFile(s,new File(queryfolder.getAbsolutePath()+"/QUERY_LOG_"+now+".txt"));
		}
	}

	private List<Table> translateDDLs(File indir, File outDir) {
		ArrayList<Table> tables = new ArrayList<Table>();
		File[] infiles = indir.listFiles(new FilenameFilter() {

			@Override
			public boolean accept(File dir, String name) {
				// TODO Auto-generated method stub
				return name.endsWith(".sql") || name.endsWith(".schema");
			}
		});

		for (File infile : infiles) {
			File outFile = new File(outDir + "/" + infile.getName().replaceAll(".schema", ".sql"));
			Table table = new Table();
			table.indir = indir;
			table.targetdir = outDir;
			table.inDDLFile = infile;
			table.ddlFile = outFile;
			tables.add(table);
			try {
				parseDDL(table);
				table.ddlParsed = true;
			} catch (Exception e) {
				table.ddlParsed = false;
				table.ddlParsedError = e.getMessage();
				table.ok = false;
			}
		}
		return tables;
	}

	public void createTables(List<Table> tables) throws SQLException, IOException {
		Connection connection = database.connect();

		for (Table table : tables) {
			if (!table.ok)
				continue;
			String sql = readFile(table.ddlFile);
			try {
				database.writeToDB(sql, connection);
				table.tableCreated = true;
			} catch (SQLException e) {
				table.tableCreated = false;
				table.tableCreatedError = e.getMessage();
				table.ok = false;
			}
		}
		database.disconnect(connection);
	}

	public static String readFile(File file) throws IOException {
		byte[] encoded = Files.readAllBytes(Paths.get(file.getAbsolutePath()));
		return new String(encoded, Charset.defaultCharset());
	}

	public void parseDDL(Table t) throws Exception {
		File infile = t.inDDLFile;
		String contents = readFile(infile);

		Matcher matcher = create_table.matcher(contents);

		int start, end, name_start, name_end;
		if (matcher.find()) {
			start = matcher.start();
			name_start = matcher.end() - start;
		} else {
			throw new Exception(
					String.format("%s is not Not a ddl, cannot find a create table statement\n", infile.getName()));
		}
		contents = contents.substring(start);
		start = 0;
		matcher = parens.matcher(contents);
		if (matcher.find()) {
			name_end = matcher.start() - 1;
			end = matcher.end();
		} else {
			throw new Exception("no parens after create table");
		}
		String tablename = contents.substring(name_start, name_end).trim().replaceAll("`", "");
		t.name = tablename;
		contents = contents.substring(matcher.start() + 1, end - 1);

		String primaryKey = null;
		String keys = contents;
		matcher = pk.matcher(contents);
		if (matcher.find()) {
			primaryKey = contents.substring(matcher.start(), matcher.end());
			keys = contents.substring(matcher.end());
			contents = contents.substring(0, matcher.start() - 1);
		} else
			keys = contents;
		ArrayList<String> indexes = new ArrayList<String>();
		matcher = p_index.matcher(keys);
		boolean first = true;
		while (matcher.find()) {
			if (primaryKey == null && first) {
				first = false;
				contents = contents.substring(0, matcher.start());
			}
			indexes.add(keys.substring(matcher.start(), matcher.end()));
		}
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		PrintStream out = new PrintStream(new FileOutputStream(t.ddlFile));

		out.printf("-- MS SQL DDL ported from MySQL version at %s\n\n", infile);
		out.printf("IF OBJECT_ID('dbo.%s', 'U') IS NOT NULL\n DROP TABLE dbo.%s\n\n", tablename, tablename);
		out.printf("CREATE TABLE [%s] (\n", tablename);

		String[] lines = contents.split("[,]");
		int count = 0;
		for (String line : lines) {
			line = line.trim();
			if (line.length() == 0)
				continue;
			String[] words = line.split("[ ]+");
			String name = words[0].replaceAll("`", "");
			if (words.length < 2) {
				throw new Exception(String.format("Parsing probem in file %s at line %s\n", infile.getAbsolutePath(), line));
			}
			String type = typeFor(words[1]);
			if (count++ > 0)
				out.print(",");
			else
				out.print(" ");

			out.printf("  [%s] %s", name, type);
			for (int i = 2; i < words.length; i++)
				out.printf(" %s", words[i].replace("AUTO_INCREMENT","IDENTITY"));
			out.print("\n");
		}
		out.print(")\n\n");
		if (primaryKey != null)
			out.printf("%s\n\n", primKey(primaryKey, tablename));
		for (String key : indexes)
			out.printf("\n\n %s", index(key, tablename));
		out.print("\n\n");
		out.flush();
		out.close();

	}

	public static String typeFor(String t) {
		String parens = "";
		int index = t.indexOf("(");
		if (index >= 0) {
			parens = t.substring(index);
			t = t.substring(0, index);
		}
		t = t.toUpperCase();
		if (t.equals("TIMESTAMP"))
			return "DATETIME";
		if (t.equals("DOUBLE"))
			return "FLOAT";
		if (t.equals("FLOAT"))
			return "REAL";
		if (t.startsWith("INT"))
			return "INTEGER";
		if (t.equals("BIT") || t.equals("SMALLINT") || t.equals("TINYINT") || t.equals("BIGINT"))
			return t;
		if (t.equals("FLOAT"))
			return "REAL";
		if (t.equals("BLOB"))
			return "VARBINARY(MAX)";
		return t + parens;
	}

	public static String testIndex(String line) {
		if (line.trim().toLowerCase().startsWith("key"))
			return line;
		return null;
	}

	public static String primKey(String pk, String name) {
		StringBuffer sb = new StringBuffer("ALTER TABLE [").append(name).append("] ADD CONSTRAINT pk_").append(name)
				.append(" PRIMARY KEY (");
		Matcher matcher = quotedname.matcher(pk);
		boolean first = true;
		while (matcher.find()) {
			String column = pk.substring(matcher.start() + 1, matcher.end() - 1);
			if (!first)
				sb.append(",");
			sb.append("[").append(column).append("]");
			first = false;
		}
		sb.append(")");
		return sb.toString();
	}

	public static String index(String key, String name) {
		StringBuffer sb = new StringBuffer("CREATE INDEX ix_").append(name).append("_");
		Matcher matcher = quotedname.matcher(key);
		int count = 0;
		while (matcher.find()) {
			String column = key.substring(matcher.start() + 1, matcher.end() - 1);
			if (count == 0) {
				sb.append(column).append(" ON [").append(name).append("](");
				count++;
			} else {
				if (count++ > 1)
					sb.append(",");
				sb.append("[").append(column).append("]");
			}
		}
		sb.append(")");
		return sb.toString();
	}

	public static void writeToFile(String sql, File outfile) throws IOException {
		FileWriter w = new FileWriter(outfile);
		w.write(sql);
		w.flush();
		w.close();
	}

	public void copyData(List<Table> tables) throws Exception {
		String LINEENDING = "\r\n"; // for SQL Server on windows

		for (final Table table : tables) {
			if (!table.ok)
				continue;
			try {
				File[] files = table.indir.listFiles(new FilenameFilter() {

					@Override
					public boolean accept(File dir, String name) {
						return name.startsWith(table.name + ".") && name.endsWith(".gz");
					}
				});
				if (files.length != 1) {
					throw new IllegalStateException("Found not a single data file for table '" + table + "'");
				}
				table.inGzipDataFile = files[0];
				// 1. un-gzi the data file
				table.inCsvFile = new File(table.inGzipDataFile.getAbsolutePath().replace(".gz", ""));
				if(table.inCsvFile.getName().indexOf(".tsv")>-1)
					table.separator="\t";
				gunzipTableData(table);

				// 2. replace \N (null) with empty string
				BufferedReader r = new BufferedReader(new FileReader(table.inCsvFile));

				table.csvFile = new File(table.targetdir + "/" + table.inCsvFile.getName());

				BufferedWriter w = new BufferedWriter(new FileWriter(table.csvFile));
				String line = null;
				while ((line = r.readLine()) != null) {
					line = line.replaceAll("\\\\N", "");
					// attempt at getting rid of bad characters, not sufficient yet
					line = line.replaceAll("[^\\x00-\\x7F]", "");
					w.write(line);
					w.write(LINEENDING);
				}
				r.close();
				w.flush();
				w.close();
				table.inCsvFile.delete();
				table.dataTranslated = true;
			} catch (Exception e) {
				table.dataTranslatedError = e.getMessage();
				table.dataTranslated = false;
				table.ok = false;
			}
		}
	}

	public void loadData(List<Table> tables) throws SQLException {
		// 3. create and run BULK INSERT statement
		for (Table table : tables) {
			if (!table.ok)
				continue;
			Connection connection = database.connect();
			String sql = String.format("BULK INSERT %s from '%s' WITH(fieldterminator='%s', tablock)", table.name,
					table.csvFile,table.separator);
			try {
				// user needs bulk admin server role.
				PreparedStatement ps = connection.prepareStatement(sql);
				int num = ps.executeUpdate();
				table.tableLoaded = true;
				table.numRows = num;
			} catch (SQLException e) {
				table.tableLoadedError = e.getMessage();
				table.ok = false;
			} finally {
				database.disconnect(connection);
			}
		}

	}

	public static void gunzipTableData(Table table) {

		byte[] buffer = new byte[1024];

		try {

			GZIPInputStream gzis = new GZIPInputStream(new FileInputStream(table.inGzipDataFile));

			FileOutputStream out = new FileOutputStream(table.inCsvFile);

			int len;
			while ((len = gzis.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}

			gzis.close();
			out.close();

		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	public static void gzipIt(String INPUT_FILE, String OUTPUT_GZIP_FILE) {

		byte[] buffer = new byte[1024];

		try {

			FileInputStream in = new FileInputStream(INPUT_FILE);

			GZIPOutputStream gzos = new GZIPOutputStream(new FileOutputStream(OUTPUT_GZIP_FILE));

			int len;
			while ((len = in.read(buffer)) > 0) {
				gzos.write(buffer, 0, len);
			}

			gzos.close();
			in.close();

			System.out.println("Done");

		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	private ArrayList<Query> tryQueries() {
		ArrayList<Query> queries = new ArrayList<Query>();
		File[] queryfiles = this.queryfolder.listFiles(new FilenameFilter() {

			@Override
			public boolean accept(File dir, String name) {
				// TODO Auto-generated method stub
				return name.endsWith(".sql");
			}
		});

		for (File queryfile : queryfiles) {
			Query q = new Query();
			queries.add(q);
			q.queryFile = queryfile;
			try {
				q.sql = readFile(queryfile);
				database.query(q);
			} catch (Exception e) {
				q.ok = false;
				q.error = e.getMessage();
			}
		}
		return queries;
	}
}

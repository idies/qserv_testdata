import java.io.File;


public class Query {

	public File queryFile;
	public String sql;
	public boolean ok;
	public String firstRow, error;
	public int numRows = -1;
	

	public String toString(){
		String NL="\n";
		StringBuffer sb = new StringBuffer();
		sb.append("QUERY [").append(NL);
		sb.append("- file =").append(queryFile).append(NL);
//		sb.append("- sql =").append(sql).append(NL);
		sb.append("- status = ").append((ok?"OK":"ERROR")).append(NL);
		
		if(!ok)		sb.append("- error = ").append(error).append(NL);
		else sb.append("- first row = [").append(firstRow).append("]").append(NL);
		sb.append("]");
		return sb.toString();
	}
}

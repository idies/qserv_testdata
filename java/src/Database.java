import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Database {

/*	private String user = "lsst";
	private String password = "lsst";
	private String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String url = "jdbc:sqlserver://localhost:1433;DatabaseName=LSST";*/

	private String user = "";
	private String password = "";
	private String driver = "";
	private String url = "";

	public Database(){
		Properties prop = new Properties();



		try (InputStream input = this.getClass().getResourceAsStream("config.properties")) {
			//input = new FileInputStream("config.properties");

			//load properties file
			prop.load(input);
			user = prop.getProperty("user");
			password = prop.getProperty("password");
			driver = prop.getProperty("driver");
			url = prop.getProperty("url");
		} catch (IOException e) {
			e.printStackTrace();
		}




	}
	
	public Database(String _u, String _p, String _url, String _d){
		String user = _u;
		String password = _p;
		String driver = _d;
		String url = _url;
	}


	
	public Connection connect() throws SQLException {

		try {
			Class.forName(driver).newInstance();
		} catch (ClassNotFoundException ex) {
			System.out.println("Error: unable to load driver class!");
			ex.printStackTrace();
			System.exit(1);
		} catch (IllegalAccessException ex) {
			System.out.println("Error: access problem while loading!");
			System.exit(2);
		} catch (InstantiationException ex) {
			System.out.println("Error: unable to instantiate driver!");
			System.exit(3);
		}
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}

	public int writeToDB(String sql, Connection connection) throws SQLException {
		PreparedStatement ps = connection.prepareStatement(sql);
		int num = ps.executeUpdate();
		ps.close();
		return num;
	}

	/** attempt query to DB and report on result */
	public void query(Query q) throws SQLException {
		Connection connection = null;
		try {
			connection = connect();
			
			PreparedStatement ps = connection.prepareStatement(q.sql);
			ResultSet rs = null;
			rs = ps.executeQuery();
			boolean first = true;
			q.numRows=0;
			while(rs.next()) {
				if(first){
					StringBuffer sb = new StringBuffer("[");
					ResultSetMetaData md = rs.getMetaData();
					for (int i = 1; i <= md.getColumnCount(); i++) {
						if (i > 1)
							sb.append(",");
						sb.append(rs.getString(i));
					}
					q.firstRow = sb.append("]").toString();
					first = false;
				}
				q.numRows++;
			}
			q.ok = true;
			if (rs != null)
				rs.close();
			ps.close();
		} catch (SQLException e) {
			q.ok = false;
			q.error =e.getMessage();
		}
	}

	public ArrayList<String> tables() throws SQLException{
		Connection connection = null;
		try {
			PreparedStatement ps = null;
			ResultSet rs = null;
			connection = connect();
			String sql = "select table_name from information_schema.tables";
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<String> names = new ArrayList<String>();
			while (rs.next()) 
				names.add(rs.getString(1));
			rs.close();
			ps.close();
			return names;
		} finally{
			disconnect(connection);
		}
	}
	
	public void clean() throws SQLException {
		List<String> names = tables();
		Connection connection = null;
		try {
			connection = connect();
			for(String name:names) {
				Statement drop = connection.createStatement();
				String sql = String.format("drop table %s", name);
  			drop.execute(sql);
			}
		} finally {
			disconnect(connection);
		}
	}

	public void disconnect(Connection connection) {
		try {
			connection.commit();
		} catch (SQLException e) {
			System.out.printf("Exception when trying to commit connection: %s", e.getMessage());
			try {
				connection.rollback();
			} catch (SQLException e2) {
				System.out.printf("Exception when trying to rollback connection: %s", e2.getMessage());
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				System.out.printf("Exception when trying to close connection: %s", e.getMessage());
			}
		}
	}
}

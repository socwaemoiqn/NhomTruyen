package vn.com.nhomtruyen.WebsiteDocTruyen.Common;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
public class ConnectionJDBC {
	public static Connection getMySQLConnection() throws SQLException,
    ClassNotFoundException {
	String hostName = "localhost";
	
	String dbName = "dbnhomtruyen";
	String userName = "root";
	String password = "";
	
	return getMySQLConnection(hostName, dbName, userName, password);
	}
	
	public static Connection getMySQLConnection(String hostName, String dbName,
	    String userName, String password) throws SQLException,
	    ClassNotFoundException {

	// Cấu trúc URL Connection dành cho Oracle
	// Ví dụ: jdbc:mysql://localhost:3306/simplehr
	String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
	
	Connection conn = DriverManager.getConnection(connectionURL, userName,
	        password);
	return conn;
	}
	  public static void main(String[] args) throws SQLException,
      ClassNotFoundException {

  System.out.println("Get connection ... ");

	  // Lấy ra đối tượng Connection kết nối vào database.
	  Connection conn = ConnectionJDBC.getMySQLConnection();
	
	  System.out.println("Get connection " + conn);
	
	  System.out.println("Done!");
	  }
}

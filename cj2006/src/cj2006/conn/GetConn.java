package cj2006.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConn {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String driver ="com.mysql.jdbc.Driver";
	private String url ="jdbc:mysql://localhost:3306/javadb";
	private String user ="root";
	private String password ="1234";
	
	private static GetConn instance = null;
	
	private GetConn() {
		try {
			Class.forName(driver);		
			conn = DriverManager.getConnection(url, user, password);	
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패" + e.getMessage());			
		}catch (Exception e) {
			System.out.println("DB 연동 실패" + e.getMessage());
		}
		
	}

	public static GetConn getInstance() {
		if(instance == null) {
			instance = new GetConn();
		}
		return instance;
	}
	
	public void pstmtClose() {
		if(pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {}
	}
	
	public void rsClose() {
		if(rs != null)
			try {
				rs.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {}
	}

	public Connection getConn() {
		return conn;
	}

	public PreparedStatement getPstmt() {
		return pstmt;
	}

	public ResultSet getRs() {
		return rs;
	}

	
	
	
}

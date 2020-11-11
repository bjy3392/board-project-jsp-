package T0925;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql ="";
	
	private String url = "jdbc:mysql://localhost:3306/javadb";
	private String user = "root";
	private String password = "1234";
	
	public LoginDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패" + e.getMessage());
		} catch (Exception e) {
			System.out.println("DB 연동 실패" + e.getMessage());
		}
	}
	
	public void dbClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {}
		}
	}
	
	public String loginOk(String mid, String pwd) {
		try {
			sql = "select name from login where mid=? and pwd=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) return rs.getString("name");
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error : " + e.getMessage());
		} finally {
			if(rs != null )
				try {
					rs.close();
					if(pstmt != null) pstmt.close();
				} catch (SQLException e) {}
		}
		return "";
	}
	
	public String loginInputOk(LoginVo vo) {
		try {
			sql= "insert into login values (default, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.executeUpdate();
			return vo.getName();
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error : " + e.getMessage());
		}finally {
			if(rs != null )
				try {
					rs.close();
					if(pstmt != null) pstmt.close();
				} catch (SQLException e) {}
		}
		return "";
	}
	
	public ArrayList<LoginVo> loginList() {
		ArrayList<LoginVo> vos = new ArrayList<LoginVo>();
		try {
			sql= "select * from login order by idx desc;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LoginVo vo = new LoginVo();  //값이 들어가는게 아니라 위치를 참조하기 떄문에 각각 생성을 안하면 모두 같은 값이 된다.
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error : " + e.getMessage());
		}finally {
			if(rs != null )
				try {
					rs.close();
					if(pstmt != null) pstmt.close();
				} catch (SQLException e) {}
		}
		
		
		return vos;
	}
}

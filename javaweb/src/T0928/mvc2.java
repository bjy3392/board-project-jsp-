package T0928;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.rmi.server.Dispatcher;

@WebServlet("/m2")
public class mvc2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("mid")==null ? "":request.getParameter("mid");
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql ="";
		
		String url = "jdbc:mysql://localhost:3306/javadb";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			
			sql = "select * from login where mid =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()){	//request객체가 저장소의 역할도 한다.
				request.setAttribute("idx", rs.getInt("idx"));
				request.setAttribute("mid", rs.getString("mid"));
				request.setAttribute("pwd", rs.getString("pwd"));
				request.setAttribute("name", rs.getString("name"));
			}
			else{
				request.setAttribute("name", "자료가 없습니다.");
			}
			
			//response.sendRedirect("주소");
			//dispatcher.forword();
			RequestDispatcher dispatcher = request.getRequestDispatcher("/0928_mvc2/mvc2.jsp");
			dispatcher.forward(request, response);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패" + e.getMessage());
		} catch (Exception e) {
			System.out.println("DB 연동 실패" + e.getMessage());
		} finally {
			if(conn != null) {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				} catch (SQLException e) {}
			}
		}
	
	}
	
}

package cj2006.guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cj2006.conn.GetConn;

public class GuestDao {
	private Connection conn = GetConn.getInstance().getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private GuestVo vo = null;
	
	//GetConn getConn = GetConn.getInstance();
	
	public ArrayList<GuestVo> gList(int startNo, int pageSize){
		ArrayList<GuestVo> vos = new ArrayList<GuestVo>();;
		//getConn = GetConn.getInstance();
		//conn = getConn.getConn();
		try {
			sql = "select * from guest order by idx desc limit ?,?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new GuestVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setVdate(rs.getString("vdate"));
				vo.setHostip(rs.getString("hostip"));
				vo.setContent(rs.getString("content"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			//getConn.rsClose();
			if(rs != null)
				try {
					rs.close();
					if(pstmt != null) pstmt.close();
				} catch (SQLException e) {}
		}

		return vos;
	}

	//방문 소감 등록 처리
	public int gInput(GuestVo vo) {		
		try {
			String content = vo.getContent().replace("<", "&lt;");
			content = content.replace(">", "&gt;");
			
			sql = "insert into guest values (default,?,?,?,default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomepage());
			pstmt.setString(4, vo.getHostip());
			pstmt.setString(5, content);
			pstmt.executeUpdate();
			return 1;
			
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			if(rs != null)
				try {
					rs.close();
					if(pstmt != null) pstmt.close();
				} catch (SQLException e) {}
		}
		
		return 0;
	}

	public int gDel(int idx) {
		try {
			sql = "delete from guest where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			return 1;
			
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			if(rs != null)
				try {
					rs.close();
					if(pstmt != null) pstmt.close();
				} catch (SQLException e) {}
		}
		
		return 0;
	}
	
	//총 레코드 건수 구하기
	public int totGecCnt() {
		try {
			sql = "select count(*) from guest;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			if(rs != null)
				try {
					rs.close();
					if(pstmt != null) pstmt.close();
				} catch (SQLException e) {}
		}

		return 0;
	}
	
	public ArrayList<GuestVo> gListNew(int startNo, int pageSize){
		ArrayList<GuestVo> vos = new ArrayList<GuestVo>();;
		//getConn = GetConn.getInstance();
		//conn = getConn.getConn();
		try {
			sql = "select * from guest order by vdate desc limit ?,?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new GuestVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setVdate(rs.getString("vdate"));
				vo.setHostip(rs.getString("hostip"));
				vo.setContent(rs.getString("content"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			//getConn.rsClose();
			if(rs != null)
				try {
					rs.close();
					if(pstmt != null) pstmt.close();
				} catch (SQLException e) {}
		}

		return vos;
	}

	
}

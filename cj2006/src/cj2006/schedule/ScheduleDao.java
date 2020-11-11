package cj2006.schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cj2006.conn.GetConn;

public class ScheduleDao {
	private Connection conn = GetConn.getInstance().getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ScheduleVo vo = null;
		
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

	//선택된 날짜의 스케쥴 정보를 보여주기 위함(정보가 없으면 입력처리 할 수 있음)
	public ScheduleVo scContent(String ymd, String mid) {
		ScheduleVo vo = new ScheduleVo();
		try {	
			sql = "select * from schedule where scdate = ? and mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ymd);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid") );
				vo.setScdate(rs.getString("scdate"));
				vo.setMemory(rs.getString("memory"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
			}   
			return vo;
		}catch (SQLException e) {
			System.out.println("SQL Error" + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		return null;
	}

	//일정 등록,삭제 처리 기능구현
	public void scContentOk(ScheduleVo vo) {
		try {	
			sql = "select idx from schedule where mid = ? and scdate = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getScdate());
			rs = pstmt.executeQuery();
			
			int idx = 0;
			if(rs.next()) idx = rs.getInt(1); //기존 자료가 존재
			pstmtClose();
			
			if(idx!=0) {
				sql= "update schedule set memory=?, title=?, content=? where idx = ?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMemory());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getContent());
				pstmt.setInt(4, idx);
			}
			else {
				sql = "insert into schedule values (default,?,?,?,?,?)";
		        pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMid());
				pstmt.setString(2, vo.getScdate());
				pstmt.setString(3, vo.getMemory());
				pstmt.setString(4, vo.getTitle());
				pstmt.setString(5, vo.getContent());
			}
			pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
	}
	
	public void scDelete(String ymd, String mid) {
		try {	
			sql = "delete from schedule where scdate = ? and mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ymd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();			
			
		}catch (SQLException e) {
			System.out.println("SQL Error" + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
	}
	
}















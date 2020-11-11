package cj2006.webmessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import cj2006.conn.Cj2006Proc;
import cj2006.conn.GetConn;
import cj2006.pds.PdsVo;

public class WebMessageDao {
	private Connection conn = GetConn.getInstance().getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	
	private WebMessageVo vo = null;
	
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

	//메세지 리스트 가져오기
	public ArrayList<WebMessageVo> wMessageList(String mid, int msw) {
		ArrayList<WebMessageVo> vos = new ArrayList<WebMessageVo>();
		
		try {
			if(msw == 1) { //전체 받은 메세지 리스트 가져오기
				sql = "select * from webmessage where receiveId = ? and (receiveSw = 'n' or  receiveSw = 'r') order by idx desc";
			}
			else if(msw == 2) { //새 메세지 리스트 가져오기
				sql = "select * from webmessage where receiveId = ? and receiveSw = 'n' order by idx desc";
			}
			else if(msw == 3) { //보낸 메세지 리스트 가져오기
				sql = "select * from webmessage where sendId = ? and sendSw = 's' order by idx desc";
			}
			else if(msw == 5) { //휴지통 목록가져오기
				sql = "select * from webmessage where receiveId = ? and receiveSw = 'g' order by idx desc";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new WebMessageVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setSendId(rs.getString("sendId"));
				vo.setSendSw(rs.getString("sendSw"));
				vo.setSendDate(rs.getString("sendDate"));
				vo.setReceiveId(rs.getString("receiveId"));
				vo.setReceiveSw(rs.getString("receiveSw"));
				vo.setReceiveDate(rs.getString("receiveDate"));
				
				vos.add(vo);				
			}
			return vos;
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		return null;
	}

	public int wmInput(WebMessageVo vo) {
		try {
			sql = "select idx from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getReceiveId());
			rs = pstmt.executeQuery();
			if(!rs.next()) return 0;
			pstmtClose();
			
			sql = "insert into webmessage values (default, ?, ?,?,default, default,?,default, default) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getSendId());
			pstmt.setString(4, vo.getReceiveId());
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		return 0;
	}

	//한건의 메세지 가져오기
	public WebMessageVo wmMessageOne(int idx, String mid) {
		try {
			sql = "update webmessage set receiveSw = 'r' where idx = ? and receiveId = ? and receiveSw ='n';";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
			pstmtClose();
					
			sql = "select * from webmessage where idx = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new WebMessageVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setSendId(rs.getString("sendId"));
				vo.setSendSw(rs.getString("sendSw"));
				vo.setSendDate(rs.getString("sendDate"));
				vo.setReceiveId(rs.getString("receiveId"));
				vo.setReceiveSw(rs.getString("receiveSw"));
				vo.setReceiveDate(rs.getString("receiveDate"));				
			}
			return vo;
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		return null;
	}

	public int wmCount(String mid) {
		try {
			sql = "select count(*) from webmessage where receiveSw = 'n' and receiveId = ? ;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);			
			}
			
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		return 0;
	}

	public void wmDelete(int idx, int premsw) {
		try {
			if(premsw == 3) {
				sql = "update webmessage set sendSw = 'x' where idx = ? ;";
			}	
			else if(premsw == 5) {
				sql = "update webmessage set receiveSw = 'x' where idx = ? ;";
			}
			else {
				sql = "update webmessage set receiveSw = 'g' where idx = ? ;";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
	}

	public void wmTrashDelete(String mid) {
		try {
			sql = "update webmessage set receiveSw = 'x' where receiveId = ? and receiveSw = 'g';";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
	}
	
	//관리자에 의한 메세지 삭제처리(sendSw='x'와 receiveSw='x'의 삭제처리)
	//관리자가 삭제처리 예정인 메세지 가져오기
	public ArrayList<WebMessageVo> awmList() {
		ArrayList<WebMessageVo> vos = new ArrayList<WebMessageVo>();
		
		try {
			sql = "select * from webmessage where receiveSw = 'x' and sendSw = 'x' order by idx desc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new WebMessageVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setSendId(rs.getString("sendId"));
				vo.setSendSw(rs.getString("sendSw"));
				vo.setSendDate(rs.getString("sendDate"));
				vo.setReceiveId(rs.getString("receiveId"));
				vo.setReceiveSw(rs.getString("receiveSw"));
				vo.setReceiveDate(rs.getString("receiveDate"));
				
				vos.add(vo);				
			}
			return vos;
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		return null;
	}

	public void awmDeleteAll() {
		try {
			sql = "delete from webmessage where receiveSw = 'x' and sendSw = 'x';";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
	}
}














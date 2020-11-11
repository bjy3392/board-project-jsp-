package cj2006.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cj2006.conn.GetConn;

public class ChatDao {
	private Connection conn= GetConn.getInstance().getConn();
	private PreparedStatement pstmt =  null;
	private ResultSet rs = null;
	
	String sql = "";
	
	private ChatVo vo = null;
	
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

	public int chatInput(String nickname, String content, String avatar) {
		int flag =0 ;
		try {
			sql = "insert into chat values (default,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, content);
			pstmt.setString(3, avatar);
			pstmt.executeUpdate();
			flag = 0;
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		
		return flag;
	}

	//채팅항목 최근글 10개 가져오기
	public ArrayList<ChatVo> chatList(int idx) {
		ArrayList<ChatVo> vos = new ArrayList<ChatVo>();
		
		sql = "select * from chat where idx > (select max(idx) - ? from chat) order by idx ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ChatVo vo = new ChatVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickname(rs.getString("nickname"));
				
				//시간을 오전/오후로 분리
				int cdate = Integer.parseInt(rs.getString("cdate").substring(11,13));
				String timeType = "오전";
				if(Integer.parseInt(rs.getString("cdate").substring(11,13)) >= 12) {
					timeType = "오후";
					cdate = cdate -12;
				}
				
				vo.setContent(rs.getString("content"));
				//vo.setCdate(rs.getString("cdate"));
				vo.setCdate(rs.getString("cdate").substring(0,11)+ " "+timeType+cdate+":"+rs.getString("cdate").substring(14,16)+" ");
				vo.setAvatar(rs.getString("avatar"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		
		return vos;
	}

	public ArrayList<ChatVo> chatList(String idx) {
		ArrayList<ChatVo> vos = new ArrayList<ChatVo>();
		
		try {
			sql = "select * from chat where idx > ? order by idx ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(idx));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ChatVo vo = new ChatVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickname(rs.getString("nickname"));
				vo.setContent(rs.getString("content"));
				vo.setCdate(rs.getString("cdate"));
				vo.setAvatar(rs.getString("avatar"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL Error " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		
		return vos;
	}
			
}

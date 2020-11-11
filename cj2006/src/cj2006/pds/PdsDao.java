package cj2006.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cj2006.board.BoardVo;
import cj2006.conn.Cj2006Proc;
import cj2006.conn.GetConn;


public class PdsDao {
	private Connection conn = GetConn.getInstance().getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	
	private PdsVo vo = null;
	
	Cj2006Proc cj = new Cj2006Proc();
	
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
	
	//자료실 리스트 처리
	public ArrayList<PdsVo> pList(int startNo, String part) {
		ArrayList<PdsVo> vos= new ArrayList<PdsVo>();
		
		try {
			if(part.equals("전체")) {
				sql = "select * from pds order by idx desc limit ?,5;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startNo);
				rs = pstmt.executeQuery();				
			}
			else {
				sql = "select * from pds where part=? order by idx desc limit ?,5;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
				pstmt.setInt(2, startNo);
				rs = pstmt.executeQuery();	
			}
			while(rs.next()) {
				vo = new PdsVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickname(rs.getString("nickname"));
				vo.setFname(rs.getString("fname"));
				vo.setRfname(rs.getString("rfname"));
				vo.setTitle(rs.getString("title"));
				vo.setPwd(rs.getString("pwd"));
				vo.setPart(rs.getString("part"));
				vo.setFdate(rs.getString("fdate"));
				
				//저장된 날짜와 오늘날짜를 비교해서 숫자로 처리하는 부분
				vo.setfNdate(cj.timeDiff(rs.getString("fdate")));
				
				vo.setFsize(rs.getString("fsize"));
				vo.setDownnum(rs.getInt("downnum"));
				vo.setOpensw(rs.getString("opensw"));
				vo.setContent(rs.getString("content"));
				
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


	//자료실 업로드하기
	public int pInput(PdsVo vo) {
		try {
			sql = "insert into pds values (default,?,?,?,?,?,?,default, ?,default, ?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickname());
			pstmt.setString(2, vo.getFname());
			pstmt.setString(3, vo.getRfname());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getPart());
			pstmt.setString(6, vo.getPwd());
			pstmt.setString(7, vo.getFsize());
			pstmt.setString(8, vo.getOpensw());
			pstmt.setString(9, vo.getContent());
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			System.out.println("SQL Error" + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
		}
		return 0;
	}

	//총 레코드수 구하기
	public int totGecCnt(String part) {
		try {
			if(part.equals("전체")) {
				sql = "select count(*) from pds;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}
			else {
				sql = "select count(*) from pds where part = ?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
				rs = pstmt.executeQuery();
			}
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			pstmtClose();
			rsClose();
		}

		return 0;
	}

	//개별자료조회
	public PdsVo pContent(int idx) {
		try {
			sql = "select * from pds where idx = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new PdsVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickname(rs.getString("nickname"));
				vo.setFname(rs.getString("fname"));
				vo.setRfname(rs.getString("rfname"));
				vo.setTitle(rs.getString("title"));
				vo.setPwd(rs.getString("pwd"));
				vo.setPart(rs.getString("part"));
				vo.setFdate(rs.getString("fdate"));
				vo.setFsize(rs.getString("fsize"));
				vo.setDownnum(rs.getInt("downnum"));
				vo.setOpensw(rs.getString("opensw"));
				vo.setContent(rs.getString("content"));
			}
			return vo;
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			pstmtClose();
			rsClose();
		}

		return null;
	}
	
	//다운로드 횟수 증가 처리하는 부분
	public PdsVo pDownCount(int idx) {
		try {
			sql = "update pds set downnum = downnum + 1 where idx = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			pstmtClose();
			sql = "select * from pds where idx = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new PdsVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickname(rs.getString("nickname"));
				vo.setFname(rs.getString("fname"));
				vo.setRfname(rs.getString("rfname"));
				vo.setTitle(rs.getString("title"));
				vo.setPwd(rs.getString("pwd"));
				vo.setPart(rs.getString("part"));
				vo.setFdate(rs.getString("fdate"));
				vo.setFsize(rs.getString("fsize"));
				vo.setDownnum(rs.getInt("downnum"));
				vo.setOpensw(rs.getString("opensw"));
				vo.setContent(rs.getString("content"));
			}
			return vo;
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			pstmtClose();
			rsClose();
		}
		return vo;
	}
	
	public boolean pwdCheck(int idx, String pwd) {
		try {
			sql = "select pwd from pds where idx = ? and pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			pstmtClose();
			rsClose();
		}
		
		return false;
	}
	public boolean pDel(int idx) {
		try {
			sql = "delete from pds where idx = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			pstmtClose();
			rsClose();
		}
		return false;
	}
}

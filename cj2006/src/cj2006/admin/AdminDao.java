package cj2006.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cj2006.conn.GetConn;
import cj2006.member.MemberVo;

public class AdminDao {
  private Connection conn = null;
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  private MemberVo vo = null;

  // 회원 레벨 변경 처리
  public int levelCheck(int idx, String level) {
    GetConn getConn = GetConn.getInstance();
    conn = getConn.getConn();
    
    try {
      sql = "update member set level=? where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, level);
      pstmt.setInt(2, idx);
      pstmt.executeUpdate();
      return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    return 0;
  }
  
  // 개별 자료 상세 조회
  public MemberVo amSearch(int idx) {
    GetConn getConn = GetConn.getInstance();
    conn = getConn.getConn();
    
    vo = new MemberVo();
    
    try {
      sql = "select * from member where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      if(rs.next()) {
        vo.setIdx(rs.getInt("idx"));
        vo.setMid(rs.getString("mid"));
        vo.setPwd(rs.getString("pwd"));
        vo.setNickname(rs.getString("nickname"));
        vo.setName(rs.getString("name"));
        vo.setGender(rs.getString("gender"));
        vo.setBirth(rs.getString("birth"));
        vo.setTel(rs.getString("tel"));
        vo.setAddress(rs.getString("address"));
        vo.setEmail(rs.getString("email"));
        vo.setHomepage(rs.getString("homepage"));
        vo.setJob(rs.getString("job"));
        vo.setHobby(rs.getString("hobby"));
        vo.setUserinfo(rs.getString("userinfo"));
        vo.setUserdel(rs.getString("userdel"));
        vo.setLevel(rs.getString("level"));
        return vo;
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return null;
  }
  
  public int totRecCnt() {
	  GetConn getConn = GetConn.getInstance();
	    conn = getConn.getConn();
	    
	    try {
	      sql = "select count(*) from member;";
	      pstmt = conn.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      if(rs.next()) {
	        return rs.getInt(1);
	      }
	    } catch (SQLException e) {
	      System.out.println("SQL 에러 : " + e.getMessage());
	      e.printStackTrace();
	    } finally {
	      getConn.rsClose();
	    }
	  
	  return 0;
  }
  
  public ArrayList<MemberVo> amList(int startNo, int pageSize){
	  ArrayList<MemberVo> vos = new ArrayList<MemberVo>();
	  
	  GetConn getConn = GetConn.getInstance();
	    conn = getConn.getConn();
	    
	    try {
	      sql = "select * from member order by idx desc limit ?,?;";
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, startNo);
	      pstmt.setInt(2, pageSize);
	      rs = pstmt.executeQuery();
	      
	      while(rs.next()) {
	        vo = new MemberVo();
	        
	        vo.setIdx(rs.getInt("idx"));
	        vo.setMid(rs.getString("mid"));
	        vo.setPwd(rs.getString("pwd"));
	        vo.setNickname(rs.getString("nickname"));
	        vo.setName(rs.getString("name"));
	        vo.setGender(rs.getString("gender"));
	        vo.setBirth(rs.getString("birth"));
	        vo.setTel(rs.getString("tel"));
	        vo.setAddress(rs.getString("address"));
	        vo.setEmail(rs.getString("email"));
	        vo.setHomepage(rs.getString("homepage"));
	        vo.setJob(rs.getString("job"));
	        vo.setHobby(rs.getString("hobby"));
	        vo.setUserinfo(rs.getString("userinfo"));
	        vo.setUserdel(rs.getString("userdel"));
	        vo.setLevel(rs.getString("level"));
	        vos.add(vo);
	      }
	    } catch (SQLException e) {
	      System.out.println("SQL 오류 : " + e.getMessage());
	      e.printStackTrace();
	    } finally {
	      getConn.rsClose();
	    }
	  
	  return vos;
  }
}

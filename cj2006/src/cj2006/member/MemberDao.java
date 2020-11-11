package cj2006.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import cj2006.conn.GetConn;

public class MemberDao {

	private Connection conn = GetConn.getInstance().getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String sql = "";

	private MemberVo vo = null;

	public boolean idCheck(String mid) {
		try {
			sql = "select mid from member where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			// getConn.rsClose();
			if (rs != null)
				try {
					rs.close();
					if (pstmt != null)
						pstmt.close();
				} catch (SQLException e) {
				}
		}
		return false;
	}

	// 닉네임 중복체크
	public boolean nickCheck(String nickname) {
		GetConn getConn = GetConn.getInstance();
		conn = getConn.getConn();

		try {
			sql = "select nickname from member where nickname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			getConn.rsClose();
		}
		return false;
	}

	// 회원 가입처리
	public String mInput(MemberVo vo) {
		GetConn getConn = GetConn.getInstance();
		conn = getConn.getConn();

		boolean res1 = idCheck(vo.getMid()); // 아이디 중복체크
		boolean res2 = nickCheck(vo.getNickname()); // 닉네임 중복체크
		if (res1 || res2) {
			return "";
		} else {
			try {
				if (vo.getHobby() == null)
					vo.setHobby("");
				sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMid());
				pstmt.setString(2, vo.getPwd());
				pstmt.setString(3, vo.getNickname());
				pstmt.setString(4, vo.getName());
				pstmt.setString(5, vo.getGender());
				pstmt.setString(6, vo.getBirth());
				pstmt.setString(7, vo.getTel());
				pstmt.setString(8, vo.getAddress());
				pstmt.setString(9, vo.getEmail());
				pstmt.setString(10, vo.getHomepage());
				pstmt.setString(11, vo.getJob());
				pstmt.setString(12, vo.getHobby());
				pstmt.setString(13, vo.getUserinfo());
				pstmt.executeUpdate();
				return vo.getName();
			} catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
				e.printStackTrace();
			} finally {
				getConn.pstmtClose();
			}
		}
		return "";
	}

	// 로그인 체크 루틴
	public MemberVo loginCheck(MemberVo vo) {
		GetConn getConn = GetConn.getInstance();
		conn = getConn.getConn();

		try {
			sql = "select mid,pwd,nickname,level from member where mid=? and pwd=? and userdel = 'NO'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setMid(rs.getString("mid"));
				vo.setNickname(rs.getString("nickname"));
				vo.setLevel(rs.getString("level")); /* rs.getString(3) */
				return vo;
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			getConn.rsClose();
		}
		return null;
	}

	// 회원 리스트
	public ArrayList<MemberVo> mList(int startNo, int pageSize) {
		ArrayList<MemberVo> vos = new ArrayList<MemberVo>();

		GetConn getConn = GetConn.getInstance();
		conn = getConn.getConn();

		try {
			sql = "select * from member where userdel='NO' order by idx desc limit ?,?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {
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

	// 개별회원검색 처리
	public MemberVo mSearch(String gubun, String value) {
	    GetConn getConn = GetConn.getInstance();
	    conn = getConn.getConn();
	    
	    vo = new MemberVo();
	    
	    try {
	      sql = "select * from member where "+gubun+"=? and userdel='NO'";
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, value);
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
	        
	        //System.out.println("vo=" + vo);
	        
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

	// 회원정보 수정처리
	public String mUpdate(MemberVo vo, String snickname) {
		GetConn getConn = GetConn.getInstance();
		conn = getConn.getConn();

		if (!vo.getNickname().equals(snickname)) {
			boolean res = nickCheck(vo.getNickname()); // 닉네임 중복체크
			if (res) {
				return "";
			}
		}

		try {
			if (vo.getHobby() == null)
				vo.setHobby("");
			sql = "update member set pwd=?, nickname=?, name=?, gender=?, birth=?, tel=?, address=?,"
					+ "email=?,homepage=?, job=?, hobby=?, userinfo=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getBirth());
			pstmt.setString(6, vo.getTel());
			pstmt.setString(7, vo.getAddress());
			pstmt.setString(8, vo.getEmail());
			pstmt.setString(9, vo.getHomepage());
			pstmt.setString(10, vo.getJob());
			pstmt.setString(11, vo.getHobby());
			pstmt.setString(12, vo.getUserinfo());
			pstmt.setString(13, vo.getMid());
			pstmt.executeUpdate();
			return vo.getName();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			getConn.pstmtClose();
		}

		return "";
	}
	
	public int totGecCnt() {
		try {
			sql = "select count(*) from member;";
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

	public boolean delCheck(String cause,String smid) {
		GetConn getConn = GetConn.getInstance();
		conn = getConn.getConn();
		String causeSw = "OK";

		try {
			sql = "update member set userdel=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, causeSw);
			pstmt.setString(2, smid);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			getConn.pstmtClose();
		}

		return false;
	}

	public boolean delOk(int idx) {
		GetConn getConn = GetConn.getInstance();
		conn = getConn.getConn();

		try {
			sql = "delete from member where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			getConn.pstmtClose();
		}

		return false;
	}

	public ArrayList<MemberVo> mSearchAll() {
		ArrayList<MemberVo> vos = new ArrayList<MemberVo>();

		GetConn getConn = GetConn.getInstance();
		conn = getConn.getConn();

		try {
			sql = "select mid,name from member where userdel='NO' order by idx desc;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new MemberVo();
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));

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

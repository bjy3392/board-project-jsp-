package cj2006.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cj2006.conn.Cj2006Proc;
import cj2006.conn.GetConn;

public class BoardDao {
	private Connection conn = GetConn.getInstance().getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	
	private BoardVo vo = null;
	
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

	//게시판 목록가져오기
	public ArrayList<BoardVo> getBoardList(int startNo, int pageSize) {
		ArrayList<BoardVo> vos= new ArrayList<BoardVo>();
		
		Cj2006Proc cj = new Cj2006Proc();
		
		try {
			sql = "select A.* , b.cnt" + 
					" from board A" + 
					" left outer join (select count(*) as cnt , board_idx from board_cont group by board_idx) B" + 
					" on A.idx = B.board_idx" + 
					" order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()){
				vo = new BoardVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setTitle(rs.getString("title"));
				vo.setPwd(rs.getString("pwd"));
				vo.setWdate(rs.getDate("wdate"));
				
				vo.setwCdate(rs.getString("wdate"));
				int res = cj.timeDiff(vo.getwCdate()); //시간의 차이값을 가져온다.
				vo.setwNdate(res);
				
				vo.setReadnum(rs.getInt("readnum"));
				vo.setHostip(rs.getString("hostip"));
				vo.setContent(rs.getString("content"));
				
				//int cnt = totContCnt(vo.getIdx());
				//vo.setContCnt(cnt); rs를 공유하기 때문에...
				vo.setContCnt(rs.getInt("cnt"));
				
				vos.add(vo);
			}
			return vos;
		} catch (SQLException e) {
			System.out.println("SQL Error" + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		
		return null;
	}
	
	//댓글count
	public int totContCnt(int board_idx) {
		try {
			sql = "select count(*) from board_cont where board_idx= ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} 
		return 0;
	}

	
	//게시판의 글올리기
	public int boardInputOk(BoardVo vo) {
		try {
			sql ="insert into board values (default,?,?,?,?,?,default,default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomepage());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getPwd());
			pstmt.setString(6, vo.getHostip());
			pstmt.setString(7, vo.getContent());
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			System.out.println("SQL Error" + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		return 0;
	}
	
	//게시글 count
	public int totGecCnt() {
		try {
			sql = "select count(*) from board;";
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

	//검색했을때 게시글 count
	public int totGecCnt(String search, String searchStr ) {
		try {
			sql = "select count(*) from board where "+search+" like ? order by idx desc ;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchStr+"%");
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
	
	
	//게시글 내용 보기, 조회수 올리기
	public BoardVo getBoardContent(int idx) {
		try {
			sql = "update board set readnum = readnum+1 where idx = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			pstmtClose();
			
			sql = "select * from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setTitle(rs.getString("title"));
				vo.setPwd(rs.getString("pwd"));
				vo.setWdate(rs.getDate("wdate"));
				vo.setReadnum(rs.getInt("readnum"));
				vo.setHostip(rs.getString("hostip"));
				vo.setContent(rs.getString("content"));
			}
			return vo;
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
		return null;
	}
	
	//게시글 내용 가져오기(수정용)
	public BoardVo getBoardContent(int idx,String pwd) {
		try {		
			sql = "select * from board where idx = ? and pwd = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setTitle(rs.getString("title"));
				vo.setPwd(rs.getString("pwd"));
				vo.setWdate(rs.getDate("wdate"));
				vo.setReadnum(rs.getInt("readnum"));
				vo.setHostip(rs.getString("hostip"));
				vo.setContent(rs.getString("content"));
			}
			return vo;
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
		return null;
	}
	
	public int boardUpdate(int idx, BoardVo vo){
		try {
			sql ="update board set title=?, pwd=?, hostip=?, content=? where idx =" +idx;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getHostip());
			pstmt.setString(4, vo.getContent());
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			System.out.println("SQL Error" + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return 0;
	}

	//검색기를 통한 '제목/글쓴이/글내용' 검색해서 가져오기
	public ArrayList<BoardVo> getBoardSearch(String search, String searchStr, int startNo, int pageSize) {
		ArrayList<BoardVo> vos= new ArrayList<BoardVo>();
		try {
			//sql = "select * from board where "+search+" like ? order by idx desc limit ?,?";
			
			sql = "select A.* , b.cnt" + 
					" from board A" + 
					" left outer join (select count(*) as cnt , board_idx from board_cont group by board_idx) B" + 
					" on A.idx = B.board_idx" + 
					" where "+search+" like ?"+
					" order by idx desc limit ?,?";
			String searchKey = "%"+searchStr+"%";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchKey);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()){
				vo = new BoardVo();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setTitle(rs.getString("title"));
				vo.setPwd(rs.getString("pwd"));
				vo.setWdate(rs.getDate("wdate"));
				vo.setReadnum(rs.getInt("readnum"));
				vo.setHostip(rs.getString("hostip"));
				vo.setContent(rs.getString("content"));
				vo.setContCnt(rs.getInt("cnt"));
				vos.add(vo);
			}
			return vos;
		} catch (SQLException e) {
			System.out.println("SQL Error" + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		
		return null;
	}

	//게시글 삭제
	public int boardDelete(int idx,String pwd) {
		try {			
			int res = getSearch(idx,pwd);
			System.out.println(res);
			if(res == 0) {
				return 0;
			}
			
			sql = "delete from board_cont where board_idx = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete from board where idx = ?;";
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
	
	//게시글 유무확인
	private int getSearch(int idx, String pwd) {
		try {
			sql = "select idx from board where idx = ? and pwd=? ;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();;
			if(rs.next()) {
				return 1;
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

	//댓글가져오기
	public ArrayList<BoardContVo> getcontList(int idx) {
		ArrayList<BoardContVo> cvos= new ArrayList<BoardContVo>();
		BoardContVo cvo = null;
		try {
			sql = "select * from board_cont where board_idx = ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()){
				cvo = new BoardContVo();
				cvo.setIdx(rs.getInt("idx"));
				cvo.setBoard_idx(rs.getInt("board_idx"));
				cvo.setNickname(rs.getString("nickname"));
				cvo.setWdate(rs.getString("wdate"));
				cvo.setHostip(rs.getString("hostip"));
				cvo.setContent(rs.getString("content"));
				cvos.add(cvo);
			}
			return cvos;
		} catch (SQLException e) {
			System.out.println("SQL Error" + e.getMessage());
			System.out.println("sql>>  "  + sql);
		}finally {
			pstmtClose();
			rsClose();
		}
		
		return null;
	}
	
	//댓글 입력하기
	public void boardContInput(BoardContVo cvo) {
		try {
			sql ="insert into board_cont values (default,?,?,default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cvo.getBoard_idx());
			pstmt.setString(2, cvo.getNickname());
			pstmt.setString(3, cvo.getHostip());
			pstmt.setString(4, cvo.getContent());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL Error" + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		
	}

	//댓글삭제하기
	public void replyDel(int idx) {
		try {
			sql = "delete from board_cont where idx = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("SQL Error" + e.getMessage());
		} finally {
			pstmtClose();
			rsClose();
		}		
		
	}

	//이전글,다음글 return
	public int keySearch(String str, int idx) {
		if(str.equals("pre")) {
			try {
				sql = "select idx from board where idx < ? order by idx desc limit 1;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(str.equals("next")) {
			try {
				sql = "select idx from board where idx > ? order by idx limit 1;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;

	}

	//이전글,다음글 인덱스 찾아오기
	public int keySearch(String search, String searchStr,String str, int idx) {
		if(str.equals("pre")) {
			try {
				sql = "select idx from board where "+search+" like ? and idx < ? order by idx desc limit 1;";
				pstmt = conn.prepareStatement(sql);
				String searchKey = "%"+searchStr+"%";
				pstmt.setString(1, searchKey);
				pstmt.setInt(2, idx);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(str.equals("next")) {
			try {
				sql = "select idx from board where "+search+" like ? and idx > ? order by idx limit 1;";
				pstmt = conn.prepareStatement(sql);
				String searchKey = "%"+searchStr+"%";
				pstmt.setString(1, searchKey);
				pstmt.setInt(2, idx);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;

	}

	
}

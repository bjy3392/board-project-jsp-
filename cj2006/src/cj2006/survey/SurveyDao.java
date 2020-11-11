package cj2006.survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.conn.GetConn;

public class SurveyDao {
	private Connection conn = GetConn.getInstance().getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	
	private SurveyVo vo = null;
		
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

	//등록된 설문지 리스트 가져오기
	public ArrayList<SurveyVo> sList(String sdate) {
		ArrayList<SurveyVo> vos = new ArrayList<SurveyVo>();
		try {
			sql = "select * from survey where sdate = ? order by sdate desc;";
			pstmt=  conn.prepareStatement(sql);
			pstmt.setString(1, sdate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new SurveyVo();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setSdate(rs.getString("sdate"));
				vo.setKwajung(rs.getString("kwajung"));
				vo.setKwamok(rs.getString("kwamok"));
				vo.setKcode(rs.getString("kcode"));
				vo.setDanwi(rs.getString("danwi"));
				vo.setWdate(rs.getString("wdate"));
				
				//설문지 응답 횟수
				vo.setAnswerCnt(answerCnt(rs.getInt("idx")));
				
				vos.add(vo);
			}
			return vos;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return null;
	}

	private int answerCnt(int idx) {
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		try {
			sql = "select count(*) from survey_answer where survey_idx= ? ";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, idx);
			rs2 = pstmt2.executeQuery();
			while(rs2.next()) {
				return rs2.getInt(1);				
			}
			
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			if(rs2 != null)
				try {
					rs2.close();
					if(pstmt2 != null) pstmt2.close();
				} catch (SQLException e) {}
		}
		return 0;
	}

	public ArrayList<String> sDate() {
		ArrayList<String> sdateArr = new ArrayList<String>(); //ArrayList 혹은 벡터로 고쳐서 동적배열로 나올게 할 수 있다.
		int cnt = 0;
		try {
			sql = "select sdate from survey group by sdate";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				sdateArr.add(rs.getString("sdate"));
				cnt++;
			}
			
			return sdateArr;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return null;
	}
	
	
	public int sInput(HttpServletRequest request, HttpServletResponse response) {
		try {
			sql = "insert into survey values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("sdate"));
			pstmt.setString(2, request.getParameter("kwajung"));
			pstmt.setString(3, request.getParameter("kwamok"));
			pstmt.setString(4, request.getParameter("kcode"));
			pstmt.setString(5, request.getParameter("danwi"));
			pstmt.setString(6, request.getParameter("wdate"));
			pstmt.setString(7, request.getParameter("question1"));
			pstmt.setString(8, request.getParameter("question2"));
			pstmt.setString(9, request.getParameter("question3"));
			pstmt.setString(10, request.getParameter("question4"));
			pstmt.setString(11, request.getParameter("question5"));
			pstmt.setString(12, request.getParameter("question6"));
			pstmt.setString(13, request.getParameter("question7"));
			pstmt.setString(14, request.getParameter("question8"));
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return 0;
	}
	
	//설문 항목에 해당하는 내역가져오기
	public SurveyVo sAnswerInput(int idx) {
		try {
			sql = "select * from survey where idx = ?;";
			pstmt=  conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new SurveyVo();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setSdate(rs.getString("sdate"));
				vo.setKwajung(rs.getString("kwajung"));
				vo.setKwamok(rs.getString("kwamok"));
				vo.setKcode(rs.getString("kcode"));
				vo.setDanwi(rs.getString("danwi"));
				vo.setWdate(rs.getString("wdate"));
				vo.setQuestion1(rs.getString("question1"));
				vo.setQuestion2(rs.getString("question2"));
				vo.setQuestion3(rs.getString("question3"));
				vo.setQuestion4(rs.getString("question4"));
				vo.setQuestion5(rs.getString("question5"));
				vo.setQuestion6(rs.getString("question6"));
				vo.setQuestion7(rs.getString("question7"));
				vo.setQuestion8(rs.getString("question8"));
			}
			return vo;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return null;
	}

	public int sAnswerInputOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			sql = "insert into survey_answer values (default,?,?,?,?,?,?,?,?,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("survey_idx")));
			pstmt.setInt(2, Integer.parseInt(request.getParameter("answer1")));
			pstmt.setInt(3, Integer.parseInt(request.getParameter("answer2")));
			pstmt.setInt(4, Integer.parseInt(request.getParameter("answer3")));
			pstmt.setInt(5, Integer.parseInt(request.getParameter("answer4")));
			pstmt.setInt(6, Integer.parseInt(request.getParameter("answer5")));
			pstmt.setInt(7, Integer.parseInt(request.getParameter("answer6")));
			pstmt.setInt(8, Integer.parseInt(request.getParameter("answer7")));
			pstmt.setString(9, request.getParameter("answer8"));
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return 0;
	}

	public int sUpdateOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			sql = "update survey set kwamok=?,kcode=?,danwi=?,wdate=?,question1=?,question2=?,question3=?,question4=?,question5=?,question6=?,question7=?,question8=? where idx = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("kwamok"));
			pstmt.setString(2, request.getParameter("kcode"));
			pstmt.setString(3, request.getParameter("danwi"));
			pstmt.setString(4, request.getParameter("wdate"));
			pstmt.setString(5, request.getParameter("question1"));
			pstmt.setString(6, request.getParameter("question2"));
			pstmt.setString(7, request.getParameter("question3"));
			pstmt.setString(8, request.getParameter("question4"));
			pstmt.setString(9, request.getParameter("question5"));
			pstmt.setString(10, request.getParameter("question6"));
			pstmt.setString(11, request.getParameter("question7"));
			pstmt.setString(12, request.getParameter("question8"));
			pstmt.setInt(13, Integer.parseInt(request.getParameter("idx")));
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return 0;
	}

	//설문지 삭제 처리
	public int sDelete(int idx) {
		try {
			//답변을 먼저 지우고 설문을 삭제한다.
			sql = "delete from survey_answer where survey_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			pstmtClose();
			
			sql = "delete from survey where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return 0;
	}

	public SurveyAnswerVo aSList(int survey_idx, int curNo) {
		SurveyAnswerVo vo = new SurveyAnswerVo();
		
		vo.setAnswerCnt(answerCnt(survey_idx));  //설문지에 응답한 자료의 개수를 가져온다.
		
		try {
			sql = "select a.sdate,a.kwajung,a.kwamok,a.kcode,a.danwi,a.wdate,a.question1,a.question2,a.question3,a.question4,a.question5,a.question6,a.question7,a.question8" +
				  " , b.* " + 
				  "from survey a " + 
				  "join survey_answer b " + 
				  "on a.idx = b.survey_idx " + 
				  "where a.idx = ?";
			pstmt=  conn.prepareStatement(sql);
			pstmt.setInt(1, survey_idx);
			rs = pstmt.executeQuery();
			
			for(int i=1; i<=curNo; i++) {
				rs.next();
			}
			vo.setCurNo(curNo);
			
			vo.setSdate(rs.getString("sdate"));
			vo.setKwajung(rs.getString("kwajung"));
			vo.setKwamok(rs.getString("kwamok"));
			vo.setKcode(rs.getString("kcode"));
			vo.setDanwi(rs.getString("danwi"));
			vo.setWdate(rs.getString("wdate"));
			vo.setQuestion1(rs.getString("question1"));
			vo.setQuestion2(rs.getString("question2"));
			vo.setQuestion3(rs.getString("question3"));
			vo.setQuestion4(rs.getString("question4"));
			vo.setQuestion5(rs.getString("question5"));
			vo.setQuestion6(rs.getString("question6"));
			vo.setQuestion7(rs.getString("question7"));
			vo.setQuestion8(rs.getString("question8"));
			
			vo.setIdx(rs.getInt("idx"));
			vo.setSurvey_idx(rs.getInt("survey_idx"));
			vo.setAnswer1(rs.getInt("answer1"));
			vo.setAnswer2(rs.getInt("answer2"));
			vo.setAnswer3(rs.getInt("answer3"));
			vo.setAnswer4(rs.getInt("answer4"));
			vo.setAnswer5(rs.getInt("answer5"));
			vo.setAnswer6(rs.getInt("answer6"));
			vo.setAnswer7(rs.getInt("answer7"));
			vo.setAnswer8(rs.getString("answer8"));
			
			return vo;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return null;
	}

	public void sAnswerDelete(int idx) {
		try {
			sql = "delete from survey_answer where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
	}

	public SurveyAnswerVo sResult(int idx) {
		SurveyAnswerVo vo = new SurveyAnswerVo();
		String[] question= new String[7];  //질문문항 1~7까지 얻기위한 배열
		
		vo.setAnswerCnt(answerCnt(idx));
		
		try {
			sql = "select * from survey where idx = ?";
			pstmt=  conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setSdate(rs.getString("sdate"));
			vo.setKwajung(rs.getString("kwajung"));
			vo.setKwamok(rs.getString("kwamok"));
			vo.setKcode(rs.getString("kcode"));
			vo.setDanwi(rs.getString("danwi"));
			vo.setWdate(rs.getString("wdate"));
			
			//설문문항을 배열에 저장시켜처리(결과보기에서 배열로 출력하기 위함)
			question[0] = rs.getString("question1");
			question[1] =rs.getString("question2");
			question[2] =rs.getString("question3");
			question[3] =rs.getString("question4");
			question[4] =rs.getString("question5");
			question[5] =rs.getString("question6");
			question[6] =rs.getString("question7");
			vo.setQuestion(question);  //1~7번 질문항목에 저장후 vo1차원 필드에 저장한다.
			vo.setQuestion8(rs.getString("question8"));
			
			vo.setSurveyAnswer(resultCalc(idx));
			
			vo.setAnswer8(resultAnswer8(idx));
			
			return vo;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return null;
	}

	
	// 현 설문지의 각각의 답변 문항에 대한 합계를 처리하는 메소드
	private int[][] resultCalc(int survey_idx) {
		int[][] surveyAnswer = new int[7][5];
		
		try {
			String strAnswer = "";
			for(int i=0; i<surveyAnswer.length; i++) {
				for(int j=0; j<surveyAnswer[i].length; j++) {
					strAnswer = "answer" + (i+1);
					sql = "select count(*) from survey_answer where survey_idx= ? and "+ strAnswer +"=? ";
					pstmt= conn.prepareStatement(sql);
					pstmt.setInt(1, survey_idx);
					pstmt.setInt(2, 5-j);
					rs = pstmt.executeQuery();
					rs.next();
					surveyAnswer[i][j] = rs.getInt(1);
				}
			}
		}
		catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		
		return surveyAnswer;
	}
	
	//질문지 8번 문항의 냐역을 누적시커 저장후 반환시켜주는 메소드
	private String resultAnswer8(int idx) {
		String answer8 = "";
		try {
			sql = "select answer8 from survey_answer where survey_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString(1) != null) {
					answer8 +="#" + rs.getString(1) + "\n";
				}
			}
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		return answer8;
	}

	public ArrayList<SurveyAnswerVo> sAnswerTotalPrint(int idx) {
		ArrayList<SurveyAnswerVo> vos = new ArrayList<SurveyAnswerVo>();
		
		int answerCnt = answerCnt(idx);  //전체 건수 가져오기
		
		try {
			sql = "select a.sdate,a.kwajung,a.kwamok,a.kcode,a.danwi,a.wdate,a.question1,a.question2,a.question3,a.question4,a.question5,a.question6,a.question7,a.question8" +
				  " , b.* " + 
				  "from survey a " + 
				  "join survey_answer b " + 
				  "on a.idx = b.survey_idx " + 
				  "where a.idx = ?";
			pstmt=  conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SurveyAnswerVo vo = new SurveyAnswerVo();
				vo.setSdate(rs.getString("sdate"));
				vo.setKwajung(rs.getString("kwajung"));
				vo.setKwamok(rs.getString("kwamok"));
				vo.setKcode(rs.getString("kcode"));
				vo.setDanwi(rs.getString("danwi"));
				vo.setWdate(rs.getString("wdate"));
				vo.setQuestion1(rs.getString("question1"));
				vo.setQuestion2(rs.getString("question2"));
				vo.setQuestion3(rs.getString("question3"));
				vo.setQuestion4(rs.getString("question4"));
				vo.setQuestion5(rs.getString("question5"));
				vo.setQuestion6(rs.getString("question6"));
				vo.setQuestion7(rs.getString("question7"));
				vo.setQuestion8(rs.getString("question8"));
				
				vo.setIdx(rs.getInt("idx"));
				vo.setSurvey_idx(rs.getInt("survey_idx"));
				vo.setAnswer1(rs.getInt("answer1"));
				vo.setAnswer2(rs.getInt("answer2"));
				vo.setAnswer3(rs.getInt("answer3"));
				vo.setAnswer4(rs.getInt("answer4"));
				vo.setAnswer5(rs.getInt("answer5"));
				vo.setAnswer6(rs.getInt("answer6"));
				vo.setAnswer7(rs.getInt("answer7"));
				vo.setAnswer8(rs.getString("answer8"));
				vo.setAnswerCnt(answerCnt);
				
				vos.add(vo);
			}
			return vos;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
			System.out.println("sql>>  "  + sql);
		} finally {
			pstmtClose();
			rsClose();
		}
		
		return null;
	}
	
}
















package cj2006.survey;

import java.util.Arrays;

public class SurveyAnswerVo {
	private int idx;
	private int survey_idx,answer1,answer2,answer3,answer4,answer5,answer6,answer7;
	private String answer8;
	
	//aSList에서 필요한 항목
	private int answerCnt; //현재 설문지에 답변한 총 인원수
	private String sdate,kwajung,kwamok,kcode,danwi,wdate,question1,question2,question3,question4,question5,question6,question7,question8;
	
	private int curNo; //현재 설문지의 페이지 번호
	
	private int[][] surveyAnswer; //설문통계 결과를 담기위한 2차원 배열(7행 5열)
	
	private String[] question; //설문퉁계에서 질문문항을 배열로 처리하기 위함
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSurvey_idx() {
		return survey_idx;
	}
	public void setSurvey_idx(int survey_idx) {
		this.survey_idx = survey_idx;
	}
	public int getAnswer1() {
		return answer1;
	}
	public void setAnswer1(int answer1) {
		this.answer1 = answer1;
	}
	public int getAnswer2() {
		return answer2;
	}
	public void setAnswer2(int answer2) {
		this.answer2 = answer2;
	}
	public int getAnswer3() {
		return answer3;
	}
	public void setAnswer3(int answer3) {
		this.answer3 = answer3;
	}
	public int getAnswer4() {
		return answer4;
	}
	public void setAnswer4(int answer4) {
		this.answer4 = answer4;
	}
	public int getAnswer5() {
		return answer5;
	}
	public void setAnswer5(int answer5) {
		this.answer5 = answer5;
	}
	public int getAnswer6() {
		return answer6;
	}
	public void setAnswer6(int answer6) {
		this.answer6 = answer6;
	}
	public int getAnswer7() {
		return answer7;
	}
	public void setAnswer7(int answer7) {
		this.answer7 = answer7;
	}
	public String getAnswer8() {
		return answer8;
	}
	public void setAnswer8(String answer8) {
		this.answer8 = answer8;
	}
	
	//aSList에서 필요한 항목
	public int getAnswerCnt() {
		return answerCnt;
	}
	public void setAnswerCnt(int answerCnt) {
		this.answerCnt = answerCnt;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getKwajung() {
		return kwajung;
	}
	public void setKwajung(String kwajung) {
		this.kwajung = kwajung;
	}
	public String getKwamok() {
		return kwamok;
	}
	public void setKwamok(String kwamok) {
		this.kwamok = kwamok;
	}
	public String getKcode() {
		return kcode;
	}
	public void setKcode(String kcode) {
		this.kcode = kcode;
	}
	public String getDanwi() {
		return danwi;
	}
	public void setDanwi(String danwi) {
		this.danwi = danwi;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getQuestion1() {
		return question1;
	}
	public void setQuestion1(String question1) {
		this.question1 = question1;
	}
	public String getQuestion2() {
		return question2;
	}
	public void setQuestion2(String question2) {
		this.question2 = question2;
	}
	public String getQuestion3() {
		return question3;
	}
	public void setQuestion3(String question3) {
		this.question3 = question3;
	}
	public String getQuestion4() {
		return question4;
	}
	public void setQuestion4(String question4) {
		this.question4 = question4;
	}
	public String getQuestion5() {
		return question5;
	}
	public void setQuestion5(String question5) {
		this.question5 = question5;
	}
	public String getQuestion6() {
		return question6;
	}
	public void setQuestion6(String question6) {
		this.question6 = question6;
	}
	public String getQuestion7() {
		return question7;
	}
	public void setQuestion7(String question7) {
		this.question7 = question7;
	}
	public String getQuestion8() {
		return question8;
	}
	public void setQuestion8(String question8) {
		this.question8 = question8;
	}
	
	
	public int getCurNo() {
		return curNo;
	}
	public void setCurNo(int curNo) {
		this.curNo = curNo;
	}
	
	public int[][] getSurveyAnswer() {
		return surveyAnswer;
	}
	public void setSurveyAnswer(int[][] surveyAnswer) {
		this.surveyAnswer = surveyAnswer;
	}
	
	
	public String[] getQuestion() {
		return question;
	}
	public void setQuestion(String[] question) {
		this.question = question;
	}
	@Override
	public String toString() {
		return "SurveyAnswerVo [idx=" + idx + ", survey_idx=" + survey_idx + ", answer1=" + answer1 + ", answer2="
				+ answer2 + ", answer3=" + answer3 + ", answer4=" + answer4 + ", answer5=" + answer5 + ", answer6="
				+ answer6 + ", answer7=" + answer7 + ", answer8=" + answer8 + ", answerCnt=" + answerCnt + ", sdate="
				+ sdate + ", kwajung=" + kwajung + ", kwamok=" + kwamok + ", kcode=" + kcode + ", danwi=" + danwi
				+ ", wdate=" + wdate + ", question1=" + question1 + ", question2=" + question2 + ", question3="
				+ question3 + ", question4=" + question4 + ", question5=" + question5 + ", question6=" + question6
				+ ", question7=" + question7 + ", question8=" + question8 + ", curNo=" + curNo + ", surveyAnswer="
				+ Arrays.toString(surveyAnswer) + ", question=" + Arrays.toString(question) + "]";
	}
	
	
	
	
	
}

package cj2006.survey;

import java.util.Arrays;

public class SurveyVo {
	private int idx;
	private String sdate,kwajung,kwamok,kcode,danwi,wdate,question1,question2,question3,question4,question5,question6,question7,question8;
	
	private int answerCnt; //설문지 응답 횟수
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public int getAnswerCnt() {
		return answerCnt;
	}
	public void setAnswerCnt(int answerCnt) {
		this.answerCnt = answerCnt;
	}
	@Override
	public String toString() {
		return "SurveyVo [idx=" + idx + ", sdate=" + sdate + ", kwajung=" + kwajung + ", kwamok=" + kwamok + ", kcode="
				+ kcode + ", danwi=" + danwi + ", wdate=" + wdate + ", question1=" + question1 + ", question2="
				+ question2 + ", question3=" + question3 + ", question4=" + question4 + ", question5=" + question5
				+ ", question6=" + question6 + ", question7=" + question7 + ", question8=" + question8 + ", answerCnt="
				+ answerCnt + "]";
	}
	
}

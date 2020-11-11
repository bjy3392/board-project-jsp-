package cj2006.board;

import java.util.Date;

public class BoardVo {
	private int idx, readnum;
	private String name, email, homepage, title, pwd, hostip, content; 
	private Date wdate;

	//게시물이 24시간 이내인것은 'new' 표시를 위한 변수 2개 설정
	private String wCdate;
	private int wNdate;
	
	//댓글갯수
	private int contCnt;

	//이전글,다음글 을 위한 필드 추가
	private int preIdx;
	private int nextIdx;
	private String preTitle;
	private String nextTitle;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getReadnum() {
		return readnum;
	}
	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHostip() {
		return hostip;
	}
	public void setHostip(String hostip) {
		this.hostip = hostip;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public String getwCdate() {
		return wCdate;
	}
	public void setwCdate(String wCdate) {
		this.wCdate = wCdate;
	}
	public int getwNdate() {
		return wNdate;
	}
	public void setwNdate(int wNdate) {
		this.wNdate = wNdate;
	}	
	
	public int getContCnt() {
		return contCnt;
	}
	public void setContCnt(int contCnt) {
		this.contCnt = contCnt;
	}	
	public int getPreIdx() {
		return preIdx;
	}
	public void setPreIdx(int preIdx) {
		this.preIdx = preIdx;
	}
	public int getNextIdx() {
		return nextIdx;
	}
	public void setNextIdx(int nextIdx) {
		this.nextIdx = nextIdx;
	}
	public String getPreTitle() {
		return preTitle;
	}
	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}
	public String getNaextTitle() {
		return nextTitle;
	}
	public void setNaextTitle(String naextTitle) {
		this.nextTitle = naextTitle;
	}
	@Override
	public String toString() {
		return "BoardVo [idx=" + idx + ", readnum=" + readnum + ", name=" + name + ", email=" + email + ", homepage="
				+ homepage + ", title=" + title + ", pwd=" + pwd + ", hostip=" + hostip + ", content=" + content
				+ ", wdate=" + wdate + ", wCdate=" + wCdate + ", wNdate=" + wNdate + ", contCnt=" + contCnt
				+ ", preIdx=" + preIdx + ", nextIdx=" + nextIdx + ", preTitle=" + preTitle + ", naextTitle="
				+ nextTitle + "]";
	}
}

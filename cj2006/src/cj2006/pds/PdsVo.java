package cj2006.pds;

public class PdsVo {
	private int idx,downnum;
	private String nickname,fname,rfname,title,part,pwd,fdate,fsize,opensw,content;
	public int getIdx() {
		return idx;
	}
	
	//날짜룰 숫자로 변환하여 저장하는 필드설정
	private int fNdate;
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getDownnum() {
		return downnum;
	}
	public void setDownnum(int downnum) {
		this.downnum = downnum;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getRfname() {
		return rfname;
	}
	public void setRfname(String rfname) {
		this.rfname = rfname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
	public String getFsize() {
		return fsize;
	}
	public void setFsize(String fsize) {
		this.fsize = fsize;
	}
	public String getOpensw() {
		return opensw;
	}
	public void setOpensw(String opensw) {
		this.opensw = opensw;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getfNdate() {
		return fNdate;
	}
	public void setfNdate(int fNdate) {
		this.fNdate = fNdate;
	}
	@Override
	public String toString() {
		return "PdsVo [idx=" + idx + ", downnum=" + downnum + ", nickname=" + nickname + ", fname=" + fname
				+ ", rfname=" + rfname + ", title=" + title + ", part=" + part + ", pwd=" + pwd + ", fdate=" + fdate
				+ ", fsize=" + fsize + ", opensw=" + opensw + ", content=" + content + ", fNdate=" + fNdate + "]";
	}
	
	

	
}

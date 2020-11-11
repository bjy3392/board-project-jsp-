package T0918;

public class LoginVo {
	private String name;
	private int kor;
	private int math;
	private int eng;
	private int tot;
	private int avg;
	
	public LoginVo() {}
	
	
	public LoginVo(String name, int kor, int math, int eng, int tot, int avg) {
		super();
		this.name = name;
		this.kor = kor;
		this.math = math;
		this.eng = eng;
		this.tot = tot;
		this.avg = avg;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getKor() {
		return kor;
	}


	public void setKor(int kor) {
		this.kor = kor;
	}


	public int getMath() {
		return math;
	}


	public void setMath(int math) {
		this.math = math;
	}


	public int getEng() {
		return eng;
	}


	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getTot() {
		return tot;
	}


	public void setTot() {
		this.tot = kor + eng + math;
	}


	public int getAvg() {
		return avg;
	}


	public void setAvg() {
		this.avg = tot/3;
	}


	@Override
	public String toString() {
		return "LoginVo [name=" + name + ", kor=" + kor + ", math=" + math + ", eng=" + eng + ", tot=" + tot + ", avg="
				+ avg + "]";
	}


	
	
	
	
}

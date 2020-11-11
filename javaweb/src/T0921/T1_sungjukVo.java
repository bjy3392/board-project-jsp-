package T0921;

public class T1_sungjukVo {
	private String hakbun, name;
	private int kor, eng, mat, tot;
	private double avg;
	private char grade;
	
	public T1_sungjukVo() {}
	
	public T1_sungjukVo(String hakbun, String name, int kor, int eng, int mat) {
		this.hakbun = hakbun;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	public String getHakbun() {
		return hakbun;
	}

	public void setHakbun(String hakbun) {
		this.hakbun = hakbun;
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
		if(kor>=0 && kor<=100)
			this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		if(eng>=0 && eng<=100)
			this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		if(mat>=0 && mat<=100)
			this.mat = mat;
	}

	public int getTot() {
		tot = kor + eng + mat;
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public double getAvg() {
		avg = tot/3.0;
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public char getGrade() {
		if(avg>=90) grade='A';
		else if(avg>=80) grade='B';
		else if(avg>=70) grade='C';
		else if(avg>=60) grade='D';
		else grade='F';
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "T1_sungjukVo [hakbun=" + hakbun + ", name=" + name + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat
				+ "]";
	}
	
	
	
	
	
}

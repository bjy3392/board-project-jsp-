package cj2006.study.el;

public class ElVo {
	private String mid, pwd, name, age, atom;

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAtom() {
		return atom;
	}

	public void setAtom(String atom) {
		this.atom = atom;
	}

	@Override
	public String toString() {
		return "ElVo [mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", age=" + age + ", atom=" + atom + "]";
	}
	
	
}

package T0918;

public class Test8Vo {
	private String name;
	private int age;
	private String mid;
	private String pwd;
	
	public Test8Vo() {}
	
	public Test8Vo(String name, int age, String mid, String pwd) {
		super();
		this.name = name;
		this.age = age;
		this.mid = mid;
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
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
	
	@Override
	public String toString() {
		return "Test8Vo [name=" + name + ", age=" + age + ", mid=" + mid + ", pwd=" + pwd + "]";
	}
	
	
}

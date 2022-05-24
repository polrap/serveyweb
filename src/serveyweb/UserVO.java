package serveyweb;

public class UserVO {
	private long serveycode;
	private long age;
	private char gender;
	private long count;
	public UserVO() {}
	
	public UserVO(long serveyCode, long age, char gender) {
		super();
		this.serveycode = serveyCode;
		this.age = age;
		this.gender = gender;
		this.count=1;
	}
	public long getServeyCode() {
		return serveycode;
	}
	public void setServeyCode(long serveyCode) {
		this.serveycode = serveyCode;
	}
	public long getAge() {
		return age;
	}
	public void setAge(long age) {
		this.age = age;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	
}

package serveyweb;

public class ServeyVO {

	private String serveyname;
	private long serveyCode;
	private long serveycount;
	public ServeyVO() {
	}
	public ServeyVO(String serveyname, long serveycode, long serveycount) {
		super();
		this.serveyname = serveyname;
		this.serveyCode = serveycode;
		this.serveycount = serveycount;
	}

	@Override
	public String toString() {
		return "[" + serveyname + "]";
	}
	
	public String inString() {
		return "[장르명:\t" + serveyname + "]\t[득표 수:\t" + serveycount
				+ "]";
	}

	public String getServeyname() {
		return serveyname;
	}
	
	public void setServeyname(String serveyname) {
		this.serveyname = serveyname;
	}
	public long getServeycode() {
		return serveyCode;
	}
	public void setServeycode(long serveycode) {
		this.serveyCode = serveycode;
	}
	public long getServeycount() {
		return serveycount;
	}
	public void setServeycount(long serveycount) {
		this.serveycount = serveycount;
	}
	
}

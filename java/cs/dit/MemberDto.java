package cs.dit;

public class MemberDto {
	private String id;
	private String pwd;
	private String nickname;
	private String name;
	private String phone;
	private String email;
	
	public MemberDto() {};
	
	public MemberDto(String id) {
		this.id = id;
	}
	
	public MemberDto(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}
	
	public MemberDto(String id, String pwd, String nickname, String name, String phone, String email) {
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
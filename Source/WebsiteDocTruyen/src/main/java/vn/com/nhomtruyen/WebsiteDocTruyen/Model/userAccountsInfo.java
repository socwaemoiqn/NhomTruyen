package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class userAccountsInfo {
	private int id;
	private String userName;
	private String passWord;
	private String role;
	private String trangThai;
	private String ngayTao;
	public userAccountsInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public userAccountsInfo(int id, String userName, String passWord, String role, String trangThai, String ngayTao) {
		super();
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.role = role;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
}

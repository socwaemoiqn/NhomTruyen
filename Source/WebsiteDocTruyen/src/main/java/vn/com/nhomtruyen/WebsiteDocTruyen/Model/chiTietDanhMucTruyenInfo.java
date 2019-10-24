package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class chiTietDanhMucTruyenInfo {

	private int id;
	private int maTruyen;
	private String tenDanhMuc;
	public chiTietDanhMucTruyenInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public chiTietDanhMucTruyenInfo(int id, int maTruyen, String tenDanhMuc) {
		super();
		this.id = id;
		this.maTruyen = maTruyen;
		this.tenDanhMuc = tenDanhMuc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMaTruyen() {
		return maTruyen;
	}
	public void setMaTruyen(int maTruyen) {
		this.maTruyen = maTruyen;
	}
	public String getTenDanhMuc() {
		return tenDanhMuc;
	}
	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}
	
	
	
}

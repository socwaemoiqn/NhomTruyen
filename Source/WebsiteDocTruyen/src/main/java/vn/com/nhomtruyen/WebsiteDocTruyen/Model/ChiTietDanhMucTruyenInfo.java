package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class ChiTietDanhMucTruyenInfo {

	private int id;
	private int maTruyen;
	private int maDanhMuc;
	private String tenDanhMuc;
	
	
	public ChiTietDanhMucTruyenInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChiTietDanhMucTruyenInfo(int maTruyen, int maDanhMuc, String tenDanhMuc) {
		super();
		this.maTruyen = maTruyen;
		this.maDanhMuc = maDanhMuc;
		this.tenDanhMuc = tenDanhMuc;
	}
	public ChiTietDanhMucTruyenInfo(int id, int maTruyen, int maDanhMuc, String tenDanhMuc) {
		super();
		this.id = id;
		this.maTruyen = maTruyen;
		this.maDanhMuc = maDanhMuc;
		this.tenDanhMuc = tenDanhMuc;
	}
	
	public ChiTietDanhMucTruyenInfo(int maTruyen, int maDanhMuc) {
		super();
		this.maTruyen = maTruyen;
		this.maDanhMuc = maDanhMuc;
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
	public int getMaDanhMuc() {
		return maDanhMuc;
	}
	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}
	public String getTenDanhMuc() {
		return tenDanhMuc;
	}
	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}	
}

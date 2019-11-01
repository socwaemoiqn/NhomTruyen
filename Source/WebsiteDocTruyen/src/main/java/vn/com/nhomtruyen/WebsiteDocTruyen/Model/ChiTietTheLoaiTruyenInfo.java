package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class ChiTietTheLoaiTruyenInfo {
	private int id;
	private int maTruyen;
	private int maTheLoai;
	private String tenTheLoai;
	public ChiTietTheLoaiTruyenInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChiTietTheLoaiTruyenInfo(int maTruyen, int maTheLoai) {
		super();
		this.maTruyen = maTruyen;
		this.maTheLoai = maTheLoai;
	}
	public ChiTietTheLoaiTruyenInfo(int id, int maTruyen, int maTheLoai, String tenTheLoai) {
		super();
		this.id = id;
		this.maTruyen = maTruyen;
		this.maTheLoai = maTheLoai;
		this.tenTheLoai = tenTheLoai;
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
	public int getMaTheLoai() {
		return maTheLoai;
	}
	public void setMaTheLoai(int maTheLoai) {
		this.maTheLoai = maTheLoai;
	}
	public String getTenTheLoai() {
		return tenTheLoai;
	}
	public void setTenTheLoai(String tenTheLoai) {
		this.tenTheLoai = tenTheLoai;
	}
	
	
}

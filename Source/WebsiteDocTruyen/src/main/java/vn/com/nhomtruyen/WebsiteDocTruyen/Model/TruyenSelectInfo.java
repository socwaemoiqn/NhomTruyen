package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class TruyenSelectInfo {
	private String hinhAnh;
	private int ID;
	private String tenTruyen;
	private String tenTacGia;
	private int soChuong;
	private int luotXem;
	private String trangThai;
	public TruyenSelectInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TruyenSelectInfo(String hinhAnh, int iD, String tenTruyen, String tenTacGia, int soChuong, int luotXem,
			String trangThai) {
		super();
		this.hinhAnh = hinhAnh;
		ID = iD;
		this.tenTruyen = tenTruyen;
		this.tenTacGia = tenTacGia;
		this.soChuong = soChuong;
		this.luotXem = luotXem;
		this.trangThai = trangThai;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTenTruyen() {
		return tenTruyen;
	}
	public void setTenTruyen(String tenTruyen) {
		this.tenTruyen = tenTruyen;
	}
	public String getTenTacGia() {
		return tenTacGia;
	}
	public void setTenTacGia(String tenTacGia) {
		this.tenTacGia = tenTacGia;
	}
	public int getSoChuong() {
		return soChuong;
	}
	public void setSoChuong(int soChuong) {
		this.soChuong = soChuong;
	}
	public int getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(int luotXem) {
		this.luotXem = luotXem;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	
}

package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class TruyenSelectInfo {
	private String hinhAnh;
	private String ID;
	private String tenTruyen;
	private String tenTacGia;
	private int soChuong;
	private int luotXem;
	private String trangThai;
	private String ngayTao;
	public TruyenSelectInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TruyenSelectInfo(String hinhAnh, String iD, String tenTruyen, String tenTacGia, int soChuong, int luotXem,
			String trangThai, String ngayTao) {
		super();
		this.hinhAnh = hinhAnh;
		ID = iD;
		this.tenTruyen = tenTruyen;
		this.tenTacGia = tenTacGia;
		this.soChuong = soChuong;
		this.luotXem = luotXem;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
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

	public String getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
	
}

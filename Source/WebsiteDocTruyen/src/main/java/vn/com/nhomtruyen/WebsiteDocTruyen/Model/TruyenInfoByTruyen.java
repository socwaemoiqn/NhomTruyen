package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class TruyenInfoByTruyen {
	private int ID;
	private String tenTruyen;
	private String tenTacGia;
	private int soChuong;
	private String gioiThieu;
	private String tenNhomDich;
	private int luotXem;
	private String nguon;
	private String hinhAnh;
	private String trangThai;
	private String ngayTao;
	public TruyenInfoByTruyen() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TruyenInfoByTruyen(int iD, String tenTruyen, String tenTacGia, int soChuong, String gioiThieu,
			String tenNhomDich, int luotXem, String nguon, String hinhAnh, String trangThai, String ngayTao) {
		super();
		ID = iD;
		this.tenTruyen = tenTruyen;
		this.tenTacGia = tenTacGia;
		this.soChuong = soChuong;
		this.gioiThieu = gioiThieu;
		this.tenNhomDich = tenNhomDich;
		this.luotXem = luotXem;
		this.nguon = nguon;
		this.hinhAnh = hinhAnh;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
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
	public String getGioiThieu() {
		return gioiThieu;
	}
	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
	}
	public String getTenNhomDich() {
		return tenNhomDich;
	}
	public void setTenNhomDich(String tenNhomDich) {
		this.tenNhomDich = tenNhomDich;
	}
	public int getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(int luotXem) {
		this.luotXem = luotXem;
	}
	public String getNguon() {
		return nguon;
	}
	public void setNguon(String nguon) {
		this.nguon = nguon;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
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

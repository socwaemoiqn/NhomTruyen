package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class TruyenInfo {

	private int ID;
	private String tenTruyen;
	private int maTacGia;
	private int maNhomDich;
	private int soChuong;
	private String gioiThieu;
	private int luotXem;
	private String nguon;
	private String hinhAnh;
	private String trangThai;
	private String ngayTao;

	public TruyenInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TruyenInfo(String tenTruyen, int maTacGia, int maNhomDich, int soChuong, String gioiThieu, int luotXem,
			String nguon, String hinhAnh, String trangThai, String ngayTao) {
		super();
		this.tenTruyen = tenTruyen;
		this.maTacGia = maTacGia;
		this.maNhomDich = maNhomDich;
		this.soChuong = soChuong;
		this.gioiThieu = gioiThieu;
		this.luotXem = luotXem;
		this.nguon = nguon;
		this.hinhAnh = hinhAnh;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}

	public TruyenInfo(int iD, String tenTruyen, int maTacGia, int maNhomDich, int soChuong, String gioiThieu,
			int luotXem, String nguon, String hinhAnh, String trangThai, String ngayTao) {
		super();
		ID = iD;
		this.tenTruyen = tenTruyen;
		this.maTacGia = maTacGia;
		this.maNhomDich = maNhomDich;
		this.soChuong = soChuong;
		this.gioiThieu = gioiThieu;
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

	public int getMaTacGia() {
		return maTacGia;
	}

	public void setMaTacGia(int maTacGia) {
		this.maTacGia = maTacGia;
	}

	public int getMaNhomDich() {
		return maNhomDich;
	}

	public void setMaNhomDich(int maNhomDich) {
		this.maNhomDich = maNhomDich;
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

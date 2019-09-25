package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class truyenInfo {

	private int ID;
	private String tenTruyen;
	private int IdTacGia;
	private int IdDanhMuc;
	private int IDTheLoai;
	private int soChuong;
	private String gioiThieu;
	private double luotXem;
	private String hinhAnh;
	private String trangThai;
	private String ngayTao;
	public truyenInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public truyenInfo(int iD, String tenTruyen, int idTacGia, int idDanhMuc, int iDTheLoai, int soChuong,
			String gioiThieu, double luotXem, String hinhAnh, String trangThai, String ngayTao) {
		super();
		ID = iD;
		this.tenTruyen = tenTruyen;
		IdTacGia = idTacGia;
		IdDanhMuc = idDanhMuc;
		IDTheLoai = iDTheLoai;
		this.soChuong = soChuong;
		this.gioiThieu = gioiThieu;
		this.luotXem = luotXem;
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
	public int getIdTacGia() {
		return IdTacGia;
	}
	public void setIdTacGia(int idTacGia) {
		IdTacGia = idTacGia;
	}
	public int getIdDanhMuc() {
		return IdDanhMuc;
	}
	public void setIdDanhMuc(int idDanhMuc) {
		IdDanhMuc = idDanhMuc;
	}
	public int getIDTheLoai() {
		return IDTheLoai;
	}
	public void setIDTheLoai(int iDTheLoai) {
		IDTheLoai = iDTheLoai;
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
	public double getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(double luotXem) {
		this.luotXem = luotXem;
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

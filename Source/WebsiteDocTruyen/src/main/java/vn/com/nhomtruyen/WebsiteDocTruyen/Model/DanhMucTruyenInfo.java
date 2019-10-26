package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class DanhMucTruyenInfo {
	
	private int id;
	private String tenDanhMuc;
	private String gioiThieu;
	private String trangThai;
	private String ngayTao;
	public DanhMucTruyenInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DanhMucTruyenInfo(int id, String tenDanhMuc, String gioiThieu, String trangThai, String ngayTao) {
		super();
		this.id = id;
		this.tenDanhMuc = tenDanhMuc;
		this.gioiThieu = gioiThieu;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}
	
	public DanhMucTruyenInfo(String tenDanhMuc, String gioiThieu, String trangThai, String ngayTao) {
		super();
		this.tenDanhMuc = tenDanhMuc;
		this.gioiThieu = gioiThieu;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenDanhMuc() {
		return tenDanhMuc;
	}
	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}
	public String getGioiThieu() {
		return gioiThieu;
	}
	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
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

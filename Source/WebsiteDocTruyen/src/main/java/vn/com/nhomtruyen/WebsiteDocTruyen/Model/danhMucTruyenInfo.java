package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class danhMucTruyenInfo {
	
	private String id;
	private String tenDanhMuc;
	private String gioiThieu;
	private String trangThai;
	private String ngayTao;
	public danhMucTruyenInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public danhMucTruyenInfo(String id, String tenDanhMuc, String gioiThieu, String trangThai, String ngayTao) {
		super();
		this.id = id;
		this.tenDanhMuc = tenDanhMuc;
		this.gioiThieu = gioiThieu;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}
	
	public danhMucTruyenInfo(String tenDanhMuc, String gioiThieu, String trangThai, String ngayTao) {
		super();
		this.tenDanhMuc = tenDanhMuc;
		this.gioiThieu = gioiThieu;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
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

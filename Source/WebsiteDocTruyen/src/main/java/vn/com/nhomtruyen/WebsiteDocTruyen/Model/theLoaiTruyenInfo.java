package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class theLoaiTruyenInfo {
	private String id;
	private String tenTheLoai;
	private String gioiThieu;
	private String trangThai;
	private String ngayTao;
	public theLoaiTruyenInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public theLoaiTruyenInfo(String id, String tenTheLoai, String gioiThieu, String trangThai, String ngayTao) {
		super();
		this.id = id;
		this.tenTheLoai = tenTheLoai;
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
	public String getTenTheLoai() {
		return tenTheLoai;
	}
	public void setTenTheLoai(String tenTheLoai) {
		this.tenTheLoai = tenTheLoai;
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

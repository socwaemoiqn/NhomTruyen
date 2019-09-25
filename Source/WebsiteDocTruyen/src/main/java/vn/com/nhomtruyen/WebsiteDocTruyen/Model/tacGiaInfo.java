package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class tacGiaInfo {
	private int ID;
	private String tenTacGia;
	private String gioiThieu;
	private String trangThai;
	private String ngayTao;
	public tacGiaInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public tacGiaInfo(int iD, String tenTacGia, String gioiThieu, String trangThai, String ngayTao) {
		super();
		ID = iD;
		this.tenTacGia = tenTacGia;
		this.gioiThieu = gioiThieu;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTenTacGia() {
		return tenTacGia;
	}
	public void setTenTacGia(String tenTacGia) {
		this.tenTacGia = tenTacGia;
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

package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class RoleInfo {
	private int maRole;
	private String tenRole;
	private String gioiThieu;
	private boolean trangThai;

	private String ngayTao;
	
	public RoleInfo() {}
	public RoleInfo(int maRole, String tenRole, String gioiThieu, boolean trangThai, String ngayTao) {
		super();
		this.maRole = maRole;
		this.tenRole = tenRole;
		this.gioiThieu = gioiThieu;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}
	public int getMaRole() {
		return maRole;
	}
	public void setMaRole(int maRole) {
		this.maRole = maRole;
	}
	public String getTenRole() {
		return tenRole;
	}
	public void setTenRole(String tenRole) {
		this.tenRole = tenRole;
	}
	public String getGioiThieu() {
		return gioiThieu;
	}
	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
	}
	public boolean isTrangThai() {
		return trangThai;
	}
	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
}

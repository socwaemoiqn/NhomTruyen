package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class taiKhoanInfo {

	private int maTaiKhoan;
	private String tenTaiKhoan;
	private String matKhau;
	private String tenRole;
	private String ngayTao;
	public taiKhoanInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public taiKhoanInfo(int maTaiKhoan, String tenTaiKhoan, String matKhau, String tenRole, String ngayTao) {
		super();
		this.maTaiKhoan = maTaiKhoan;
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.tenRole = tenRole;
		this.ngayTao = ngayTao;
	}
	public int getMaTaiKhoan() {
		return maTaiKhoan;
	}
	public void setMaTaiKhoan(int maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}
	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}
	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getTenRole() {
		return tenRole;
	}
	public void setTenRole(String tenRole) {
		this.tenRole = tenRole;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
}

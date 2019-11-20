package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class TaiKhoanInfo {

	private int maTaiKhoan;
	private String tenTaiKhoan;
	private String matKhau;
	private String email;
	private boolean trangThai;
	private String tenRole;
	private String ngayTao;
	private int maRole;
	public int getMaRole() {
		return maRole;
	}
	public void setMaRole(int maRole) {
		this.maRole = maRole;
	}
	public TaiKhoanInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TaiKhoanInfo(int maTaiKhoan, String tenTaiKhoan, String matKhau, String tenRole, String ngayTao) {
		super();
		this.maTaiKhoan = maTaiKhoan;
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.tenRole = tenRole;
		this.ngayTao = ngayTao;
	}
	public TaiKhoanInfo(int maTaiKhoan, String tenTaiKhoan, String matKhau, String email, boolean trangThai,
			String tenRole, String ngayTao) {
		super();
		this.maTaiKhoan = maTaiKhoan;
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.email = email;
		this.trangThai = trangThai;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isTrangThai() {
		return trangThai;
	}
	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}
	
}

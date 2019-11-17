package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbTAIKHOAN")
public class TaiKhoanEntity {
	private int maTaiKhoan;
	private String tenTaiKhoan;
	private String matKhau;
	private int maRole;
	private boolean trangThai;
	private String email;
	private String ngayTao;

	@Id
	@Column(name = "MaTaiKhoan")
	public int getMaTaiKhoan() {
		return maTaiKhoan;
	}

	public void setMaTaiKhoan(int maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}

	@Column(name = "TenTaiKhoan")
	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}

	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}

	@Column(name = "MatKhau")
	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	@Column(name = "MaRole")
	public int getMaRole() {
		return maRole;
	}

	public void setMaRole(int maRole) {
		this.maRole = maRole;
	}

	@Column(name = "NgayTao")
	public String getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	@Column(name = "TrangThai")
	public boolean isTrangThai() {
		return trangThai;
	}

	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}
	@Column(name = "Email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}

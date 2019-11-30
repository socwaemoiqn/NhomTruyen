package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "tbphanhoi")
public class PhanHoiEntity {
	private int maPhanHoi;
	private String chuDe;
	private String tenNguoiGui;
	private String email;
	private String noiDung;
	private Boolean daXem;
	private String ngayTao;
	
	@Id
	@Column(name = "MaPhanHoi")
	public int getMaPhanHoi() {
		return maPhanHoi;
	}
	public void setMaPhanHoi(int maPhanHoi) {
		this.maPhanHoi = maPhanHoi;
	}
	@Column(name = "ChuDe")
	public String getChuDe() {
		return chuDe;
	}
	public void setChuDe(String chuDe) {
		this.chuDe = chuDe;
	}
	@Column(name = "TenNguoiGui")
	public String getTenNguoiGui() {
		return tenNguoiGui;
	}
	public void setTenNguoiGui(String tenNguoiGui) {
		this.tenNguoiGui = tenNguoiGui;
	}
	@Column(name = "Email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name = "NoiDung")
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	@Column(name = "DaXem")
	public Boolean getDaXem() {
		return daXem;
	}
	public void setDaXem(Boolean daXem) {
		this.daXem = daXem;
	}
	@Column(name = "NgayTao")
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
	
}

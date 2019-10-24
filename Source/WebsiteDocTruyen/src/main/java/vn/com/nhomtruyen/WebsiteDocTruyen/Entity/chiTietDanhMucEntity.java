package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="tbchitietdanhmuc")
public class chiTietDanhMucEntity {

	private int maChiTiet;
	private int maTruyen;
	private int maDanhMuc;
	
	@Id
	@Column(name ="MaChiTietDanhMuc")
	public int getMaChiTiet() {
		return maChiTiet;
	}
	public void setMaChiTiet(int maChiTiet) {
		this.maChiTiet = maChiTiet;
	}
	@Column(name ="MaTruyen")
	public int getMaTruyen() {
		return maTruyen;
	}
	public void setMaTruyen(int maTruyen) {
		this.maTruyen = maTruyen;
	}
	@Column(name ="MaDanhMuc")
	public int getMaDanhMuc() {
		return maDanhMuc;
	}
	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}
	
}

package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbCHUONG")
public class chuongEntity {
	
	private int id;
	private int maTruyen;
	private String tieuDe;
	private String noiDung;
	private String trangThai;
	private String ngayTao;
	
	@Id
	@Column(name="MaChuong")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="MaTruyen")
	public int getIDTruyen() {
		return maTruyen;
	}
	public void setIDTruyen(int iDTruyen) {
		maTruyen = iDTruyen;
	}
	@Column(name="TenChuong")
	public String getTieuDe() {
		return tieuDe;
	}
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
	@Column(name="NoiDung")
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	@Column(name="TrangThai")
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	@Column(name="NgayTao")
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
}

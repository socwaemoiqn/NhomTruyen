package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbCHUONG")
public class ChuongEntity {

	private String id;
	private String maTruyen;
	private String tieuDe;
	private String noiDung;
	private int trangThai;
	private String ngayTao;

	@Id
	@Column(name = "MaChuong")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "MaTruyen")
	public String getIDTruyen() {
		return maTruyen;
	}

	public void setIDTruyen(String iDTruyen) {
		maTruyen = iDTruyen;
	}

	@Column(name = "TenChuong")
	public String getTieuDe() {
		return tieuDe;
	}

	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}

	@Column(name = "NoiDung")
	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	@Column(name = "TrangThai")
	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	@Column(name = "NgayTao")
	public String getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}

}

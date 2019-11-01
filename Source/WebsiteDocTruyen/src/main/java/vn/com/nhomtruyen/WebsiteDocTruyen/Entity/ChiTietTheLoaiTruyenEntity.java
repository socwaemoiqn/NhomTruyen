package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbCHITIETTHELOAI")
public class ChiTietTheLoaiTruyenEntity {
	private int id;
	private int maTruyen;
	private int maTheLoai;
	
	@Id
	@Column(name="MaChiTietTheLoai")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="MaTruyen")
	public int getMaTruyen() {
		return maTruyen;
	}
	public void setMaTruyen(int maTruyen) {
		this.maTruyen = maTruyen;
	}
	@Column(name="MaTheLoai")
	public int getMaTheLoai() {
		return maTheLoai;
	}
	public void setMaTheLoai(int maTheLoai) {
		this.maTheLoai = maTheLoai;
	}
	
}

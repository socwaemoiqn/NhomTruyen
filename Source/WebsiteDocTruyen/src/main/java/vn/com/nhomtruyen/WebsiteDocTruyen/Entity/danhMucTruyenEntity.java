package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbDANHMUCTRUYEN")
public class danhMucTruyenEntity {
	
	private String id;
	private String tenDanhMuc;
	private String gioiThieu;
	private String trangThai;
	private String ngayTao;
	
	@Id
	@Column(name = "IDDanhMuc")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(name = "TenDanhMuc")
	public String getTenDanhMuc() {
		return tenDanhMuc;
	}
	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}
	@Column(name = "GioiThieu")
	public String getGioiThieu() {
		return gioiThieu;
	}
	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
	}
	@Column(name = "TrangThai")
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
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

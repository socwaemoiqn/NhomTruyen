package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbNHOMDICH")
public class nhomDichEntity {
	private int maNhomDich;
	private String tenNhomDich;
	private String ngayTao;
	private String trangThai;
	
	@Id
	@Column(name = "MaNhomDich")
	public int getMaNhomDich() {
		return maNhomDich;
	}
	public void setMaNhomDich(int maNhomDich) {
		this.maNhomDich = maNhomDich;
	}
	@Column(name = "TenNhomDich")
	public String getTenNhomDich() {
		return tenNhomDich;
	}
	public void setTenNhomDich(String tenNhomDich) {
		this.tenNhomDich = tenNhomDich;
	}
	
	@Column(name = "NgayTao")
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	@Column(name = "TrangThai")
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	
}

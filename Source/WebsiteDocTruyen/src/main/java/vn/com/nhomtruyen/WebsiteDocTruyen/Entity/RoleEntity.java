package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbrole")
public class RoleEntity {
	private int maRole;
	private String tenRole;
	private String gioiThieu;
	private boolean trangThai;
	private String ngayTao;
	
	@Id
	@Column(name = "MaRole")
	public int getMaRole() {
		return maRole;
	}
	public void setMaRole(int maRole) {
		this.maRole = maRole;
	}
	@Column(name = "TenRole")
	public String getTenRole() {
		return tenRole;
	}
	public void setTenRole(String tenRole) {
		this.tenRole = tenRole;
	}
	@Column(name = "GioiThieu")
	public String getGioiThieu() {
		return gioiThieu;
	}
	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
	}
	@Column(name = "TrangThai")
	public boolean isTrangThai() {
		return trangThai;
	}
	public void setTrangThai(boolean trangThai) {
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

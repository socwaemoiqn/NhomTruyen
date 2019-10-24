package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbtruyen")
public class truyenEntity {

	private int ID;
	private String tenTruyen;
	private int maTacGia;
	private int maNhomDich;
	private int soChuong;
	private String gioiThieu;
	private int luotXem;
	private String nguon;
	private String hinhAnh;
	private String trangThai;
	private String ngayTao;
	

	@Id
	@Column(name="MaTruyen")	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	@Column(name="TenTruyen")	
	public String getTenTruyen() {
		return tenTruyen;
	}
	public void setTenTruyen(String tenTruyen) {
		this.tenTruyen = tenTruyen;
	}
	@Column(name="MaTacGia")	
	public int getMaTacGia() {
		return maTacGia;
	}
	public void setMaTacGia(int maTacGia) {
		this.maTacGia = maTacGia;
	}
	@Column(name="MaNhomDich")	
	public int getMaNhomDich() {
		return maNhomDich;
	}
	public void setMaNhomDich(int maNhomDich) {
		this.maNhomDich = maNhomDich;
	}
	@Column(name="SoChuong")	
	public int getSoChuong() {
		return soChuong;
	}
	public void setSoChuong(int soChuong) {
		this.soChuong = soChuong;
	}
	@Column(name="GioiThieu")	
	public String getGioiThieu() {
		return gioiThieu;
	}
	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
	}
	@Column(name="LuotXem")	
	public int getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(int luotXem) {
		this.luotXem = luotXem;
	}
	@Column(name="Nguon")	
	public String getNguon() {
		return nguon;
	}
	public void setNguon(String nguon) {
		this.nguon = nguon;
	}
	@Column(name="HinhAnh")	
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
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

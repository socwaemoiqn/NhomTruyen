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
	private int IdTacGia;
	private int IdDanhMuc;
	private int IDTheLoai;
	private int soChuong;
	private String gioiThieu;
	private double luotXem;
	private String hinhAnh;
	private String trangThai;
	private String ngayTao;
	
	
	@Id
	@Column(name="ID")
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
	@Column(name="IDTacGia")
	public int getIdTacGia() {
		return IdTacGia;
	}
	public void setIdTacGia(int idTacGia) {
		IdTacGia = idTacGia;
	}
	@Column(name="IDDanhMuc")
	public int getIdDanhMuc() {
		return IdDanhMuc;
	}
	public void setIdDanhMuc(int idDanhMuc) {
		IdDanhMuc = idDanhMuc;
	}
	@Column(name="IDTheLoai")
	public int getIDTheLoai() {
		return IDTheLoai;
	}
	public void setIDTheLoai(int iDTheLoai) {
		IDTheLoai = iDTheLoai;
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
	public double getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(double luotXem) {
		this.luotXem = luotXem;
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

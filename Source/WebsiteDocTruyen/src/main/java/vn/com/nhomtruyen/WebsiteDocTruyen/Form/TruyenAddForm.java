package vn.com.nhomtruyen.WebsiteDocTruyen.Form;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class TruyenAddForm {

	private String tenTruyen;
	// Upload files.
    private CommonsMultipartFile[] hinhAnh;
    
    private int maTacGia;
    private int soChuong;
    private int maDanhMuc[];
    private int maTheLoai[];
    private String nguon;
    private String gioiThieu;
    
    
	public String getNguon() {
		return nguon;
	}
	public void setNguon(String nguon) {
		this.nguon = nguon;
	}
	public String getTenTruyen() {
		return tenTruyen;
	}
	public void setTenTruyen(String tenTruyen) {
		this.tenTruyen = tenTruyen;
	}
	public CommonsMultipartFile[] getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(CommonsMultipartFile[] hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public int getMaTacGia() {
		return maTacGia;
	}
	public void setMaTacGia(int maTacGia) {
		this.maTacGia = maTacGia;
	}
	public int getSoChuong() {
		return soChuong;
	}
	public void setSoChuong(int soChuong) {
		this.soChuong = soChuong;
	}
	public int[] getMaDanhMuc() {
		return maDanhMuc;
	}
	public void setMaDanhMuc(int[] maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}
	
	public int[] getMaTheLoai() {
		return maTheLoai;
	}
	public void setMaTheLoai(int[] maTheLoai) {
		this.maTheLoai = maTheLoai;
	}
	public String getGioiThieu() {
		return gioiThieu;
	}
	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
	}
    
	
}

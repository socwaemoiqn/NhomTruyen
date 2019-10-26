package vn.com.nhomtruyen.WebsiteDocTruyen.Form;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class DanhMucAddForm {

	private String tenTruyen;
	// Upload files.
    private CommonsMultipartFile[] fileDatas;
    
    private int maTacGia;
    private int soChuong;
    private int maDanhMuc;
    private int maTheLoai;
    private String gioiThieu;
    
	public String getTenTruyen() {
		return tenTruyen;
	}
	public void setTenTruyen(String tenTruyen) {
		this.tenTruyen = tenTruyen;
	}
	public CommonsMultipartFile[] getFileDatas() {
		return fileDatas;
	}
	public void setFileDatas(CommonsMultipartFile[] fileDatas) {
		this.fileDatas = fileDatas;
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
	public int getMaDanhMuc() {
		return maDanhMuc;
	}
	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}
	public int getMaTheLoai() {
		return maTheLoai;
	}
	public void setMaTheLoai(int maTheLoai) {
		this.maTheLoai = maTheLoai;
	}
	public String getGioiThieu() {
		return gioiThieu;
	}
	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
	}
    
    
}

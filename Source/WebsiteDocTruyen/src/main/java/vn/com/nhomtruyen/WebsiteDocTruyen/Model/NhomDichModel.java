package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class NhomDichModel {
	private int maNhomDich;
	private String tenNhomDich;
	private String ngayTao;
	private String trangThai;
	public NhomDichModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NhomDichModel(int maNhomDich, String tenNhomDich, String ngayTao, String trangThai) {
		super();
		this.maNhomDich = maNhomDich;
		this.tenNhomDich = tenNhomDich;
		this.ngayTao = ngayTao;
		this.trangThai = trangThai;
	}
	public int getMaNhomDich() {
		return maNhomDich;
	}
	public void setMaNhomDich(int maNhomDich) {
		this.maNhomDich = maNhomDich;
	}
	public String getTenNhomDich() {
		return tenNhomDich;
	}
	public void setTenNhomDich(String tenNhomDich) {
		this.tenNhomDich = tenNhomDich;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	
}

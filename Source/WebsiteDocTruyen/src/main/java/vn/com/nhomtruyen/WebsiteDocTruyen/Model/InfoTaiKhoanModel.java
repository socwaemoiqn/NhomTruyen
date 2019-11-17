package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class InfoTaiKhoanModel {
	private int id;
	private int maTaiKhoan;
	private String hoTen;
	private String sdt;
	private String ngayTao;
	public InfoTaiKhoanModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public InfoTaiKhoanModel(int id, int maTaiKhoan, String hoTen, String sdt, String ngayTao) {
		super();
		this.id = id;
		this.maTaiKhoan = maTaiKhoan;
		this.hoTen = hoTen;
		this.sdt = sdt;
		this.ngayTao = ngayTao;
	}

	public InfoTaiKhoanModel(int maTaiKhoan, String hoTen, String sdt, String ngayTao) {
		super();
		this.maTaiKhoan = maTaiKhoan;
		this.hoTen = hoTen;
		this.sdt = sdt;
		this.ngayTao = ngayTao;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMaTaiKhoan() {
		return maTaiKhoan;
	}
	public void setMaTaiKhoan(int maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}

	
	
}

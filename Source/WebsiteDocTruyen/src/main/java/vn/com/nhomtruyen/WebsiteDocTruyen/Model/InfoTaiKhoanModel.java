package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class InfoTaiKhoanModel {
	private int id;
	private String maTaiKhoan;
	private String hoTen;
	private String mail;
	private String sdt;
	private String ngayTao;
	public InfoTaiKhoanModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public InfoTaiKhoanModel(int id, String maTaiKhoan, String hoTen, String mail, String sdt, String ngayTao) {
		super();
		this.id = id;
		this.maTaiKhoan = maTaiKhoan;
		this.hoTen = hoTen;
		this.mail = mail;
		this.sdt = sdt;
		this.ngayTao = ngayTao;
	}

	public InfoTaiKhoanModel(String maTaiKhoan, String hoTen, String mail, String sdt, String ngayTao) {
		super();
		this.maTaiKhoan = maTaiKhoan;
		this.hoTen = hoTen;
		this.mail = mail;
		this.sdt = sdt;
		this.ngayTao = ngayTao;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMaTaiKhoan() {
		return maTaiKhoan;
	}
	public void setMaTaiKhoan(String maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
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

package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class PhanHoiInfo {
	private int maPhanHoi;
	private String chuDe;
	private String tenNguoiGui;
	private String email;
	private String noiDung;
	private Boolean daXem;
	private String ngayTao;
	public PhanHoiInfo() {}
	public PhanHoiInfo(int maPhanHoi, String chuDe, String tenNguoiGui, String email,String noiDung, Boolean daXem, String ngayTao) {
		super();
		this.maPhanHoi = maPhanHoi;
		this.chuDe = chuDe;
		this.tenNguoiGui = tenNguoiGui;
		this.email = email;
		this.noiDung = noiDung;
		this.daXem = daXem;
		this.ngayTao = ngayTao;
	}
	public int getMaPhanHoi() {
		return maPhanHoi;
	}
	public void setMaPhanHoi(int maPhanHoi) {
		this.maPhanHoi = maPhanHoi;
	}
	public String getChuDe() {
		return chuDe;
	}
	public void setChuDe(String chuDe) {
		this.chuDe = chuDe;
	}
	public String getTenNguoiGui() {
		return tenNguoiGui;
	}
	public void setTenNguoiGui(String tenNguoiGui) {
		this.tenNguoiGui = tenNguoiGui;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	public Boolean getDaXem() {
		return daXem;
	}
	public void setDaXem(Boolean daXem) {
		this.daXem = daXem;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
}

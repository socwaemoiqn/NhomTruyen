package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class ChuongInfo {

	private int id;
	private String IDTruyen;
	private String tieuDe;
	private String noiDung;
	private String trangThai;
	private String ngayTao;
	public ChuongInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChuongInfo(int id, String iDTruyen, String tieuDe, String noiDung, String trangThai, String ngayTao) {
		super();
		this.id = id;
		IDTruyen = iDTruyen;
		this.tieuDe = tieuDe;
		this.noiDung = noiDung;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIDTruyen() {
		return IDTruyen;
	}
	public void setIDTruyen(String iDTruyen) {
		IDTruyen = iDTruyen;
	}
	public String getTieuDe() {
		return tieuDe;
	}
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
	
}

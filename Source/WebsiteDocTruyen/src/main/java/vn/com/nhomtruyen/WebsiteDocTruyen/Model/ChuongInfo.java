package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class ChuongInfo {

	private String id;
	private String IDTruyen;
	private String tieuDe;
	private String noiDung;
	private int trangThai;
	private String ngayTao;
	public ChuongInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChuongInfo(String id, String iDTruyen, String tieuDe, String noiDung, int trangThai, String ngayTao) {
		super();
		this.id = id;
		IDTruyen = iDTruyen;
		this.tieuDe = tieuDe;
		this.noiDung = noiDung;
		this.trangThai = trangThai;
		this.ngayTao = ngayTao;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public int getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
}

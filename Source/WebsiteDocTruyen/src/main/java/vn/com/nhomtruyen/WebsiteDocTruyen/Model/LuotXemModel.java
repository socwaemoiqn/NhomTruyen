package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class LuotXemModel {
	private int id;
	private int luotXem;
	private String maTruyen;
	public LuotXemModel() {
		super();
	}
	private String ngayXem;
	public LuotXemModel(int id, int luotXem, String maTruyen, String ngayXem) {
		super();
		this.id = id;
		this.luotXem = luotXem;
		this.maTruyen = maTruyen;
		this.ngayXem = ngayXem;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(int luotXem) {
		this.luotXem = luotXem;
	}
	public String getMaTruyen() {
		return maTruyen;
	}
	public void setMaTruyen(String maTruyen) {
		this.maTruyen = maTruyen;
	}
	public String getNgayXem() {
		return ngayXem;
	}
	public void setNgayXem(String ngayXem) {
		this.ngayXem = ngayXem;
	}
}

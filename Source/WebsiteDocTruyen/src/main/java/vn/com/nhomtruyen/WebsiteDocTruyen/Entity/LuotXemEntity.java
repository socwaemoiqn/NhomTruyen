package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="tbluotxem")
public class LuotXemEntity {
	private int id;
	private int luotXem;
	private String maTruyen;
	private String ngayXem;
	@Id
	@Column(name = "id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "luotXem")
	public int getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(int luotXem) {
		this.luotXem = luotXem;
	}
	@Column(name = "maTruyen")
	public String getMaTruyen() {
		return maTruyen;
	}
	public void setMaTruyen(String maTruyen) {
		this.maTruyen = maTruyen;
	}
	@Column(name = "ngayXem")
	public String getNgayXem() {
		return ngayXem;
	}
	public void setNgayXem(String ngayXem) {
		this.ngayXem = ngayXem;
	}
	
}

package vn.com.nhomtruyen.WebsiteDocTruyen.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbROLE")
public class roleEntity {
	private int maRole;
	private String tenRole;
	
	
	@Id
	@Column(name = "MaRole")
	public int getMaRole() {
		return maRole;
	}
	public void setMaRole(int maRole) {
		this.maRole = maRole;
	}
	@Column(name = "TenRole")
	public String getTenRole() {
		return tenRole;
	}
	public void setTenRole(String tenRole) {
		this.tenRole = tenRole;
	}
	
}

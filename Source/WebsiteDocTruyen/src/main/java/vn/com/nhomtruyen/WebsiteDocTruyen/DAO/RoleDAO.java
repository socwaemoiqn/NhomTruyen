package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.RoleInfo;
@Transactional
public interface RoleDAO {
	public List<RoleInfo> getListRole();
}

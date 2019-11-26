package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.RoleEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.RoleInfo;
@Transactional
public interface RoleDAO {
	public List<RoleInfo> getListRole();
	public PaginationResult<RoleInfo> paginationListRole(int page,int Max_Result, int Max_Navigation);
	public RoleInfo getRoleById(int maRole);
	public PaginationResult<RoleInfo> getRoleByTen(int page,int Max_Result, int Max_Navigation,String ten);
	public void insert(RoleInfo RoleInfo);
	public void edit(RoleInfo RoleInfo);
	public void xoa(int maRole);
	public RoleEntity findRoleEntity(int maRole);
	public void updateTrangThai(RoleInfo RoleInfo);
}

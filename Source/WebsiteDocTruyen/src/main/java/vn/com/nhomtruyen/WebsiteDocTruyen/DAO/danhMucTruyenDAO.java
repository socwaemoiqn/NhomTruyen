package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.danhMucTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.danhMucTruyenInfo;

@Transactional
public interface danhMucTruyenDAO {
	
	public List<danhMucTruyenInfo> dsDanhMucTruyen();
	public PaginationResult<danhMucTruyenInfo> listDanhMucTruyen(int page, int maxResult, int maxNavigationPage);
	public danhMucTruyenEntity findDanhMucTruyenEntity(String id); 
	public void insertDanhMucTruyen(danhMucTruyenInfo danhMucTruyenInfo); 
	public void deleteDanhMucTruyen(String id);
}

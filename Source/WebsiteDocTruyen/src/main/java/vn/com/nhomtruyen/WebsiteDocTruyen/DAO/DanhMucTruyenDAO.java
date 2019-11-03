package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.DanhMucTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;

@Transactional
public interface DanhMucTruyenDAO {
	
	public List<DanhMucTruyenInfo> dsDanhMucTruyen();
	public PaginationResult<DanhMucTruyenInfo> listDanhMucTruyen(int page, int maxResult, int maxNavigationPage);
	public DanhMucTruyenEntity findDanhMucTruyenEntity(int id); 
	public DanhMucTruyenInfo findDanhMucTruyenInfo(int id);
	public void insertDanhMucTruyen(DanhMucTruyenInfo danhMucTruyenInfo); 
	public void deleteDanhMucTruyen(int id);
	public List<ChiTietDanhMucTruyenInfo> listTenDMByMaTruyen(String maTruyen);
	public List<ChiTietDanhMucTruyenInfo> listTenDM();
	

	public void InsertChiTietDanhMuc(ChiTietDanhMucTruyenInfo chiTietDanhMucTruyenInfo);
}

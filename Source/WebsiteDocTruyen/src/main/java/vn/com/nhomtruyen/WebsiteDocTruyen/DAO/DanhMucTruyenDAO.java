package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.ChiTietDanhMucEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.DanhMucTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;

@Transactional
public interface DanhMucTruyenDAO {
	
	public List<DanhMucTruyenInfo> dsDanhMucTruyen();
	public PaginationResult<DanhMucTruyenInfo> listDanhMucTruyen(int page, int maxResult, int maxNavigationPage);
	public PaginationResult<DanhMucTruyenInfo> searchDanhMuc(String tuKhoa,int page, int maxResult, int maxNavigationPage);
	public List<ChiTietDanhMucTruyenInfo> listTenDMByMaTruyen(String maTruyen);
	public List<ChiTietDanhMucTruyenInfo> listTenDM();
	
	public DanhMucTruyenEntity findDanhMucTruyenEntity(int id); 
	public DanhMucTruyenInfo findDanhMucTruyenInfo(int id);
	
	public void insertDanhMucTruyen(DanhMucTruyenInfo danhMucTruyenInfo); 
	public void insertChiTietDanhMuc(ChiTietDanhMucTruyenInfo chiTietDanhMucTruyenInfo);
	
	public void capNhatDanhMuc(DanhMucTruyenInfo danhMucTruyenInfo);
	public void capNhatTrangThaiDanhMuc(DanhMucTruyenInfo danhMucTruyenInfo);
	
	public void deleteDanhMucTruyen(int id);
	public void deleteChiTietDanhMuc(ChiTietDanhMucEntity chiTietDanhMucEntity);

	
}

package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.PhanHoiEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PhanHoiInfo;

@Transactional
public interface PhanHoiDAO {
	public List<PhanHoiInfo> listPhanHoi();
	public PaginationResult<PhanHoiInfo> paginationListPhanHoi(int page,int Max_Result, int Max_Navigation);
	public PhanHoiInfo getPhanHoiById(int maPhanHoi);
	public PaginationResult<PhanHoiInfo> getPhanHoiBySearch(int page,int Max_Result, int Max_Navigation,Map<String,String> list);
	public void insert(PhanHoiInfo PhanHoiInfo);
	public void edit(PhanHoiInfo PhanHoiInfo);
	public void xoa(int maPhanHoi);
	public PhanHoiEntity findPhanHoiEntity(int maPhanHoi);
	public void updateTrangThai(PhanHoiInfo PhanHoiInfo);
}

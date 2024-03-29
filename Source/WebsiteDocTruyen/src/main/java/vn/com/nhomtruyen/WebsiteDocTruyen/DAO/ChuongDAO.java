package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.ChuongEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;

@Transactional
public interface ChuongDAO {
	public PaginationResult<ChuongInfo> listChuongOfTruyen(String idTruyen,String sort,int page, int maxResult, int maxNavigationPage);
	public PaginationResult<ChuongInfo> searchChuogn(String idTruyen,String tuKhoa,int page, int maxResult, int maxNavigationPage);
	public List<ChuongInfo> listChuongOfTruyenSortDESC(String maTruyen);
	public List<ChuongInfo> listChuongOfTruyenSortASC(String matruyen);
	public Map<String, String> listPathVariableString(String maTruyen);
	public ChuongEntity findChuongEntity(String idChuong);
	
	public ChuongInfo chuongInfo(String idChuong);
	public void insertChuong(ChuongInfo chuongInfo);
	public void upDateChuong(ChuongInfo chuongInfo);
	public void upDateTrangThaiChuong(ChuongInfo chuongInfo);
	public void deleteChuong(String idChuong);
	
}

package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;

@Transactional
public interface ChuongDAO {
	public PaginationResult<ChuongInfo> listChuongOfTruyen(String idTruyen,int page, int maxResult, int maxNavigationPage);
	public List<ChuongInfo> listChuongOfTruyen(String maTruyen);
	public ChuongInfo chuongOfID(String idChuong);
	public void insertChuong(ChuongInfo chuongInfo);
	public boolean upDataChuong(String tieuDe,String nd, String idChuong);
	public List<ChuongInfo> listChuongByIdTruyen(String matruyen);
	
}

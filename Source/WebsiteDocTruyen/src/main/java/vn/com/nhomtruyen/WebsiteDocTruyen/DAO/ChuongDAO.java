package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;

@Transactional
public interface ChuongDAO {
	public PaginationResult<ChuongInfo> listChuongOfTruyen(int idTruyen,int page, int maxResult, int maxNavigationPage);
	public ChuongInfo chuongOfID(int idChuong);
	public boolean upDataChuong(String nd, int idChuong);
	public List<ChuongInfo> listChuongByIdTruyen(int matruyen);
}

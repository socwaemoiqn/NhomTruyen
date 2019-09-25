package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.chuongInfo;

@Transactional
public interface chuongDAO {
	public PaginationResult<chuongInfo> listChuongOfTruyen(int idTruyen,int page, int maxResult, int maxNavigationPage);
	public chuongInfo chuongOfID(int idChuong);
	public boolean upDataChuong(String nd, int idChuong);
}

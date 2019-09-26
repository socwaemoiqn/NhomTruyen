package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.theLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.theLoaiTruyenInfo;

@Transactional
public interface theLoaiTruyenDAO {

	public List<theLoaiTruyenInfo> dsTheLoai();
	public PaginationResult<theLoaiTruyenInfo> listTheLoaiTruyen(int page, int maxResult, int maxNavigationPage);
	public theLoaiTruyenEntity findTheLoaiTruyen(String id);
	public theLoaiTruyenInfo findTheLoaiTruen(String id);
	public void insertTheLoaiTruyen(theLoaiTruyenInfo theLoaiTruyenInfo);
}

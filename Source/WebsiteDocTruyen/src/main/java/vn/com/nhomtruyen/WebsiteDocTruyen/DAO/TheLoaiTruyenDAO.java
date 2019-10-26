package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Transactional
public interface TheLoaiTruyenDAO {

	public List<TheLoaiTruyenInfo> dsTheLoai();
	public PaginationResult<TheLoaiTruyenInfo> listTheLoaiTruyen(int page, int maxResult, int maxNavigationPage);
	public TheLoaiTruyenEntity findTheLoaiTruyen(String id);
	public TheLoaiTruyenInfo findTheLoaiTruen(String id);
	public void insertTheLoaiTruyen(TheLoaiTruyenInfo theLoaiTruyenInfo);
}

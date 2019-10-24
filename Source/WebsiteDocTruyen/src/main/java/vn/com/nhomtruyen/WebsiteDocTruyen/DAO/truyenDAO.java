package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenInfoByTruyen;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenSelectInfo;

@Transactional
public interface truyenDAO   {
	//public PaginationResult<truyenSelectInfo> litTruyen(int page, int maxResult, int maxNavigationPage);
	public PaginationResult<truyenSelectInfo> litsTruyen(int page, int maxResult, int maxNavigationPage);
	public truyenInfoByTruyen SelectTruyenByMa(int maTruyen);
	public List<truyenSelectInfo> listTR();
}

package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenSelectInfo;

@Transactional
public interface truyenDAO   {
	public PaginationResult<truyenSelectInfo> litTruyen(int page, int maxResult, int maxNavigationPage);
}

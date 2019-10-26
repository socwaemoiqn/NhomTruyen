package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfoByTruyen;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenSelectInfo;

@Transactional
public interface TruyenDAO   {
	//public PaginationResult<truyenSelectInfo> litTruyen(int page, int maxResult, int maxNavigationPage);
	public PaginationResult<TruyenSelectInfo> litsTruyen(int page, int maxResult, int maxNavigationPage);
	public TruyenInfoByTruyen SelectTruyenByMa(int maTruyen);
	public List<TruyenSelectInfo> listTR();
}

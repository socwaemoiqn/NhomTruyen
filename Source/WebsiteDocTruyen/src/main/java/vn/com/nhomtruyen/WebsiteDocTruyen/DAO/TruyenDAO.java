package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfo;

@Transactional
public interface TruyenDAO   {
	//public PaginationResult<truyenSelectInfo> litTruyen(int page, int maxResult, int maxNavigationPage);
	public PaginationResult<SelectTruyenInfo> litsTruyen(int page, int maxResult, int maxNavigationPage);
	public List<SelectTruyenInfo> listTruyen();
	public Map<String, String> listPathVariableString();
	public SelectTruyenInfo selectTruyenByMa(String maTruyen);
	public int sumSoLuongTruyenOfTacGia(int maTacGia);
	public TruyenEntity findTruyenEntity(String maTruyen);
	public void insertTruyen(TruyenInfo truyenInfo);
	public void capNhatTruyen(TruyenInfo truyenInfo);
	public void capNhatTrangThaiTruyen(String maTruyen, String trangThai, boolean value);
	public void capNhatSoLuongChuong(String maTruyen, int soChuong);
	public void xoaTruyen(String maTruyen);
}

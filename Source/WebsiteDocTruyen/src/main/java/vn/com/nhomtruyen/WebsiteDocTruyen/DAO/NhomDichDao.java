package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.NhomDichEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.NhomDichModel;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Transactional
public interface NhomDichDao {
	public PaginationResult<NhomDichModel> listNhomDich(int page, int maxResult, int maxNavigationPage);
	public PaginationResult<NhomDichModel> searchNhomDich(String tuKhoa,int page, int maxResult, int maxNavigationPage);
	
	public void insertNhomDich(NhomDichModel nhomDichModel);
	
	//tim 
	public NhomDichEntity findNhomDichEntity(int id);
	public NhomDichModel findNhomDichModel(int id);
	//
	public void capNhatNhomDich(NhomDichModel nhomDichModel);
	
	public void xoaNhomDich(int id);
}

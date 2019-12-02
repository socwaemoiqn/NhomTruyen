package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.ChiTietTheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietTheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Transactional
public interface TheLoaiTruyenDAO {

	public List<TheLoaiTruyenInfo> dsTheLoai();
	public PaginationResult<TheLoaiTruyenInfo> listTheLoaiTruyen(int page, int maxResult, int maxNavigationPage);
	public PaginationResult<TheLoaiTruyenInfo> searchTheLoai(String tuKhoa,int page, int maxResult, int maxNavigationPage);
	public List<ChiTietTheLoaiTruyenInfo> listTenTlOfTruyen(String maTruyen);
	public List<ChiTietTheLoaiTruyenInfo> dsTenTheLoai();
	
	public int soLuongTruyenOfOneTheLoai(int maTheLoai);
	
	public TheLoaiTruyenEntity findTheLoaiTruyenEntity(int id);
	public TheLoaiTruyenInfo findTheLoaiTruyenInfo(int id);
	
	public List<ChiTietTheLoaiTruyenEntity> findChiTietTheLoaiEntity(String maTruyen);
	
	public void insertTheLoaiTruyen(TheLoaiTruyenInfo theLoaiTruyenInfo);
	public void insertChiTietTheLoai(ChiTietTheLoaiTruyenInfo chiTietTheLoaiTruyenInfo);
	
	public void capNhatTheLoaiTruyen(TheLoaiTruyenInfo theLoaiTruyenInfo);
	public void capNhatTrangThaiTheLoai(TheLoaiTruyenInfo theLoaiTruyenInfo);
	
	public void xoaChiTietTheLoaiTheoTruyen(String maTruyen);
	public void XoaTheLoaiTruyenTheoID(int id);
	
}

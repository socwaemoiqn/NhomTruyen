package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TaiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TaiKhoanInfo;

@Transactional
public interface TaiKhoanDAO {
	public List<TaiKhoanInfo> listTaiKhoan();
	public PaginationResult<TaiKhoanInfo> paginationListTaiKhoan(int page,int Max_Result, int Max_Navigation);
	public int getSoLuongTruyenById(int maTaiKhoan);
	public TaiKhoanInfo getTaiKhoanById(int maTaiKhoan);
	public PaginationResult<TaiKhoanInfo> getTaiKhoanByTen(int page,int Max_Result, int Max_Navigation,String ten);
	public TaiKhoanEntity insert(TaiKhoanInfo TaiKhoanInfo);
	public Boolean edit(TaiKhoanInfo TaiKhoanInfo);
	public void xoa(int maTaiKhoan);
	public TaiKhoanEntity findTaiKhoanEntity(int tenTaiKhoan);
	public void updateTrangThai(TaiKhoanInfo TaiKhoanInfo);
}

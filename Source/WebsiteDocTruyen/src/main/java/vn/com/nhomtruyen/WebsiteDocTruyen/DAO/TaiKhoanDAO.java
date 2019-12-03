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
	public TaiKhoanInfo getTaiKhoanById(int maTaiKhoan);
	public PaginationResult<TaiKhoanInfo> getTaiKhoanByTen(int page,int Max_Result, int Max_Navigation,String ten);
	public TaiKhoanEntity insert(TaiKhoanInfo TaiKhoanInfo);
	public void edit(TaiKhoanInfo TaiKhoanInfo);
	public void xoa(int maTaiKhoan);
	public TaiKhoanEntity findTaiKhoanEntity(int tenTaiKhoan);
	public TaiKhoanEntity findTaiKhoanEntityByTen(String tenTaiKhoan);
	public void updateTrangThai(TaiKhoanInfo TaiKhoanInfo);
}

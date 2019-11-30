package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;

@Transactional
public interface TacGiaDAO {
	
	public List<TacGiaInfo> listTacGia();
	public PaginationResult<TacGiaInfo> paginationListTacGia(int page,int Max_Result, int Max_Navigation);
	public int getSoLuongTruyenById(int maTacGia);
	public TacGiaInfo getTacGiaById(int maTacGia);
	public PaginationResult<TacGiaInfo> getTacGiaByTen(int page,int Max_Result, int Max_Navigation,String ten);
	public void insert(TacGiaInfo tacGiaInfo);
	public void edit(TacGiaInfo tacGiaInfo);
	public void xoa(int maTacGia);
	public TacGiaEntity findTacGiaEntity(int maTacGia);
	public void updateTrangThai(TacGiaInfo tacGiaInfo);
}


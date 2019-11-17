package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import com.mysql.cj.x.protobuf.MysqlxConnection.Close;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.RoleEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TaiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TaiKhoanInfo;


public class TaiKhoanImpl implements TaiKhoanDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TaiKhoanInfo> listTaiKhoan() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TaiKhoanInfo.class.getName()
				+ "(a.ID, a.tenTaiKhoan, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TaiKhoanEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return query.list();
	}

	@Override
	public PaginationResult<TaiKhoanInfo> paginationListTaiKhoan(int page, int Max_Result, int Max_Navigation) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TaiKhoanInfo.class.getName()
				+ "(a.maTaiKhoan, a.tenTaiKhoan,a.matKhau,a.email, a.trangThai,b.tenRole,a.ngayTao)" + " from "
				+ TaiKhoanEntity.class.getName() + " a, "+RoleEntity.class.getName()+" b where a.maRole = b.maRole";

		Query query = se.createQuery(sql);
		return new PaginationResult<TaiKhoanInfo>(query, page, Max_Result, Max_Navigation);
	}

	@Override
	public int getSoLuongTruyenById(int maTaiKhoan) {
			return 1;
	}

	@Override
	public TaiKhoanInfo getTaiKhoanById(int maTaiKhoan) {
return null;
	}

	@Override
	public PaginationResult<TaiKhoanInfo> getTaiKhoanByTen(int page,int Max_Result, int Max_Navigation,String ten) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TaiKhoanInfo.class.getName()
				+ "(a.maTaiKhoan, a.tenTaiKhoan,a.matKhau,a.email, a.trangThai,b.tenRole,a.ngayTao)" + " from "
				+ TaiKhoanEntity.class.getName() + " a, "+RoleEntity.class.getName() +  " b where a.maRole = b.maRole and a.tenTaiKhoan like :ten";

		Query query = se.createQuery(sql);
		query.setParameter("ten", "%"+ten+"%");
		return  new PaginationResult<TaiKhoanInfo>(query, page, Max_Result, Max_Navigation);
	}

	@Override
	public TaiKhoanEntity insert(TaiKhoanInfo taiKhoanInfo) {
		Session se = this.sessionFactory.getCurrentSession();
		TaiKhoanEntity taikhoan = new TaiKhoanEntity();
		taikhoan.setTenTaiKhoan(taiKhoanInfo.getTenTaiKhoan());
		taikhoan.setMatKhau(taiKhoanInfo.getMatKhau());
		taikhoan.setEmail(taiKhoanInfo.getEmail());
		taikhoan.setNgayTao(Helper.getCurrentDateAndTime());
		taikhoan.setMaRole(2);
		taikhoan.setTrangThai(true);
		se.save(taikhoan);
		return taikhoan;
	}
	
	@Override
	public Boolean edit(TaiKhoanInfo TaiKhoanInfo) {

		return false;
	}

	@Override
	public void xoa(int maTaiKhoan) {

	}
	@Override
	public TaiKhoanEntity findTaiKhoanEntity(int maTaiKhoan) {
		return null;
	}

	@Override
	public void updateTrangThai(TaiKhoanInfo TaiKhoanInfo) {

		
	}
}

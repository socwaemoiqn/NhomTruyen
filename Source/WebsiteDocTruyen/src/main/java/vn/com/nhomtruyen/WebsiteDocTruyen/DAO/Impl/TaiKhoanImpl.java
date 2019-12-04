package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.RoleEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TaiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
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
	public TaiKhoanInfo getTaiKhoanById(int maTaiKhoan) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TaiKhoanInfo.class.getName()
				+ "(a.maTaiKhoan, a.tenTaiKhoan,a.matKhau,a.email, a.trangThai,b.tenRole,a.ngayTao)" + " from "
				+ TaiKhoanEntity.class.getName() + " a, "+RoleEntity.class.getName()+" b where a.maRole = b.maRole and a.maTaiKhoan =: mtk";
		Query query = se.createQuery(sql);
		query.setParameter("mtk", maTaiKhoan);
		return (TaiKhoanInfo) query.uniqueResult();
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
	public void insert(TaiKhoanInfo taiKhoanInfo) {
		Session se = this.sessionFactory.getCurrentSession();
		TaiKhoanEntity taikhoan = new TaiKhoanEntity();
		taikhoan.setTenTaiKhoan(taiKhoanInfo.getTenTaiKhoan());
		taikhoan.setMatKhau(taiKhoanInfo.getMatKhau());
		taikhoan.setEmail(taiKhoanInfo.getEmail());
		taikhoan.setNgayTao(Helper.getCurrentDateAndTime());
		taikhoan.setMaRole(2);
		taikhoan.setTrangThai(true);
		se.save(taikhoan);
	}
	
	@Override
	public void edit(TaiKhoanInfo TaiKhoanInfo) {
		TaiKhoanEntity taikhoan = this.findTaiKhoanEntity(TaiKhoanInfo.getMaTaiKhoan());
		taikhoan.setMatKhau(TaiKhoanInfo.getMatKhau());
		taikhoan.setEmail(TaiKhoanInfo.getEmail());
		taikhoan.setTrangThai(TaiKhoanInfo.isTrangThai());
		taikhoan.setMaRole(TaiKhoanInfo.getMaRole());
		this.sessionFactory.getCurrentSession().update(taikhoan);
	}

	@Override
	public void xoa(int maTaiKhoan) {
		TaiKhoanEntity taikhoan = this.findTaiKhoanEntity(maTaiKhoan);
		this.sessionFactory.getCurrentSession().delete(taikhoan);
	}
	@Override
	public TaiKhoanEntity findTaiKhoanEntity(int maTaiKhoan) {
		Session se = this.sessionFactory.getCurrentSession();
		Criteria crit = se.createCriteria(TaiKhoanEntity.class);
		crit.add(Restrictions.eq("id", maTaiKhoan));
		return (TaiKhoanEntity) crit.uniqueResult();
	}
	@Override
	public TaiKhoanEntity findTaiKhoanEntityByTen(String tenTaiKhoan) {
		Session se = this.sessionFactory.getCurrentSession();
		Criteria crit = se.createCriteria(TaiKhoanEntity.class);
		crit.add(Restrictions.eq("tenTaiKhoan", tenTaiKhoan));
		return (TaiKhoanEntity) crit.uniqueResult();
	}
	@Override
	public void updateTrangThai(TaiKhoanInfo TaiKhoanInfo) {
		TaiKhoanEntity taikhoan = this.findTaiKhoanEntity(TaiKhoanInfo.getMaRole());
		taikhoan.setTrangThai(TaiKhoanInfo.isTrangThai());
		this.sessionFactory.getCurrentSession().update(taikhoan);
	}
}

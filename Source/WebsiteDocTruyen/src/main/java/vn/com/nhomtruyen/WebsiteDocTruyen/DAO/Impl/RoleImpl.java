package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.RoleDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.RoleEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.RoleInfo;


public class RoleImpl implements RoleDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<RoleInfo> getListRole() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + RoleInfo.class.getName()
				+ "(a.maRole, a.tenRole, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ RoleEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return query.list();
	}

	@Override
	public PaginationResult<RoleInfo> paginationListRole(int page, int Max_Result, int Max_Navigation) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + RoleInfo.class.getName()
				+ "(a.maRole, a.tenRole, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ RoleEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return new PaginationResult<RoleInfo>(query, page, Max_Result, Max_Navigation);
	}

	@Override
	public RoleInfo getRoleById(int maRole) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + RoleInfo.class.getName()
				+ "(a.maRole, a.tenRole, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ RoleEntity.class.getName() + " a where a.maRole =: maRole";

		Query query = se.createQuery(sql);
		query.setParameter("maRole", maRole);
		return (RoleInfo) query.uniqueResult();
	}

	@Override
	public PaginationResult<RoleInfo> getRoleByTen(int page, int Max_Result, int Max_Navigation, String ten) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + RoleInfo.class.getName()
				+ "(a.maRole, a.tenRole, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ RoleEntity.class.getName() + " a where a.tenRole like :ten";

		Query query = se.createQuery(sql);
		query.setParameter("ten","%"+ten+"%");
		return new PaginationResult<RoleInfo>(query, page, Max_Result, Max_Navigation);
	}
	@Override
	public void insert(RoleInfo RoleInfo) {
		Session se = this.sessionFactory.getCurrentSession();
		RoleEntity role = new RoleEntity();
		role.setTenRole(RoleInfo.getTenRole());
		role.setGioiThieu(RoleInfo.getGioiThieu());
		role.setTrangThai(true);
		role.setNgayTao(Helper.getCurrentDateAndTime());
		se.save(role);
	}

	@Override
	public void edit(RoleInfo RoleInfo) {
		Session se = this.sessionFactory.getCurrentSession();
		RoleEntity role = this.findRoleEntity(RoleInfo.getMaRole());
		role.setTenRole(RoleInfo.getTenRole());
		role.setGioiThieu(RoleInfo.getGioiThieu());
		role.setTrangThai(RoleInfo.isTrangThai());
		this.sessionFactory.getCurrentSession().update(role);
	}

	@Override
	public void xoa(int maRole) {
		Session se = this.sessionFactory.getCurrentSession();
		RoleEntity role = this.findRoleEntity(maRole);
		this.sessionFactory.getCurrentSession().delete(role);
		
	}

	@Override
	public RoleEntity findRoleEntity(int maRole) {
		Session se = this.sessionFactory.getCurrentSession();
		Criteria crit = se.createCriteria(RoleEntity.class);
		crit.add(Restrictions.eq("maRole", maRole));
		return (RoleEntity) crit.uniqueResult();
	}
	@Override
	public RoleEntity findRoleEntityByTen(String tenRole) {
		Session se = this.sessionFactory.getCurrentSession();
		Criteria crit = se.createCriteria(RoleEntity.class);
		crit.add(Restrictions.eq("tenRole", tenRole));
		return (RoleEntity) crit.uniqueResult();
	}
	@Override
	public void updateTrangThai(RoleInfo RoleInfo) {
		Session se = this.sessionFactory.getCurrentSession();
		RoleEntity role = this.findRoleEntity(RoleInfo.getMaRole());
		role.setTrangThai(RoleInfo.isTrangThai());
		this.sessionFactory.getCurrentSession().update(role);
		
	}
	
}

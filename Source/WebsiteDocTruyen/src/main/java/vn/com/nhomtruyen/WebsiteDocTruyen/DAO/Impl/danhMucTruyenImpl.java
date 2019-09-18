package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.danhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.danhMucTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.danhMucTruyenInfo;

public class danhMucTruyenImpl implements danhMucTruyenDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<danhMucTruyenInfo> dsDanhMucTruyen() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + danhMucTruyenInfo.class.getName()
				+ "(a.id, a.tenDanhMuc, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ danhMucTruyenEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return query.list();
	}

	@Override
	public PaginationResult<danhMucTruyenInfo> listDanhMucTruyen(int page, int maxResult, int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();// lấy phiên làm việc

		String sql = " Select new " + danhMucTruyenInfo.class.getName()
				+ "(a.id, a.tenDanhMuc, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ danhMucTruyenEntity.class.getName() + " a ORDER BY NgayTao DESC";
		Query query = session.createQuery(sql);

		return new PaginationResult<danhMucTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public danhMucTruyenEntity findDanhMucTruyenEntity(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(danhMucTruyenEntity.class);
		crit.add(Restrictions.eq("id", id));
		return (danhMucTruyenEntity) crit.uniqueResult();
	}

	@Override
	public danhMucTruyenInfo findDanhMucTruyenInfo(String id) {
		danhMucTruyenEntity danhMucTruyenEntity= this.findDanhMucTruyenEntity(id);
		if(danhMucTruyenEntity ==null) {
			return null;
		}
		return new danhMucTruyenInfo(danhMucTruyenEntity.getId(), danhMucTruyenEntity.getTenDanhMuc(),
				danhMucTruyenEntity.getGioiThieu(), danhMucTruyenEntity.getTrangThai(), danhMucTruyenEntity.getNgayTao());
	}

	@Override
	public void insertDanhMucTruyen(danhMucTruyenInfo danhMucTruyenInfo) {
		String id = danhMucTruyenInfo.getId();
		danhMucTruyenEntity danhMucTruyenEntity = null;
		if (id != null) {
			danhMucTruyenEntity = this.findDanhMucTruyenEntity(id);
		}
		boolean isNew = false;
		if (danhMucTruyenEntity == null) {
			isNew = true;
			danhMucTruyenEntity = new danhMucTruyenEntity();

		}
		danhMucTruyenEntity.setId(danhMucTruyenInfo.getId());
		danhMucTruyenEntity.setTenDanhMuc(danhMucTruyenInfo.getTenDanhMuc());
		danhMucTruyenEntity.setGioiThieu(danhMucTruyenInfo.getGioiThieu());
		danhMucTruyenEntity.setTrangThai(danhMucTruyenInfo.getTrangThai());
		danhMucTruyenEntity.setNgayTao(danhMucTruyenInfo.getNgayTao());
		if (isNew) {
			Session session = this.sessionFactory.getCurrentSession();
			session.persist(danhMucTruyenEntity);
		}
	}

	@Override
	public void deleteDanhMucTruyen(String id) {
		danhMucTruyenEntity danhMucTruyenEntity = this.findDanhMucTruyenEntity(id);
		if (danhMucTruyenEntity != null) {
			this.sessionFactory.getCurrentSession().delete(danhMucTruyenEntity);
		}

	}

}

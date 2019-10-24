package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.danhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.chiTietDanhMucEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.danhMucTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.chiTietDanhMucTruyenInfo;
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
	public danhMucTruyenEntity findDanhMucTruyenEntity(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(danhMucTruyenEntity.class);
		crit.add(Restrictions.eq("id", id));
		return (danhMucTruyenEntity) crit.uniqueResult();
	}

	@Override
	public danhMucTruyenInfo findDanhMucTruyenInfo(int id) {
		danhMucTruyenEntity danhMucTruyenEntity= this.findDanhMucTruyenEntity(id);
		if(danhMucTruyenEntity ==null) {
			return null;
		}
		return new danhMucTruyenInfo(danhMucTruyenEntity.getId(), danhMucTruyenEntity.getTenDanhMuc(),
				danhMucTruyenEntity.getGioiThieu(), danhMucTruyenEntity.getTrangThai(), danhMucTruyenEntity.getNgayTao());
	}

	@Override
	public void insertDanhMucTruyen(danhMucTruyenInfo danhMucTruyenInfo) {
		int id = danhMucTruyenInfo.getId();
		danhMucTruyenEntity danhMucTruyenEntity = null;
		
			danhMucTruyenEntity = this.findDanhMucTruyenEntity(id);
		
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
	public void deleteDanhMucTruyen(int id) {
		danhMucTruyenEntity danhMucTruyenEntity = this.findDanhMucTruyenEntity(id);
		if (danhMucTruyenEntity != null) {
			this.sessionFactory.getCurrentSession().delete(danhMucTruyenEntity);
		}

	}

	@Override
	public List<chiTietDanhMucTruyenInfo> listTenDMByMaTruyen(int maTruyen) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + chiTietDanhMucTruyenInfo.class.getName()
				+ "(a.id, a.maTruyen,d.tenDanhMuc)" + " from "
				+ chiTietDanhMucEntity.class.getName() +" a, "+ danhMucTruyenEntity.class.getName() + " d "
				+ " where a.maDanhMuc=d.id and a.maTruyen =: mt";

		Query query = se.createQuery(sql);
		query.setParameter("mt", maTruyen);
		return query.list();
	}

	@Override
	public List<chiTietDanhMucTruyenInfo> listTenDM() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + chiTietDanhMucTruyenInfo.class.getName()
				+ "(a.id, a.maTruyen,d.tenDanhMuc)" + " from "
				+ chiTietDanhMucEntity.class.getName() +" a, "+ danhMucTruyenEntity.class.getName() + " d "
				+ " where a.maDanhMuc=d.id ";

		Query query = se.createQuery(sql);
	
		return query.list();
	}

}

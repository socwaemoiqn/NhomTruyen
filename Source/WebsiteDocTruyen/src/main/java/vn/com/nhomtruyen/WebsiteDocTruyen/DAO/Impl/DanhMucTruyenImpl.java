package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.ChiTietDanhMucEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.DanhMucTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietDanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;

public class DanhMucTruyenImpl implements DanhMucTruyenDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<DanhMucTruyenInfo> dsDanhMucTruyen() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + DanhMucTruyenInfo.class.getName()
				+ "(a.id, a.tenDanhMuc, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ DanhMucTruyenEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return query.list();
	}

	@Override
	public PaginationResult<DanhMucTruyenInfo> listDanhMucTruyen(int page, int maxResult, int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();// lấy phiên làm việc

		String sql = " Select new " + DanhMucTruyenInfo.class.getName()
				+ "(a.id, a.tenDanhMuc, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ DanhMucTruyenEntity.class.getName() + " a ORDER BY NgayTao DESC";
		Query query = session.createQuery(sql);

		return new PaginationResult<DanhMucTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}
	
	@Override
	public PaginationResult<DanhMucTruyenInfo> searchDanhMuc(String tuKhoa, int page, int maxResult,
			int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();// lấy phiên làm việc

		String sql = " Select new " + DanhMucTruyenInfo.class.getName()
				+ "(a.id, a.tenDanhMuc, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ DanhMucTruyenEntity.class.getName() + " a where a.tenDanhMuc like : tuKhoa ";
		Query query = session.createQuery(sql);
		query.setParameter("tuKhoa", "%"+tuKhoa+"%");
		return new PaginationResult<DanhMucTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public DanhMucTruyenEntity findDanhMucTruyenEntity(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(DanhMucTruyenEntity.class);
		crit.add(Restrictions.eq("id", id));
		return (DanhMucTruyenEntity) crit.uniqueResult();
	}

	@Override
	public DanhMucTruyenInfo findDanhMucTruyenInfo(int id) {
		DanhMucTruyenEntity danhMucTruyenEntity = this.findDanhMucTruyenEntity(id);
		if (danhMucTruyenEntity == null) {
			return null;
		}
		return new DanhMucTruyenInfo(danhMucTruyenEntity.getId(), danhMucTruyenEntity.getTenDanhMuc(),
				danhMucTruyenEntity.getGioiThieu(), danhMucTruyenEntity.getTrangThai(),
				danhMucTruyenEntity.getNgayTao());
	}

	@Override
	public void insertDanhMucTruyen(DanhMucTruyenInfo danhMucTruyenInfo) {
		DanhMucTruyenEntity danhMucTruyenEntity = new DanhMucTruyenEntity();
		danhMucTruyenEntity.setTenDanhMuc(danhMucTruyenInfo.getTenDanhMuc());
		danhMucTruyenEntity.setGioiThieu(danhMucTruyenInfo.getGioiThieu());
		danhMucTruyenEntity.setTrangThai(danhMucTruyenInfo.getTrangThai());
		danhMucTruyenEntity.setNgayTao(danhMucTruyenInfo.getNgayTao());
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(danhMucTruyenEntity);

	}

	@Override
	public void deleteDanhMucTruyen(int id) {
		DanhMucTruyenEntity danhMucTruyenEntity = this.findDanhMucTruyenEntity(id);
		if (danhMucTruyenEntity != null) {
			this.sessionFactory.getCurrentSession().delete(danhMucTruyenEntity);
		}

	}

	@Override
	public List<ChiTietDanhMucTruyenInfo> listTenDMByMaTruyen(String maTruyen) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + ChiTietDanhMucTruyenInfo.class.getName()
				+ "(a.id, a.maTruyen,a.maDanhMuc,d.tenDanhMuc)" + " from " + ChiTietDanhMucEntity.class.getName()
				+ " a, " + DanhMucTruyenEntity.class.getName() + " d " + " where a.maDanhMuc=d.id and a.maTruyen =: mt";

		Query query = se.createQuery(sql);
		query.setParameter("mt", maTruyen);
		return query.list();
	}

	@Override
	public List<ChiTietDanhMucTruyenInfo> listTenDM() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + ChiTietDanhMucTruyenInfo.class.getName()
				+ "(a.id, a.maTruyen,a.maDanhMuc,d.tenDanhMuc)" + " from " + ChiTietDanhMucEntity.class.getName()
				+ " a, " + DanhMucTruyenEntity.class.getName() + " d " + " where a.maDanhMuc=d.id ";

		Query query = se.createQuery(sql);

		return query.list();
	}

	@Override
	public void insertChiTietDanhMuc(ChiTietDanhMucTruyenInfo chiTietDanhMucTruyenInfo) {
		ChiTietDanhMucEntity chiTietDanhMuc = new ChiTietDanhMucEntity();
		chiTietDanhMuc.setMaTruyen(chiTietDanhMucTruyenInfo.getMaTruyen());
		chiTietDanhMuc.setMaDanhMuc(chiTietDanhMucTruyenInfo.getMaDanhMuc());
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(chiTietDanhMuc);
	}

	@Override
	public void deleteChiTietDanhMuc(ChiTietDanhMucEntity chiTietDanhMucEntity) {
		this.sessionFactory.getCurrentSession().delete(chiTietDanhMucEntity);

	}

	@Override
	public void capNhatDanhMuc(DanhMucTruyenInfo danhMucTruyenInfo) {
		DanhMucTruyenEntity danhMuc= this.findDanhMucTruyenEntity(danhMucTruyenInfo.getId());
		danhMuc.setTenDanhMuc(danhMucTruyenInfo.getTenDanhMuc());
		danhMuc.setGioiThieu(danhMucTruyenInfo.getGioiThieu());
		danhMuc.setTrangThai(danhMucTruyenInfo.getTrangThai());
		this.sessionFactory.getCurrentSession().update(danhMuc);
	}

	@Override
	public void capNhatTrangThaiDanhMuc(DanhMucTruyenInfo danhMucTruyenInfo) {
		DanhMucTruyenEntity danhMuc= this.findDanhMucTruyenEntity(danhMucTruyenInfo.getId());
		danhMuc.setTrangThai(danhMucTruyenInfo.getTrangThai());
		this.sessionFactory.getCurrentSession().update(danhMuc);
		
	}

	

}

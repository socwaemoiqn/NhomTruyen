package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.ChuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.ChuongEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;

public class ChuongImpl implements ChuongDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public PaginationResult<ChuongInfo> listChuongOfTruyen(int idTruyen, int page, int maxResult,
			int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + ChuongInfo.class.getName()
				+ "(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)" + " from "
				+ ChuongEntity.class.getName() + " ch where ch.IDTruyen  = :id";

		Query query = session.createQuery(sql);
		query.setParameter("id", idTruyen);
		return new PaginationResult<ChuongInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public List<ChuongInfo> listChuongOfTruyen(int maTruyen) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + ChuongInfo.class.getName()
				+ "(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)" + " from "
				+ ChuongEntity.class.getName() + " ch where ch.IDTruyen  = :id";

		Query query = session.createQuery(sql);
		query.setParameter("id", maTruyen);
		return query.list();
	}

	@Override
	public ChuongInfo chuongOfID(int idChuong) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + ChuongInfo.class.getName()
				+ "(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)" + " from "
				+ ChuongEntity.class.getName() + " ch where ch.id  = :id";

		Query query = session.createQuery(sql);
		query.setParameter("id", idChuong);
		return (ChuongInfo) query.uniqueResult();
	}

	@Override
	public boolean upDataChuong(String nd, int idChuong) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " update " + ChuongEntity.class.getName() + " ch set ch.noiDung =: nd  where ch.id =: id";

		Query query = session.createQuery(sql);
		query.setParameter("id", idChuong);
		query.setParameter("nd", nd);

		if (query.executeUpdate() > 1)
			return true;
		else
			return false;
	}

	@Override
	public List<ChuongInfo> listChuongByIdTruyen(String matruyen) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + ChuongInfo.class.getName()
				+ "(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)" + " from "
				+ ChuongEntity.class.getName() + " ch where ch.IDTruyen  = :id";

		Query query = session.createQuery(sql);
		query.setParameter("id", matruyen);
		return query.list();
	}

}

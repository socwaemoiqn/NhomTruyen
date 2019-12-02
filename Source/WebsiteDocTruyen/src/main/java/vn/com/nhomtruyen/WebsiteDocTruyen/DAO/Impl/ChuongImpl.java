package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.ChuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.ChuongEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;

public class ChuongImpl implements ChuongDAO{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public PaginationResult<ChuongInfo> listChuongOfTruyen(String idTruyen, int page, int maxResult,
			int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + ChuongInfo.class.getName()
				+ "(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)" + " from "
				+ ChuongEntity.class.getName() + " ch where ch.IDTruyen  = :id ORDER BY ch.ngayTao DESC";

		Query query = session.createQuery(sql);
		query.setParameter("id", idTruyen);
		return new PaginationResult<ChuongInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public List<ChuongInfo> listChuongOfTruyenSortDESC(String maTruyen) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + ChuongInfo.class.getName()
				+ "(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)" + " from "
				+ ChuongEntity.class.getName() + " ch where ch.IDTruyen  = :id ORDER BY ch.ngayTao DESC ";

		Query query = session.createQuery(sql);
		query.setParameter("id", maTruyen);
		return query.list();
	}
	
	@Override
	public List<ChuongInfo> listChuongOfTruyenSortASC(String matruyen) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + ChuongInfo.class.getName()
				+ "(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)" + " from "
				+ ChuongEntity.class.getName() + " ch where ch.IDTruyen  = :id  ORDER BY ch.ngayTao ASC ";

		Query query = session.createQuery(sql);
		query.setParameter("id", matruyen);
		return query.list();
	}
	@Override
	public Map<String, String> listPathVariableString(String maTruyen) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + ChuongInfo.class.getName()
				+ "(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)" + " from "
				+ ChuongEntity.class.getName() + " ch where ch.IDTruyen  = :id";

		Query query = session.createQuery(sql);
		query.setParameter("id", maTruyen);
		List<ChuongInfo> list= query.list();
		Map<String, String> maps= new HashMap<String, String>();
		for(ChuongInfo ch: list) {
			maps.put(Helper.pathVariableString(ch.getTieuDe()), ch.getId());
		}
		return maps;
	}
	@Override
	public ChuongInfo chuongInfo(String idChuong) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + ChuongInfo.class.getName()
				+ "(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)" + " from "
				+ ChuongEntity.class.getName() + " ch where ch.id  = :id";

		Query query = session.createQuery(sql);
		query.setParameter("id", idChuong);
		return (ChuongInfo) query.uniqueResult();
	}

	@Override
	public void upDateChuong(ChuongInfo chuongInfo) {
		ChuongEntity chuongEntity= findChuongEntity(chuongInfo.getId());
		chuongEntity.setNoiDung(chuongInfo.getNoiDung());
		chuongEntity.setTieuDe(chuongInfo.getTieuDe());
		chuongEntity.setTrangThai(chuongInfo.getTrangThai());
		this.sessionFactory.getCurrentSession().update(chuongEntity);
	}

	

	@Override
	public void insertChuong(ChuongInfo chuongInfo) {
		ChuongEntity chuong= new ChuongEntity();
		chuong.setId(chuongInfo.getId());
		chuong.setIDTruyen(chuongInfo.getIDTruyen());
		chuong.setTieuDe(chuongInfo.getTieuDe());
		chuong.setNoiDung(chuongInfo.getNoiDung());
		chuong.setTrangThai(chuongInfo.getTrangThai());
		chuong.setNgayTao(chuongInfo.getNgayTao());
		Session session = sessionFactory.getCurrentSession();
		session.persist(chuong);
		
	}
	@Override
	public ChuongEntity findChuongEntity(String idChuong) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ChuongEntity.class);
		crit.add(Restrictions.eq("id", idChuong));
		return (ChuongEntity) crit.uniqueResult();
	}
	@Override
	public void deleteChuong(String idChuong) {
		ChuongEntity chuongEntity= this.findChuongEntity(idChuong);
		if(chuongEntity != null) {
			this.sessionFactory.getCurrentSession().delete(chuongEntity);
		}
	}

	@Override
	public void upDateTrangThaiChuong(ChuongInfo chuongInfo) {
		ChuongEntity chuongEntity= findChuongEntity(chuongInfo.getId());
		chuongEntity.setTrangThai(chuongInfo.getTrangThai());
		this.sessionFactory.getCurrentSession().update(chuongEntity);
	}

	

	

}

package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.chuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.chuongEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.chuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.danhMucTruyenInfo;

public class chuongImpl implements chuongDAO{

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public PaginationResult<chuongInfo> listChuongOfTruyen(int idTruyen, int page, int maxResult,
			int maxNavigationPage) {
		Session session =this.sessionFactory.getCurrentSession();
		String sql=" Select new " + chuongInfo.class.getName()
				+"(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)"
				+ " from "+chuongEntity.class.getName() + " ch where ch.IDTruyen  = :id";
		
		Query query = session.createQuery(sql);
		query.setParameter("id", idTruyen);
		return new PaginationResult<chuongInfo>(query, page, maxResult, maxNavigationPage);
	}
	@Override
	public chuongInfo chuongOfID(int idChuong) {
		Session session =this.sessionFactory.getCurrentSession();
		String sql=" Select new " + chuongInfo.class.getName()
				+"(ch.id, ch.IDTruyen, ch.tieuDe, ch.noiDung, ch.trangThai, ch.ngayTao)"
				+ " from "+chuongEntity.class.getName() + " ch where ch.id  = :id";
		
		Query query = session.createQuery(sql);
		query.setParameter("id", idChuong);
		return (chuongInfo) query.uniqueResult() ;
	}
	@Override
	public boolean upDataChuong(String nd, int idChuong) {
		Session session =this.sessionFactory.getCurrentSession();
		String sql=" update "+chuongEntity.class.getName()
		+" ch set ch.noiDung =: nd  where ch.id =: id";
		
		Query query = session.createQuery(sql);
		query.setParameter("id", idChuong);
		query.setParameter("nd", nd);
		
		if(query.executeUpdate() >1)
			return true;
		else
		return false;
	}
	

}

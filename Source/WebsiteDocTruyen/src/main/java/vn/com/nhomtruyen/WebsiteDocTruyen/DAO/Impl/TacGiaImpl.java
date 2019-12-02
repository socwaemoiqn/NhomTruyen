package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfo;


public class TacGiaImpl implements TacGiaDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TacGiaInfo> listTacGia() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TacGiaInfo.class.getName()
				+ "(a.ID, a.tenTacGia, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TacGiaEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return query.list();
	}

	@Override
	public PaginationResult<TacGiaInfo> paginationListTacGia(int page, int Max_Result, int Max_Navigation) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TacGiaInfo.class.getName()
				+ "(a.ID, a.tenTacGia, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TacGiaEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return new PaginationResult<TacGiaInfo>(query, page, Max_Result, Max_Navigation);
	}

	@Override
	public int getSoLuongTruyenById(int maTacGia) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TruyenInfo.class.getName()
				+ "(tr.ID,tr.tenTruyen, tr.maTacGia, tr.maNhomDich, tr.soChuong,tr.gioiThieu, tr.luotXem, tr.nguon, tr.hinhAnh,tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao)" + " from "
				+ TruyenEntity.class.getName() + " tr" +" where tr.maTacGia =: maTacGia";

		Query query = se.createQuery(sql);
		query.setParameter("maTacGia", maTacGia);
		return query.list().size();
	}

	@Override
	public TacGiaInfo getTacGiaById(int maTacGia) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TacGiaInfo.class.getName()
				+ "(a.ID, a.tenTacGia, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TacGiaEntity.class.getName() + " a" +  " where a.ID =: maTacGia";

		Query query = se.createQuery(sql);
		query.setParameter("maTacGia", maTacGia);
		return (TacGiaInfo) query.uniqueResult();
	}

	@Override
	public PaginationResult<TacGiaInfo> getTacGiaByTen(int page,int Max_Result, int Max_Navigation,String ten) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TacGiaInfo.class.getName()
				+ "(a.ID, a.tenTacGia, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TacGiaEntity.class.getName() + " a" +  " where a.tenTacGia like :ten";

		Query query = se.createQuery(sql);
		query.setParameter("ten", "%"+ten+"%");
		return  new PaginationResult<TacGiaInfo>(query, page, Max_Result, Max_Navigation);
//		return null;
	}

	@Override
	public void insert(TacGiaInfo tacGiaInfo) {
		Session se = this.sessionFactory.getCurrentSession();
		TacGiaEntity tacgia = new TacGiaEntity();
		tacgia.setTenTacGia(tacGiaInfo.getTenTacGia());
		tacgia.setGioiThieu(tacGiaInfo.getGioiThieu());
		tacgia.setTrangThai("1");
		tacgia.setNgayTao(Helper.getCurrentDateAndTime());
		se.persist(tacgia);
	}

	@Override
	public void edit(TacGiaInfo tacGiaInfo) {
		TacGiaEntity tacgia = this.findTacGiaEntity(tacGiaInfo.getID());
		tacgia.setTenTacGia(tacGiaInfo.getTenTacGia());
		tacgia.setGioiThieu(tacGiaInfo.getGioiThieu());
		tacgia.setTrangThai(tacGiaInfo.getTrangThai());
		this.sessionFactory.getCurrentSession().update(tacgia);
	}

	@Override
	public void xoa(int maTacGia) {
		TacGiaEntity tacGiaEntity= this.findTacGiaEntity(maTacGia);
		if(tacGiaEntity != null)
		{
			this.sessionFactory.getCurrentSession().delete(tacGiaEntity);
		}
	}
	@Override
	public TacGiaEntity findTacGiaEntity(int maTacGia) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit= session.createCriteria(TacGiaEntity.class);
		crit.add(Restrictions.eq("id", maTacGia));
		return (TacGiaEntity) crit.uniqueResult();
	}

	@Override
	public void updateTrangThai(TacGiaInfo tacGiaInfo) {
		TacGiaEntity tacGiaEntity= this.findTacGiaEntity(tacGiaInfo.getID());
		tacGiaEntity.setTrangThai(tacGiaInfo.getTrangThai());
		if(tacGiaEntity != null)
		{
			this.sessionFactory.getCurrentSession().update(tacGiaEntity);;
		}
	}
}

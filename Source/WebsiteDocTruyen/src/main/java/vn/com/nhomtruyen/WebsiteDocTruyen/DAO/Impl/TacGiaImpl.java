package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

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
				+ "(tr.ID, tr.maTacGia, tr.maNhomDich, tr.soChuong,tr.gioiThieu, tr.luotXem, tr.nguon, tr.hinhAnh,tr.trangThai, tr.ngayTao)" + " from "
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

}

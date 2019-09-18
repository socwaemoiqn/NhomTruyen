package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.theLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.theLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.theLoaiTruyenInfo;

public class theLoaiTruyenImpl implements theLoaiTruyenDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public PaginationResult<theLoaiTruyenInfo> listTheLoaiTruyen(int page, int maxResult, int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + theLoaiTruyenInfo.class.getName()
				+ "(a.id, a.tenTheLoai, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ theLoaiTruyenEntity.class.getName() + " a ORDER BY NgayTao DESC";
		
		Query  query= session.createQuery(sql);
		return new PaginationResult<theLoaiTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public theLoaiTruyenEntity findTheLoaiTruyen(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public theLoaiTruyenInfo findTheLoaiTruen(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertTheLoaiTruyen(theLoaiTruyenInfo theLoaiTruyenInfo) {
		// TODO Auto-generated method stub
		
	}

}

package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.DanhMucTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

public class TheLoaiTruyenImpl implements TheLoaiTruyenDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<TheLoaiTruyenInfo> dsTheLoai() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TheLoaiTruyenInfo.class.getName()
				+ "(a.id, a.tenTheLoai, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TheLoaiTruyenEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return query.list();
	}
	
	@Override
	public PaginationResult<TheLoaiTruyenInfo> listTheLoaiTruyen(int page, int maxResult, int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + TheLoaiTruyenInfo.class.getName()
				+ "(a.id, a.tenTheLoai, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TheLoaiTruyenEntity.class.getName() + " a ORDER BY NgayTao DESC";
		
		Query  query= session.createQuery(sql);
		return new PaginationResult<TheLoaiTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public TheLoaiTruyenEntity findTheLoaiTruyen(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TheLoaiTruyenInfo findTheLoaiTruen(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertTheLoaiTruyen(TheLoaiTruyenInfo theLoaiTruyenInfo) {
		// TODO Auto-generated method stub
		
	}

	

}

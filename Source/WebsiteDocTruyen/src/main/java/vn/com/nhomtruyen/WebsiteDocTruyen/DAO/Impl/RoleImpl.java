package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.RoleDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.RoleEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.RoleInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;


public class RoleImpl implements RoleDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<RoleInfo> getListRole() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + RoleInfo.class.getName()
				+ "(a.maRole, a.tenRole, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ RoleEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return query.list();
	}
	
}

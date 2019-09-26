package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.tacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.tacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.tacGiaInfo;

public class tacGiaImpl implements tacGiaDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<tacGiaInfo> listTacGia() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + tacGiaInfo.class.getName()
				+ "(a.ID, a.tenTacGia, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ tacGiaEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return query.list();
	}

}

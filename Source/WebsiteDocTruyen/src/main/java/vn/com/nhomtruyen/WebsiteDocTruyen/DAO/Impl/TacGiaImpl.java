package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;

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

}

package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.danhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.danhMucTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.danhMucTruyenInfo;

public class danhMucTruyenImpl implements danhMucTruyenDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<danhMucTruyenInfo> dsDanhMucTruyen() {
		Session se=this.sessionFactory.getCurrentSession();
		
		String sql=" Select new "+ danhMucTruyenInfo.class.getName()
				+ "(a.id, a.tenDanhMuc, a.gioiThieu, a.trangThai, a.ngayTao)"
				+" from "+danhMucTruyenEntity.class.getName() + " a";
		
		Query query = se.createQuery(sql);
		return query.list();
	}

}

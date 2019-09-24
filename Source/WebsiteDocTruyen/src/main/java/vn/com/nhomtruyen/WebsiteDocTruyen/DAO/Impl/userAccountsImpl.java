package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.userAccountsDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.userAccountsEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.userAccountsInfo;

public class userAccountsImpl implements userAccountsDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public userAccountsInfo login(String userName, String passWord) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + userAccountsInfo.class.getName()
				+ "(a.id, a.userName, a.passWord, a.role, a.trangThai, a.ngayTao)" + " from "
				+ userAccountsEntity.class.getName() + " a where USER_NAME =: us and PASSWORD =: pw";

		Query query = se.createQuery(sql);
		query.setParameter("us", userName);
		query.setParameter("pw",passWord);
		return (userAccountsInfo) query.uniqueResult();
	}

}

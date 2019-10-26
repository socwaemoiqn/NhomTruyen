package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.RoleEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TaiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.UserAccountsEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TaiKhoanInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.UserAccountsInfo;

public class TaiKhoanImpl implements TaiKhoanDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public UserAccountsInfo login(String userName, String passWord) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + UserAccountsInfo.class.getName()
				+ "(a.id, a.userName, a.passWord, a.role, a.trangThai, a.ngayTao)" + " from "
				+ UserAccountsEntity.class.getName() + " a where USER_NAME =: us and PASSWORD =: pw";

		Query query = se.createQuery(sql);
		query.setParameter("us", userName);
		query.setParameter("pw",passWord);
		return (UserAccountsInfo) query.uniqueResult();
	}

	@Override
	public TaiKhoanInfo ck_login(String userName, String passWord) {
		Session se = this.sessionFactory.getCurrentSession();
		
		String sql = " Select new " + TaiKhoanInfo.class.getName()
				+ "(tk.maTaiKhoan, tk.tenTaiKhoan, tk.matKhau, ro.tenRole, tk.ngayTao)" + " from "
				+ TaiKhoanEntity.class.getName() + " tk ,"
				+ RoleEntity.class.getName() + " ro "
				+" where tk.maRole=ro.maRole and  TenTaiKhoan =: us and MatKhau =: pw";

		Query query = se.createQuery(sql);
		query.setParameter("us", userName);
		query.setParameter("pw",passWord);
		return (TaiKhoanInfo) query.uniqueResult();
	}

}

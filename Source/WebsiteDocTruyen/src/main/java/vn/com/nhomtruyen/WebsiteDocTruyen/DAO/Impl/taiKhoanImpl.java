package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.taiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.roleEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.tacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.taiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.theLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.truyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.userAccountsEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.taiKhoanInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenSelectInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.userAccountsInfo;

public class taiKhoanImpl implements taiKhoanDAO{

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

	@Override
	public taiKhoanInfo ck_login(String userName, String passWord) {
		Session se = this.sessionFactory.getCurrentSession();
		
		String sql = " Select new " + taiKhoanInfo.class.getName()
				+ "(tk.maTaiKhoan, tk.tenTaiKhoan, tk.matKhau, ro.tenRole, tk.ngayTao)" + " from "
				+ taiKhoanEntity.class.getName() + " tk ,"
				+ roleEntity.class.getName() + " ro "
				+" where tk.maRole=ro.maRole and  TenTaiKhoan =: us and MatKhau =: pw";

		Query query = se.createQuery(sql);
		query.setParameter("us", userName);
		query.setParameter("pw",passWord);
		return (taiKhoanInfo) query.uniqueResult();
	}

}

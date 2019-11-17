package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.InfoTaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.InfoTaiKhoanEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.InfoTaiKhoanModel;

public class InfoTaiKhoanImpl implements InfoTaiKhoanDAO{
	SessionFactory sessionFactory;
	@Override
	public InfoTaiKhoanEntity insert(InfoTaiKhoanModel infoTaiKhoanModel) {
		Session se = this.sessionFactory.getCurrentSession();
		InfoTaiKhoanEntity infotk = new InfoTaiKhoanEntity();
		infotk.setId(infoTaiKhoanModel.getId());
		infotk.setNgayTao(Helper.getCurrentDateAndTime());
		se.persist(infotk);	
		return infotk;
	}

}

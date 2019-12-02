package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.PhanHoiDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.PhanHoiEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PhanHoiInfo;


public class PhanHoiImpl implements PhanHoiDAO{

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<PhanHoiInfo> listPhanHoi() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PaginationResult<PhanHoiInfo> paginationListPhanHoi(int page, int Max_Result, int Max_Navigation) {
	Session se = this.sessionFactory.getCurrentSession();
	String sql = "Select new "+PhanHoiInfo.class.getName()
			+"(a.maPhanHoi,a.chuDe,a.tenNguoiGui,a.email,a.noiDung,a.daXem,a.ngayTao) "
			+ "from "+PhanHoiEntity.class.getName()+" a "
					+ "ORDER BY a.ngayTao DESC";
	Query query = se.createQuery(sql);
		return new PaginationResult<PhanHoiInfo>(query, page, Max_Result, Max_Navigation);
	}


	@Override
	public PhanHoiInfo getPhanHoiById(int maPhanHoi) {
		Session se = this.sessionFactory.getCurrentSession();
		String sql = "Select new "+PhanHoiInfo.class.getName()
				+"(a.maPhanHoi,a.chuDe,a.tenNguoiGui,a.email,a.noiDung,a.daXem,a.ngayTao) "
				+ "from "+PhanHoiEntity.class.getName()+" a where a.maPhanHoi =: maPhanHoi";
		Query query = se.createQuery(sql);
		query.setParameter("maPhanHoi", maPhanHoi);
		return (PhanHoiInfo) query.uniqueResult();
	}

	@Override
	public PaginationResult<PhanHoiInfo> getPhanHoiBySearch(int page, int Max_Result, int Max_Navigation,Map<String,String> list) {
		Session se = this.sessionFactory.getCurrentSession();
		String sqlKey = !list.get("key").equals("") ?  "( a.chuDe like: key or a.tenNguoiGui like: key  or a.email like: key or a.noiDung like: key or a.ngayTao like: key )" : "";
		String sqlChuDe = list.get("subject").equals("all") ? "" :  "a.chuDe = '"+list.get("subject")+"'";
		sqlChuDe = sqlKey != "" && sqlChuDe != "" ? sqlChuDe + " and " : sqlChuDe;
		String sqlDaXem = "";
		switch(list.get("type"))
		{
			case "readed":
				sqlDaXem = "a.daXem = 1";
				if(!sqlChuDe.equals("") || !sqlKey.equals(""))
					sqlDaXem += " and ";
				break;
			case "unread":
				sqlDaXem = "a.daXem = 0";
				if(!sqlChuDe.equals("") || !sqlKey.equals(""))
					sqlDaXem += " and ";
				break;
		}
		String where = sqlKey == "" && sqlChuDe == "" && sqlDaXem == ""? "" : "where";
		String sql = "Select new "+PhanHoiInfo.class.getName()
				+"(a.maPhanHoi,a.chuDe,a.tenNguoiGui,a.email,a.noiDung,a.daXem,a.ngayTao) "
				+ "from "+PhanHoiEntity.class.getName()+" a "
						+ " "+where
						+ " "+sqlDaXem
						+ " "+sqlChuDe
						+ " "+sqlKey
						+ " ORDER BY a.ngayTao DESC";
						
		Query query = se.createQuery(sql);
		if (sqlKey != "")query.setParameter("key", "%"+list.get("key")+"%");
		return new PaginationResult<PhanHoiInfo>(query, page, Max_Result, Max_Navigation);
	}

	@Override
	public void insert(PhanHoiInfo PhanHoiInfo) {
		Session se = this.sessionFactory.getCurrentSession();
		PhanHoiEntity phanHoi = new PhanHoiEntity();
		phanHoi.setChuDe(PhanHoiInfo.getChuDe());
		phanHoi.setTenNguoiGui(PhanHoiInfo.getTenNguoiGui());
		phanHoi.setEmail(PhanHoiInfo.getEmail());
		phanHoi.setNoiDung(PhanHoiInfo.getNoiDung());
		phanHoi.setDaXem(false);
		phanHoi.setNgayTao(Helper.getCurrentDateAndTime());
		se.save(phanHoi);
	}

	@Override
	public void edit(PhanHoiInfo PhanHoiInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void xoa(int maPhanHoi) {
		PhanHoiEntity phanhoi = this.findPhanHoiEntity(maPhanHoi);
		this.sessionFactory.getCurrentSession().delete(phanhoi);		
	}

	@Override
	public PhanHoiEntity findPhanHoiEntity(int maPhanHoi) {
		Session se = this.sessionFactory.getCurrentSession();
		Criteria crit = se.createCriteria(PhanHoiEntity.class);
		crit.add(Restrictions.eq("maPhanHoi", maPhanHoi));
		return (PhanHoiEntity) crit.uniqueResult();
	}

	@Override
	public void updateTrangThai(PhanHoiInfo PhanHoiInfo) {
		PhanHoiEntity phanhoi = this.findPhanHoiEntity(PhanHoiInfo.getMaPhanHoi());
		phanhoi.setDaXem(PhanHoiInfo.getDaXem());
		this.sessionFactory.getCurrentSession().update(phanhoi);
		
	}

}

package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.LuotXemDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.LuotXemEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.LuotXemModel;

public class LuotXemImpl implements LuotXemDAO{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void insert(LuotXemModel luotXemModel)
	{
		Session se = this.sessionFactory.getCurrentSession();
		LuotXemEntity luotXemEntity = new LuotXemEntity();
		luotXemEntity.setLuotXem(luotXemModel.getLuotXem());
		luotXemEntity.setMaTruyen(luotXemModel.getMaTruyen());
		luotXemEntity.setNgayXem(Helper.getCurrentDateAndTime());
		se.save(luotXemEntity);
	}
	@Override
	public LuotXemModel findLuotXem(String maTruyen) {
		Session se = this.sessionFactory.getCurrentSession();
		String startTime = Helper.getToday()+" 00:00:00";
		String endTime = Helper.getToday() + " 23:59:00";
		String sql = "Select new "+LuotXemModel.class.getName()+" "
				+ " (lx.id,lx.luotXem,lx.maTruyen,lx.ngayXem) "
				+ " from "+LuotXemEntity.class.getName()+" lx "
						+ " where lx.maTruyen =: maTruyen and lx.ngayXem BETWEEN '"+startTime+"' and '"+endTime+"'";
		Query query = se.createQuery(sql);
		query.setParameter("maTruyen", maTruyen);
		return (LuotXemModel)query.uniqueResult();
	}
	@Override
	public void updateLuotXem(LuotXemModel luotXemModel) {
		Session se = this.sessionFactory.getCurrentSession();
		String startTime = Helper.getToday()+" 00:00:00";
		String endTime = Helper.getToday() + " 23:59:00";
		String sql = "Update "+LuotXemEntity.class.getName()+ " lx "
				+ " set lx.luotXem =: luotXem "
						+ " where lx.maTruyen =: maTruyen and lx.ngayXem BETWEEN '"+startTime+"' and '"+endTime+"'";
		Query query = se.createQuery(sql);
		query.setParameter("luotXem", (luotXemModel.getLuotXem()+1));
		query.setParameter("maTruyen", luotXemModel.getMaTruyen());	
		query.executeUpdate();
		}
}

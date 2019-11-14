package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.NhomDichEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TruyenInfo;

@Transactional
public class TruyenImpl implements TruyenDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public PaginationResult<SelectTruyenInfo> litsTruyen(int page, int maxResult, int maxNavigationPage) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich ORDER BY tr.ngayTao DESC ";
		Query query = session.createQuery(sql);
		return new PaginationResult<SelectTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}


	@Override
	public List<SelectTruyenInfo> listTruyen() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich ORDER BY tr.ngayTao DESC ";
		Query query = session.createQuery(sql);
		return query.list();
	}
	@Override
	public Map<String, String> listPathVariableString() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich ORDER BY tr.ngayTao DESC ";
		Query query = session.createQuery(sql);
		List<SelectTruyenInfo> truyen= query.list();
		Map<String, String> url= new HashMap<String, String>();
		for(SelectTruyenInfo tr: truyen) {
			url.put(Helper.pathVariableString(tr.getTenTruyen()),tr.getID());
		}
		
		return url;
	}
	@Override
	public SelectTruyenInfo selectTruyenByMa(String maTruyen) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and tr.ID=: id ";
		Query query = session.createQuery(sql);
		query.setParameter("id", maTruyen);
		return (SelectTruyenInfo) query.uniqueResult();
	}


	@Override
	public int sumSoLuongTruyenOfTacGia(int maTacGia) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " ( tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu,tr.tenNhomDich, tr.luotXem,tr.nguon, tr.hinhAnh,tr.full, tr.hot, tr.news, tr.hienThi,tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr ," + TacGiaEntity.class.getName() + " tg"
				+ " where tr.maTacGia = tg.ID GROUP BY tr.id where tg.ID =: id";
		Query query = session.createQuery(sql);
		query.setParameter("id", maTacGia);
		return query.list().size();
	}

	@Override
	public TruyenEntity findTruyenEntity(String maTruyen) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(TruyenEntity.class);
		crit.add(Restrictions.eq("id", maTruyen));
		return (TruyenEntity) crit.uniqueResult();
	}

	@Override
	public void insertTruyen(TruyenInfo truyenInfo) {
		TruyenEntity truyen = new TruyenEntity();
		truyen.setID(truyenInfo.getID());
		truyen.setTenTruyen(truyenInfo.getTenTruyen());
		truyen.setMaTacGia(truyenInfo.getMaTacGia());
		truyen.setMaNhomDich(truyenInfo.getMaNhomDich());
		truyen.setSoChuong(truyenInfo.getSoChuong());
		truyen.setGioiThieu(truyenInfo.getGioiThieu());
		truyen.setLuotXem(truyenInfo.getLuotXem());
		truyen.setNguon(truyenInfo.getNguon());
		truyen.setHinhAnh(truyenInfo.getHinhAnh());
		truyen.setFull(truyenInfo.isFull());
		truyen.setHot(truyenInfo.isHot());
		truyen.setNews(truyenInfo.isNews());
		truyen.setHienThi(truyenInfo.isHienThi());
		truyen.setNgayTao(truyenInfo.getNgayTao());

		Session session = this.sessionFactory.getCurrentSession();
		session.persist(truyen);

	}
	@Override
	public void capNhatTruyen(TruyenInfo truyenInfo) {
		TruyenEntity truyen= findTruyenEntity(truyenInfo.getID());
		truyen.setTenTruyen(truyenInfo.getTenTruyen());
		truyen.setHinhAnh(truyenInfo.getHinhAnh());
		truyen.setNguon(truyenInfo.getNguon());
		truyen.setGioiThieu(truyenInfo.getGioiThieu());
		
		if(truyen!=null) {
			this.sessionFactory.getCurrentSession().update(truyen);
		}
		
	}
	@Override
	public void capNhatTrangThaiTruyen(String maTruyen, String trangThai, boolean value) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " update " + TruyenEntity.class.getName() + " tr set tr."+ trangThai +" =: tt where tr.ID =: id";

		Query query = session.createQuery(sql);
		query.setParameter("id", maTruyen);
		query.setParameter("tt", value);
		query.executeUpdate();

	}
	@Override
	public void capNhatSoLuongChuong(String maTruyen, int soChuong) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " update " + TruyenEntity.class.getName() + " tr set tr.soChuong =: sl where tr.ID =: id";

		Query query = session.createQuery(sql);
		query.setParameter("id", maTruyen);
		query.setParameter("sl", soChuong);
		query.executeUpdate();
	}

	@Override
	public void xoaTruyen(String maTruyen) {
		TruyenEntity truyenEntity = this.findTruyenEntity(maTruyen);
		if (truyenEntity != null) {
			this.sessionFactory.getCurrentSession().delete(truyenEntity);
		}
	}


	





	

//	@Override
//	public PaginationResult<truyenSelectInfo> litTruyen(int page, int maxResult, int maxNavigationPage) {
//		Session session = sessionFactory.getCurrentSession();
//		String sql = " Select new " + truyenSelectInfo.class.getName()
//				+ " (tr.hinhAnh, tr.ID, tr.tenTruyen, tg.tenTacGia, tl.tenTheLoai, tr.soChuong, tr.luotXem, tr.trangThai) "
//				+ " from " + truyenEntity.class.getName() + " tr ," + tacGiaEntity.class.getName() + " tg ,"
//				+ theLoaiTruyenEntity.class.getName() + " tl "
//				+ " where tr.idTacGia = tg.ID and tr.IDTheLoai=tl.id ORDER BY tr.id";
//		Query query = session.createQuery(sql);
//		return new PaginationResult<truyenSelectInfo>(query, page, maxResult, maxNavigationPage);
//	}

//	@Override
//	public PaginationResult<TruyenSelectInfo> litsTruyen(int page, int maxResult, int maxNavigationPage) {
//		Session session = sessionFactory.getCurrentSession();
//		String sql = " Select new " + TruyenSelectInfo.class.getName()
//				+ " (tr.hinhAnh, tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.luotXem, tr.trangThai,tr.ngayTao) "
//				+ " from " + TruyenEntity.class.getName() + " tr ," + TacGiaEntity.class.getName() + " tg"
//				+ " where tr.maTacGia = tg.ID GROUP BY tr.id";
//		Query query = session.createQuery(sql);
//		return new PaginationResult<TruyenSelectInfo>(query, page, maxResult, maxNavigationPage);
//	}
//
//	@Override
//	public SelectTruyenInfo SelectTruyenByMa(String maTruyen) {
//		Session session = sessionFactory.getCurrentSession();
//		String sql = " Select new " +SelectTruyenInfo.class.getName()
//				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong,tr.gioiThieu,nd.tenNhomDich, tr.luotXem, tr.nguon,tr.hinhAnh, tr.trangThai, tr.ngayTao) "
//				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
//				+NhomDichEntity.class.getName() + " nd "
//				+ " where tr.maTacGia = tg.ID and tr.maNhomDich= nd.maNhomDich and tr.ID =: mt ";
//		Query query = session.createQuery(sql);
//		query.setParameter("mt", maTruyen);
//		return (SelectTruyenInfo) query.uniqueResult();
//	}
//
//	@Override
//	public List<TruyenSelectInfo> listTR() {
//		Session session = sessionFactory.getCurrentSession();
//		String sql = " Select new " + TruyenSelectInfo.class.getName()
//				+ " (tr.hinhAnh, tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.luotXem, tr.trangThai, tr.ngayTao) "
//				+ " from " + TruyenEntity.class.getName() + " tr ," + TacGiaEntity.class.getName() + " tg"
//				+ " where tr.maTacGia = tg.ID GROUP BY tr.id ORDER BY tr.ngayTao DESC";
//		Query query = session.createQuery(sql);
//		return query.list();
//	}
//
//	@Override
//	public void InsertTruyen(TruyenInfo truyenInfo) {
//
//		TruyenEntity truyen = new TruyenEntity();
//		truyen.setID(truyenInfo.getID());
//		truyen.setTenTruyen(truyenInfo.getTenTruyen());
//		truyen.setMaTacGia(truyenInfo.getMaTacGia());
//		truyen.setMaNhomDich(truyenInfo.getMaNhomDich());
//		truyen.setSoChuong(truyenInfo.getSoChuong());
//		truyen.setGioiThieu(truyenInfo.getGioiThieu());
//		truyen.setLuotXem(truyenInfo.getLuotXem());
//		truyen.setNguon(truyenInfo.getNguon());
//		truyen.setHinhAnh(truyenInfo.getHinhAnh());
//		truyen.setTrangThai(truyenInfo.getTrangThai());
//		truyen.setNgayTao(truyenInfo.getNgayTao());
//
//		Session session = this.sessionFactory.getCurrentSession();
//		session.persist(truyen);
//	}
//
//	@Override
//	public int getSLTruyenofTacGia(int maTacGia) {
//		Session session = sessionFactory.getCurrentSession();
//		String sql = " ";
//		Query query = session.createQuery(sql);
//		query.setParameter("tacgia", maTacGia);
//		return query.list().size();
//	}
//
//	@Override
//	public TruyenEntity findTruyenEntity(String maTruyen) {
//		Session session = this.sessionFactory.getCurrentSession();
//		Criteria crit= session.createCriteria(TruyenEntity.class);
//		crit.add(Restrictions.eq("id", maTruyen));
//		return (TruyenEntity) crit.uniqueResult();
//	}
//
//	@Override
//	public void deleteTruyen(String maTruyen) {
//		TruyenEntity truyenEntity= this.findTruyenEntity(maTruyen);
//		if(truyenEntity != null)
//		{
//			this.sessionFactory.getCurrentSession().delete(truyenEntity);
//		}
//				
//		
//	}
//
//	@Override
//	public void upDataTrangThaiTr(String maTruyen, String trangThai) {
//		Session session = this.sessionFactory.getCurrentSession();
//		String sql = " update " + TruyenEntity.class.getName() + " tr set tr.trangThai=: tt where tr.ID =: id";
//
//		Query query = session.createQuery(sql);
//		query.setParameter("id", maTruyen);
//		query.setParameter("tt", trangThai);
//
//		query.executeUpdate();
//	}

}

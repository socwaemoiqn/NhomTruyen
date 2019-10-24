package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.truyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.nhomDichEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.tacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.truyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenInfoByTruyen;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenSelectInfo;

@Transactional
public class truyenImpl implements truyenDAO {

	@Autowired
	private SessionFactory sessionFactory;

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

	@Override
	public PaginationResult<truyenSelectInfo> litsTruyen(int page, int maxResult, int maxNavigationPage) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + truyenSelectInfo.class.getName()
				+ " (tr.hinhAnh, tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.luotXem, tr.trangThai) "
				+ " from " + truyenEntity.class.getName() + " tr ," + tacGiaEntity.class.getName() + " tg"
				+ " where tr.maTacGia = tg.ID GROUP BY tr.id";
		Query query = session.createQuery(sql);
		return new PaginationResult<truyenSelectInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public truyenInfoByTruyen SelectTruyenByMa(int maTruyen) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " +truyenInfoByTruyen.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong,tr.gioiThieu,nd.tenNhomDich, tr.luotXem,tr.nguon,tr.hinhAnh, tr.trangThai, tr.ngayTao) "
				+ " from " + truyenEntity.class.getName() + " tr, " + tacGiaEntity.class.getName() + " tg, "
				+nhomDichEntity.class.getName() + " nd "
				+ " where  tr.maTacGia = tg.ID and tr.maNhomDich=nd.maNhomDich and tr.ID =: mt ";
		Query query = session.createQuery(sql);
		query.setParameter("mt", maTruyen);
		return (truyenInfoByTruyen) query.uniqueResult();
	}

	@Override
	public List<truyenSelectInfo> listTR() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + truyenSelectInfo.class.getName()
				+ " (tr.hinhAnh, tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.luotXem, tr.trangThai) "
				+ " from " + truyenEntity.class.getName() + " tr ," + tacGiaEntity.class.getName() + " tg"
				+ " where tr.maTacGia = tg.ID GROUP BY tr.id";
		Query query = session.createQuery(sql);
		return query.list();
	}

}

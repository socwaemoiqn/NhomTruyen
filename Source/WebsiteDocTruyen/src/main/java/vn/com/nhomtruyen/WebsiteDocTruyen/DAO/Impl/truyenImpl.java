package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.truyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.tacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.theLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.truyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.truyenSelectInfo;

@Transactional
public class truyenImpl implements truyenDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public PaginationResult<truyenSelectInfo> litTruyen(int page, int maxResult, int maxNavigationPage) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + truyenSelectInfo.class.getName()
				+ " (tr.hinhAnh, tr.ID, tr.tenTruyen, tg.tenTacGia, tl.tenTheLoai, tr.soChuong, tr.luotXem, tr.trangThai) "
				+ " from " + truyenEntity.class.getName() + " tr ," + tacGiaEntity.class.getName() + " tg ,"
				+ theLoaiTruyenEntity.class.getName() + " tl "
				+ " where tr.idTacGia = tg.ID and tr.IDTheLoai=tl.id ORDER BY tr.id";
		Query query = session.createQuery(sql);
		return new PaginationResult<truyenSelectInfo>(query, page, maxResult, maxNavigationPage);
	}

}

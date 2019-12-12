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
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.ChiTietTheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.NhomDichEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TheLoaiTruyenEntity;
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
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich ORDER BY tr.ngayTao DESC ";
		Query query = session.createQuery(sql);
		return new PaginationResult<SelectTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public PaginationResult<SelectTruyenInfo> getTruyenByTen(String tenTruyen, int page, int maxResult,
			int maxNavigationPage) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and tr.tenTruyen like: ten ";
		Query query = session.createQuery(sql);
		query.setParameter("ten", "%" + tenTruyen + "%");
		return new PaginationResult<SelectTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public List<SelectTruyenInfo> searchTruyen(String tenTruyen) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and tr.tenTruyen like: ten ";
		Query query = session.createQuery(sql);
		query.setParameter("ten", "%" + tenTruyen + "%");
		return query.list();
	}

	@Override
	public List<SelectTruyenInfo> listTruyen() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich ORDER BY tr.ngayTao DESC ";
		Query query = session.createQuery(sql);
		return query.list();
	}

	@Override
	public Map<String, String> listPathVariableString() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich ORDER BY tr.ngayTao DESC ";
		Query query = session.createQuery(sql);
		List<SelectTruyenInfo> truyen = query.list();
		Map<String, String> url = new HashMap<String, String>();
		for (SelectTruyenInfo tr : truyen) {
			url.put(Helper.pathVariableString(tr.getTenTruyen()), tr.getID());
		}

		return url;
	}

	@Override
	public SelectTruyenInfo selectTruyenByMa(String maTruyen) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and tr.ID=: id ";
		Query query = session.createQuery(sql);
		query.setParameter("id", maTruyen);
		return (SelectTruyenInfo) query.uniqueResult();
	}

	@Override
	public boolean selectTruyenByTen(String tenTruyen) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and tr.tenTruyen =: ten ";
		Query query = session.createQuery(sql);
		query.setParameter("ten", tenTruyen);

		if (query.list().size() >= 1) {
			return true;
		}
		return false;
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
		TruyenEntity truyen = findTruyenEntity(truyenInfo.getID());
		truyen.setTenTruyen(truyenInfo.getTenTruyen());
		truyen.setHinhAnh(truyenInfo.getHinhAnh());
		truyen.setMaTacGia(truyenInfo.getMaTacGia());
		truyen.setNguon(truyenInfo.getNguon());
		truyen.setGioiThieu(truyenInfo.getGioiThieu());

		this.sessionFactory.getCurrentSession().update(truyen);

	}

	@Override
	public void capNhatTrangThaiTruyen(String maTruyen, String trangThai, boolean value) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " update " + TruyenEntity.class.getName() + " tr set tr." + trangThai + " =: tt where tr.ID =: id";

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
	public void capNhatLuotXem(SelectTruyenInfo truyenInfo) {
		TruyenEntity truyen = findTruyenEntity(truyenInfo.getID());
		truyen.setLuotXem(truyen.getLuotXem() + 1);
		this.sessionFactory.getCurrentSession().update(truyen);
	}

	@Override
	public void xoaTruyen(String maTruyen) {
		TruyenEntity truyenEntity = this.findTruyenEntity(maTruyen);
		if (truyenEntity != null) {
			this.sessionFactory.getCurrentSession().delete(truyenEntity);
		}
	}

	@Override
	public List<SelectTruyenInfo> selectAllTruyenNoFull() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and NOT tr.full = 1 ";
		Query query = session.createQuery(sql);
		return query.list();
	}

	// select danh cho trang index
	@Override
	public List<SelectTruyenInfo> selectAllTruyenByDanhMuc(String danhMuc) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and tr." + danhMuc + " = 1 ";
		Query query = session.createQuery(sql);
		return query.list();
	}

	@Override
	public List<SelectTruyenInfo> selectAllTheLoaiTruyen(String tenTheLoai) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd, " + ChiTietTheLoaiTruyenEntity.class.getName() + " cttl, "
				+ TheLoaiTruyenEntity.class.getName() + " tl "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and cttl.maTruyen=tr.ID and cttl.maTheLoai= tl.id and tl.tenTheLoai = '"
				+ tenTheLoai + "' ";
		Query query = session.createQuery(sql);
		return query.list();
	}

	@Override
	public List<SelectTruyenInfo> selectAllTruyenByTacGia(String tenTacGia) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and tg.tenTacGia =: tenTacGia ";
		Query query = session.createQuery(sql);
		query.setParameter("tenTacGia", tenTacGia);
		return query.list();
	}

	@Override
	public PaginationResult<SelectTruyenInfo> getTruyenByTacGia(int maTacGia, int page, int maxResult,
			int maxNavigationPage) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and tr.maTacGia =: maTacGia ";
		Query query = session.createQuery(sql);
		query.setParameter("maTacGia", maTacGia);
		return new PaginationResult<SelectTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}

	@Override

	public List<SelectTruyenInfo> thongKetruyen(String thongKe, String batDau, String ketThuc) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen, tg.tenTacGia, tr.soChuong, tr.gioiThieu, nd.tenNhomDich, tr.luotXem, tr.nguon, tr.hinhAnh, tr.full, tr.hot, tr.news, tr.hienThi, tr.ngayTao) "
				+ " from " + TruyenEntity.class.getName() + " tr, " + TacGiaEntity.class.getName() + " tg, "
				+ NhomDichEntity.class.getName() + " nd "
				+ " where tr.maTacGia = tg.ID and nd.maNhomDich=tr.maNhomDich and tr."
				+ thongKe + " = 1 and tr.ngayTao BETWEEN '"+ batDau +"' and '" +ketThuc+"' ";
		Query query = session.createQuery(sql);
		return query.list();
	}

	public List<SelectTruyenInfo> selectTop10TruyenByLuotXem() {
		Session session = sessionFactory.getCurrentSession();
		String sql = " Select new " + SelectTruyenInfo.class.getName()
				+ " (tr.ID, tr.tenTruyen,tr.luotXem) "
				+ " from " + TruyenEntity.class.getName() + " tr "
				+ " ORDER BY tr.luotXem DESC ";
		Query query = session.createQuery(sql).setMaxResults(10);
		return query.list();
	}


}

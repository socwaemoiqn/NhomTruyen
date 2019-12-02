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
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.ChiTietTheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.DanhMucTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChiTietTheLoaiTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

public class TheLoaiTruyenImpl implements TheLoaiTruyenDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<TheLoaiTruyenInfo> dsTheLoai() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + TheLoaiTruyenInfo.class.getName()
				+ "(a.id, a.tenTheLoai, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TheLoaiTruyenEntity.class.getName() + " a";

		Query query = se.createQuery(sql);
		return query.list();
	}

	

	@Override
	public PaginationResult<TheLoaiTruyenInfo> listTheLoaiTruyen(int page, int maxResult, int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + TheLoaiTruyenInfo.class.getName()
				+ "(a.id, a.tenTheLoai, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TheLoaiTruyenEntity.class.getName() + " a ORDER BY a.id DESC";

		Query query = session.createQuery(sql);
		return new PaginationResult<TheLoaiTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}
	@Override
	public PaginationResult<TheLoaiTruyenInfo> searchTheLoai(String tuKhoa, int page, int maxResult,
			int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = " Select new " + TheLoaiTruyenInfo.class.getName()
				+ "(a.id, a.tenTheLoai, a.gioiThieu, a.trangThai, a.ngayTao)" + " from "
				+ TheLoaiTruyenEntity.class.getName() + " a where a.tenTheLoai like :tuKhoa";

		Query query = session.createQuery(sql);
		query.setParameter("tuKhoa", "%"+tuKhoa+"%");
		return new PaginationResult<TheLoaiTruyenInfo>(query, page, maxResult, maxNavigationPage);
	}
	@Override
	public List<ChiTietTheLoaiTruyenInfo> dsTenTheLoai() {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + ChiTietTheLoaiTruyenInfo.class.getName()
				+ "(ct.id, ct.maTruyen,ct.maTheLoai,tl.tenTheLoai)" + " from "
				+ ChiTietTheLoaiTruyenEntity.class.getName() + " ct, " + TheLoaiTruyenEntity.class.getName() + " tl "
				+ " where ct.maTheLoai = tl.id ";

		Query query = se.createQuery(sql);

		return query.list();
	}

	@Override
	public List<ChiTietTheLoaiTruyenInfo> listTenTlOfTruyen(String maTruyen) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + ChiTietTheLoaiTruyenInfo.class.getName()
				+ "(ct.id, ct.maTruyen,ct.maTheLoai,tl.tenTheLoai)" + " from "
				+ ChiTietTheLoaiTruyenEntity.class.getName() + " ct, " + TheLoaiTruyenEntity.class.getName() + " tl "
				+ " where ct.maTheLoai = tl.id and ct.maTruyen =: maTruyen ";

		Query query = se.createQuery(sql);
		query.setParameter("maTruyen", maTruyen);
		return query.list();
	}

	@Override
	public int soLuongTruyenOfOneTheLoai(int maTheLoai) {
		Session se = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + ChiTietTheLoaiTruyenInfo.class.getName()
				+ "(ct.id, ct.maTruyen,ct.maTheLoai,tl.tenTheLoai)" + " from "
				+ ChiTietTheLoaiTruyenEntity.class.getName() + " ct, " + TheLoaiTruyenEntity.class.getName() + " tl, "
				+ TruyenEntity.class.getName() + " tr "
				+ " where ct.maTruyen=tr.ID and tl.id=ct.maTheLoai and tl.id=: maTheLoai";

		Query query = se.createQuery(sql);
		query.setParameter("maTheLoai", maTheLoai);
		return query.list().size();

	}

	@Override
	public TheLoaiTruyenEntity findTheLoaiTruyenEntity(int id) {

		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(TheLoaiTruyenEntity.class);
		crit.add(Restrictions.eq("id", id));
		return (TheLoaiTruyenEntity) crit.uniqueResult();
	}

	@Override
	public TheLoaiTruyenInfo findTheLoaiTruyenInfo(int id) {
		TheLoaiTruyenEntity theLoaiTruyenEntity = this.findTheLoaiTruyenEntity(id);
		if (theLoaiTruyenEntity == null) {
			return null;
		}
		return new TheLoaiTruyenInfo(theLoaiTruyenEntity.getId(), theLoaiTruyenEntity.getTenTheLoai(),
				theLoaiTruyenEntity.getGioiThieu(), theLoaiTruyenEntity.getTrangThai(),
				theLoaiTruyenEntity.getTrangThai());
	}

	@Override
	public List<ChiTietTheLoaiTruyenEntity> findChiTietTheLoaiEntity(String maTruyen) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ChiTietTheLoaiTruyenEntity.class);
		crit.add(Restrictions.eq("maTruyen", maTruyen));
		return crit.list();
	}

	@Override
	public void insertTheLoaiTruyen(TheLoaiTruyenInfo theLoaiTruyenInfo) {
		TheLoaiTruyenEntity theLoai = new TheLoaiTruyenEntity();
		theLoai.setTenTheLoai(theLoaiTruyenInfo.getTenTheLoai());
		theLoai.setGioiThieu(theLoaiTruyenInfo.getGioiThieu());
		theLoai.setTrangThai("1");
		theLoai.setNgayTao(Helper.getCurrentDateAndTime());

		Session session = this.sessionFactory.getCurrentSession();
		session.persist(theLoai);

	}

	@Override
	public void insertChiTietTheLoai(ChiTietTheLoaiTruyenInfo chiTietTheLoaiTruyenInfo) {
		ChiTietTheLoaiTruyenEntity chiTietTheLoaiTruyenEntity = new ChiTietTheLoaiTruyenEntity();
		chiTietTheLoaiTruyenEntity.setMaTruyen(chiTietTheLoaiTruyenInfo.getMaTruyen());
		chiTietTheLoaiTruyenEntity.setMaTheLoai(chiTietTheLoaiTruyenInfo.getMaTheLoai());
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(chiTietTheLoaiTruyenEntity);
	}

	@Override
	public void capNhatTheLoaiTruyen(TheLoaiTruyenInfo info) {
		TheLoaiTruyenEntity theLoai = findTheLoaiTruyenEntity(info.getId());
		theLoai.setTenTheLoai(info.getTenTheLoai());
		theLoai.setGioiThieu(info.getGioiThieu());
		theLoai.setTrangThai(info.getTrangThai());
		this.sessionFactory.getCurrentSession().update(theLoai);
	}

	@Override
	public void capNhatTrangThaiTheLoai(TheLoaiTruyenInfo theLoaiTruyenInfo) {
		TheLoaiTruyenEntity theLoai = findTheLoaiTruyenEntity(theLoaiTruyenInfo.getId());
		theLoai.setTrangThai(theLoaiTruyenInfo.getTrangThai());
		this.sessionFactory.getCurrentSession().update(theLoai);
	}

	@Override
	public void xoaChiTietTheLoaiTheoTruyen(String maTruyen) {
		List<ChiTietTheLoaiTruyenEntity> cttlt = this.findChiTietTheLoaiEntity(maTruyen);
		if (cttlt != null) {
			for (ChiTietTheLoaiTruyenEntity ct : cttlt) {
				this.sessionFactory.getCurrentSession().delete(ct);
			}

		}

	}

	@Override
	public void XoaTheLoaiTruyenTheoID(int id) {
		TheLoaiTruyenEntity theLoai = findTheLoaiTruyenEntity(id);
		if (theLoai != null) {
			this.sessionFactory.getCurrentSession().delete(theLoai);
		}

	}

}

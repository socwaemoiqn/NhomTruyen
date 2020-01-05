package vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.NhomDichDao;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.NhomDichEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TheLoaiTruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.NhomDichModel;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

public class NhomDichImpl implements NhomDichDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public PaginationResult<NhomDichModel> listNhomDich(int page, int maxResult, int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + NhomDichModel.class.getName() // lấy và trả về đối tượng.
				+ " ( nd.maNhomDich, nd.tenNhomDich, nd.ngayTao, nd.trangThai ) " + " from "
				+ NhomDichEntity.class.getName() + "  nd ";
		Query query = session.createQuery(sql);

		return new PaginationResult<NhomDichModel>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public PaginationResult<NhomDichModel> searchNhomDich(String tuKhoa, int page, int maxResult,
			int maxNavigationPage) {
		Session session = this.sessionFactory.getCurrentSession();

		String sql = " Select new " + NhomDichModel.class.getName() // lấy và trả về đối tượng.
				+ " ( nd.maNhomDich, nd.tenNhomDich, nd.ngayTao, nd.trangThai ) " + " from "
				+ NhomDichEntity.class.getName() + "  nd where nd.tenNhomDich like: ten ";
		Query query = session.createQuery(sql);
		query.setParameter("ten", "%" + tuKhoa + "%");

		return new PaginationResult<NhomDichModel>(query, page, maxResult, maxNavigationPage);
	}

	@Override
	public void insertNhomDich(NhomDichModel nhomDichModel) {
		NhomDichEntity nhomDich = new NhomDichEntity();

		nhomDich.setTenNhomDich(nhomDichModel.getTenNhomDich());
		nhomDich.setNgayTao(Helper.getCurrentDateAndTime());
		nhomDich.setTrangThai("1");

		Session session = this.sessionFactory.getCurrentSession();
		session.persist(nhomDich);

	}

	@Override
	public NhomDichEntity findNhomDichEntity(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(NhomDichEntity.class);
		crit.add(Restrictions.eq("id", id));
		return (NhomDichEntity) crit.uniqueResult();
	}

	@Override
	public NhomDichModel findNhomDichModel(int id) {
		NhomDichEntity nhomEntity = this.findNhomDichEntity(id);
		if (nhomEntity == null) {
			return null;
		}
		return new NhomDichModel(nhomEntity.getMaNhomDich(), nhomEntity.getTenNhomDich(),
				nhomEntity.getNgayTao(),nhomEntity.getTrangThai());
	}

	@Override
	public void capNhatNhomDich(NhomDichModel nhomDichModel) {
		NhomDichEntity nhomDichEntity= findNhomDichEntity(nhomDichModel.getMaNhomDich());
		nhomDichEntity.setTenNhomDich(nhomDichModel.getTenNhomDich());
		nhomDichEntity.setTrangThai(nhomDichModel.getTrangThai());
		this.sessionFactory.getCurrentSession().update(nhomDichEntity);
		
	}

	@Override
	public void xoaNhomDich(int id) {
		NhomDichEntity nhomDich = findNhomDichEntity(id);
		if (nhomDich != null) {
			this.sessionFactory.getCurrentSession().delete(nhomDich);
		}

	}

}

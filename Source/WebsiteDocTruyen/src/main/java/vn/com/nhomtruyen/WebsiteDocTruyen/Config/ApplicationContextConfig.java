package vn.com.nhomtruyen.WebsiteDocTruyen.Config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.ChuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.InfoTaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.PhanHoiDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.RoleDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TaiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.ChuongImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.DanhMucTruyenImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.InfoTaiKhoanImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.PhanHoiImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.RoleImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.TacGiaImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.TheLoaiTruyenImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.TruyenImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.TaiKhoanImpl;

@Configuration
@ComponentScan(" vn.com.nhomtruyen.WebsiteDocTruyen.*")
@EnableTransactionManagement
//Load to Environment.
@PropertySource("classpath:ds-hibernate-cfg.properties")
public class ApplicationContextConfig {
	@Bean(name = "viewResolver")
	public InternalResourceViewResolver getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	// Quy đinh dung lượng file up
	@Bean(name = "multipartResolver")
	public MultipartResolver getMultipartResolver() {
		CommonsMultipartResolver resover = new CommonsMultipartResolver();
		// 1MB
		resover.setMaxUploadSize(1 * 1024 * 1024);

		return resover;
	}

	// Lưu trữ các giá thuộc tính load bởi @PropertySource.
	@Autowired
	private Environment env;

	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();

		dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
		dataSource.setUrl(env.getProperty("ds.url"));
		dataSource.setUsername(env.getProperty("ds.username"));
		dataSource.setPassword(env.getProperty("ds.password"));

		return dataSource;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) throws Exception {
		Properties properties = new Properties();

		// Xem: ds-hibernate-cfg.properties
		properties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
		properties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
		properties.put("current_session_context_class", env.getProperty("current_session_context_class"));

		LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
		factoryBean.setPackagesToScan(new String[] { "vn.com.nhomtruyen.WebsiteDocTruyen.Entity" }); ////
		factoryBean.setDataSource(dataSource);
		factoryBean.setHibernateProperties(properties);
		factoryBean.afterPropertiesSet();
		//
		SessionFactory sf = factoryBean.getObject();
		return sf;
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);

		return transactionManager;
	}

	@Bean(name = "danhMucTruyenDAO")
	public DanhMucTruyenDAO getApplicantDAO() {
		return new DanhMucTruyenImpl();
	}

	@Bean(name = "theLoaiTruyenDAO")
	public TheLoaiTruyenDAO getTheLoaiTruyenDAO() {
		return new TheLoaiTruyenImpl();
	}
	@Bean(name = "infoTaiKhoanDAO")
	public InfoTaiKhoanDAO getInfoTaiKhoanDAO() {
		return new InfoTaiKhoanImpl();
	}
	@Bean(name = "taiKhoanDAO")
	public TaiKhoanDAO getUserAccountDAO() {
		return new TaiKhoanImpl();
	}

	@Bean(name = "truyenDAO")
	public TruyenDAO getTruyenDAO() {
		return new TruyenImpl();
	}

	@Bean(name = "chuongDAO")
	public ChuongDAO getChuongDAO() {
		return new ChuongImpl();
	}

	@Bean(name = "tacGiaDAO")
	public TacGiaDAO getTacGiaDAO() {
		return new TacGiaImpl();
	}
	@Bean(name = "roleDAO")
	public RoleDAO getRoleDAO() {
		return new RoleImpl();
	}
	@Bean(name = "phanHoiInfo")
	public PhanHoiDAO getphanHoiDAO() {
		return new PhanHoiImpl();
	}
}

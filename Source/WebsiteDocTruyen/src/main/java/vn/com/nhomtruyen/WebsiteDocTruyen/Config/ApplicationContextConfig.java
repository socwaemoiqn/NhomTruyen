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
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.chuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.danhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.tacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.theLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.truyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.taiKhoanDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.chuongImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.danhMucTruyenImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.tacGiaImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.theLoaiTruyenImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.truyenImpl;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.Impl.taiKhoanImpl;

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
		public danhMucTruyenDAO getApplicantDAO() {
			return new danhMucTruyenImpl();
		}
		
		@Bean(name = "theLoaiTruyenDAO")
		public theLoaiTruyenDAO getTheLoaiTruyenDAO() {
			return new theLoaiTruyenImpl();
		}
		@Bean(name = "userAccountsDAO")
		public taiKhoanDAO getUserAccountDAO() {
			return new taiKhoanImpl();
		}
		@Bean(name = "truyenDAO")
		public truyenDAO getTruyenDAO() {
			return new truyenImpl();
		}
		
		@Bean(name = "chuongDAO")
		public chuongDAO getChuongDAO() {
			return new chuongImpl();
		}
		@Bean(name = "tacGiaDAO")
		public tacGiaDAO getTacGiaDAO() {
			return new tacGiaImpl();
		}
}

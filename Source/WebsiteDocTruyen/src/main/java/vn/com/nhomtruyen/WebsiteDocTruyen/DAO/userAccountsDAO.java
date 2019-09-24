package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;


import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.userAccountsInfo;

@Transactional
public interface userAccountsDAO {
	public userAccountsInfo login(String userName, String passWord);
}

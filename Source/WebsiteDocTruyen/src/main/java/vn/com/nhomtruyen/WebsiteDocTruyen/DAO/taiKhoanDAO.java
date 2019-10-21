package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;


import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.taiKhoanInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.userAccountsInfo;

@Transactional
public interface taiKhoanDAO {
	public userAccountsInfo login(String userName, String passWord);
	public taiKhoanInfo ck_login(String userName, String passWord);
}

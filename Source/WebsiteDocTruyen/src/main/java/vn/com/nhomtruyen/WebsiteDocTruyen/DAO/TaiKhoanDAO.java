package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;


import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TaiKhoanInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.UserAccountsInfo;

@Transactional
public interface TaiKhoanDAO {
	public UserAccountsInfo login(String userName, String passWord);
	public TaiKhoanInfo ck_login(String userName, String passWord);
}

package vn.com.nhomtruyen.WebsiteDocTruyen.Common;

import javax.servlet.http.HttpServletRequest;

import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TaiKhoanEntity;

public class Authencation {
	public static boolean Auth(HttpServletRequest request, int maRole)
	{	if (request.getSession().getAttribute("acc_login") == null)
			return false;
		else
		{
			TaiKhoanEntity taiKhoanEntity = (TaiKhoanEntity) request.getSession().getAttribute("acc_login");
			if(taiKhoanEntity.getMaRole() != maRole)
				return false;
		}
		return true;
	}
}

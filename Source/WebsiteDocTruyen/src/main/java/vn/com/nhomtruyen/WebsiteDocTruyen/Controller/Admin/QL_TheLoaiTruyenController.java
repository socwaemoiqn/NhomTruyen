package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;

@Controller(value = "QL_TheLoaiTruyenControllerOfAdmin")
@RequestMapping(value = "/quan-tri/ql_theloai_truyen")
public class QL_TheLoaiTruyenController {

	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDAO;
	
	@RequestMapping(value = "")
	public String abcd() {
		return "";
	}
}

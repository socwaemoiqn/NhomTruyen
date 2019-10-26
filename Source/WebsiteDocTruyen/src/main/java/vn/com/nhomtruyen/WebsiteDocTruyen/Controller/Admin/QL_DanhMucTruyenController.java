package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;

@Controller(value = "QL_DanhMucTruyenControllerOfAdmin")
@RequestMapping(value = "/quan-tri/ql_danhmuc_truyen")
public class QL_DanhMucTruyenController {
	
	@Autowired
	private DanhMucTruyenDAO danhMucTruyenDAO;
	
	@RequestMapping(value = "/them", method = RequestMethod.POST)
	public String themDMTruyenPage(Model model, HttpServletRequest request) {
		Random rand = new Random();
		Calendar cal = Calendar.getInstance();
		int id =rand.nextInt(1000); 
		String tenDanhMuc=request.getParameter("tenDanhMuc");
		String gioiThieu=request.getParameter("gioiThieu");
		String trangThai="1";
		String ngayTao=cal.get(Calendar.YEAR)+"/"+(cal.get(Calendar.MONTH)+1)+"/"+cal.get(Calendar.DAY_OF_MONTH);
		DanhMucTruyenInfo danhMucTruyenInfo= new DanhMucTruyenInfo(id,tenDanhMuc,gioiThieu,trangThai, ngayTao);
		danhMucTruyenDAO.insertDanhMucTruyen(danhMucTruyenInfo);
		
		return "redirect:/quan-tri/ql_danhmuc_truyen";
	}
	@RequestMapping(value="/xoa", method=RequestMethod.GET)
	public String xoaDanhMuc(Model model, @RequestParam("id") int id) {
		if(id!=0) {
			danhMucTruyenDAO.deleteDanhMucTruyen(id);
		}
		return "redirect:/quan-tri/ql_danhmuc_truyen";
	}
	
	
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String updataDanhMuc(Model model, @RequestParam("id") int id) {
		DanhMucTruyenInfo danhMucTruyenInfo=null;
		
		if(id!= 0) {
			danhMucTruyenInfo=danhMucTruyenDAO.findDanhMucTruyenInfo(id);
		}
		if(danhMucTruyenInfo!=null) {
			return "redirect:/quan-tri/ql_danhmuc_truyen";
		}
		return "redirect:/quan-tri/ql_danhmuc_truyen";
	}
	
	
	
	
}

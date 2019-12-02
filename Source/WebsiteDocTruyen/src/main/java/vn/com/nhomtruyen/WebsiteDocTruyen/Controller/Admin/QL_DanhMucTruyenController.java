package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Controller(value = "QL_DanhMucTruyenControllerOfAdmin")
@RequestMapping(value = "/quan-tri/ql-danh-muc-truyen")
public class QL_DanhMucTruyenController {
	
	@Autowired
	private DanhMucTruyenDAO danhMucTruyenDAO;
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String QlDanhMucTruyenPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {

		// List<danhMucTruyenInfo> listDanhMuc= danhMucTruyenDAO.dsDanhMucTruyen();

		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 10;
		final int Max_Navigation = 5;
		PaginationResult<DanhMucTruyenInfo> listDanhMuc = danhMucTruyenDAO.listDanhMucTruyen(page, Max_Result,
				Max_Navigation);

		model.addAttribute("danhMucTruyen", listDanhMuc);

		return "admin/ql_danhmuctruyen";
	}
	@RequestMapping(value = "/them-danh-muc", method = RequestMethod.POST)
	public String themDMTruyenPage(Model model, HttpServletRequest request, HttpSession session) {
		
		String tenDanhMuc=request.getParameter("tenDanhMuc");
		String gioiThieu=request.getParameter("gioiThieu");
		String trangThai="1";
		String ngayTao=Helper.getCurrentDateAndTime();
		DanhMucTruyenInfo danhMucTruyenInfo= new DanhMucTruyenInfo(tenDanhMuc,gioiThieu,trangThai, ngayTao);
		danhMucTruyenDAO.insertDanhMucTruyen(danhMucTruyenInfo);
		
		session.setAttribute("themDanhMuc", tenDanhMuc);
		
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}
	@RequestMapping(value="/xoa-danh-muc", method=RequestMethod.POST)
	public String xoaDanhMuc(HttpServletRequest request,HttpSession session, @RequestParam("idDanhMuc") int id, @RequestParam("tenDanhMuc") String tenDanhMuc) {
		if(id!=0) {
			danhMucTruyenDAO.deleteDanhMucTruyen(id);
		}
		
		session.setAttribute("tenDanhMucXoa", tenDanhMuc);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}
	
	
	
	@RequestMapping(value="/sua-danh-muc", method=RequestMethod.POST)
	public String updataDanhMuc(Model model,HttpServletRequest request, HttpSession  session ) {
		String id = request.getParameter("idDanhMuc");
		String tenDanhMuc= request.getParameter("tenDanhMuc");
		String gioiThieu = request.getParameter("gioiThieu");
		String trangThai=request.getParameter("trangThai");
		if(!tenDanhMuc.isEmpty() || tenDanhMuc.length()>10) {
			DanhMucTruyenInfo info= new DanhMucTruyenInfo();
			info.setId(Integer.parseInt(id));
			info.setTenDanhMuc(tenDanhMuc);
			info.setGioiThieu(gioiThieu);
			info.setTrangThai(trangThai);
			danhMucTruyenDAO.capNhatDanhMuc(info);
			session.setAttribute("capNhatDanhMuc", tenDanhMuc);
		}
		else {
			session.setAttribute("loiCapNhat", true);
		}
		
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}
	@RequestMapping(value = "/tac-vu/{action}", method = RequestMethod.POST)
	public String tacVu(Model model, @PathVariable("action") String action, HttpServletRequest request,
			HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		
		String json = request.getParameter("array_id");
		ObjectMapper mapper = new ObjectMapper();	
		String[] array_id = mapper.readValue(json, String[].class);
		Map<String,String> mess = new HashMap<String, String>();
		DanhMucTruyenInfo danhMucTruyenInfo= new DanhMucTruyenInfo();
		switch (action) {
		case "enable":
			for (String id : array_id) {
				danhMucTruyenInfo.setId(Integer.parseInt(id));
				danhMucTruyenInfo.setTrangThai("1");
				danhMucTruyenDAO.capNhatTrangThaiDanhMuc(danhMucTruyenInfo);
			}
			mess.put("css", "alert-info");
			mess.put("trangThai", "Kích hoạt thành công: <br>" + array_id.length + " danh mục truyện.");
			break;
		case "disable":
			for (String id : array_id) {
				danhMucTruyenInfo.setId(Integer.parseInt(id));
				danhMucTruyenInfo.setTrangThai("0");
				danhMucTruyenDAO.capNhatTrangThaiDanhMuc(danhMucTruyenInfo);
			}
			mess.put("css", "alert-info");
			mess.put("trangThai", "Bỏ kích hoạt thành công: <br>" + array_id.length + " danh mục truyện. ");
			break;
		case "delete":
			for (String id : array_id) {
				danhMucTruyenDAO.deleteDanhMucTruyen(Integer.parseInt(id));
			}
			mess.put("css", "alert-danger");
			mess.put("trangThai", "Xóa: " + array_id.length + " danh mục truyện thành công!");
			break;
		default:
			break;
		
		}
		session.setAttribute("tacVu", mess);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}
	
	@RequestMapping(value = "/tim-kiem/", method = RequestMethod.GET)
	public String searchTheLoai(Model model, @RequestParam("tu-khoa") String tuKhoa, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page=1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 10;
		final int Max_Navigation = 4;

		PaginationResult<DanhMucTruyenInfo> listDanhMuc = danhMucTruyenDAO.searchDanhMuc(tuKhoa, page, Max_Result, Max_Navigation);
//		Map<Integer, Integer> slTruyen = new HashMap<Integer, Integer>();
//		for (TheLoaiTruyenInfo theLoai : listTheLoaiTruyen.getList()) {
//			slTruyen.put(theLoai.getId(), theLoaiTruyenDAO.soLuongTruyenOfOneTheLoai(theLoai.getId()));
//		}

		model.addAttribute("danhMucTruyen", listDanhMuc);
		//model.addAttribute("slTruyen", slTruyen);
		model.addAttribute("sl", listDanhMuc.getTotalRecords());
		return "admin/ql_danhmuctruyen";
	}
	
	@RequestMapping(value="/ajax", method = RequestMethod.POST)
	public @ResponseBody String loadAjax(Model model, HttpServletRequest request, HttpSession session)
			throws JsonProcessingException {
		int id = Integer.parseInt(request.getParameter("id"));
		DanhMucTruyenInfo info = danhMucTruyenDAO.findDanhMucTruyenInfo(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(info);
		return json;
	}
	
	
	
	
}

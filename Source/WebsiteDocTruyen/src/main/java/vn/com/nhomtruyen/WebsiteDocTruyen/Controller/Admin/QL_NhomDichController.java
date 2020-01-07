package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Authencation;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.NhomDichDao;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.DanhMucTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.NhomDichModel;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Controller 
@RequestMapping(value="/quan-tri/ql-nhom-dich")
public class QL_NhomDichController {

	@Autowired
	private NhomDichDao nhomDichDao;
//	@RequestMapping(value =" ", method= RequestMethod.GET)
//	public String nhomDichPage(Model model ) {
//		
//		
//		int maxResult =2;
//		int maxNavigationPage=3;
//		
//		PaginationResult<NhomDichModel> listNhomDich= nhomDichDao.listNhomDich(1, maxResult, maxNavigationPage);
//		
//		model.addAttribute("listNhomDich", listNhomDich);
//		return "admin/ql_nhomdich";
//	}
	
	public PaginationResult<NhomDichModel> getData(HttpServletRequest request) {

		int Max_Result = 2;
		final int Max_Navigation = 10;
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		
		String tuKhoa = request.getParameter("tu-khoa") == null ? "" : request.getParameter("tu-khoa");
		PaginationResult<NhomDichModel> list;
		
		if (tuKhoa.isEmpty()) {
			list = nhomDichDao.listNhomDich(page, Max_Result, Max_Navigation);
		} else {
			Max_Result = 100;
			list = nhomDichDao.searchNhomDich(tuKhoa, page, Max_Result, Max_Navigation);
			request.getSession().setAttribute("tuKhoa", tuKhoa);
		}
		return list;
	}

	@RequestMapping(value = { "/*", "" }, method = RequestMethod.GET)
	public String QlNhomDichPage(Model model, HttpServletRequest request) {

		String urlRedirect = "";
		if (!Authencation.Auth(request, 1)) {
			urlRedirect = "redirect:/";
		} else {
			PaginationResult<NhomDichModel> listDanhMuc = getData(request);

			model.addAttribute("listNhomDich", listDanhMuc);
			urlRedirect = "admin/ql_nhomdich";
		}

		return urlRedirect;
	}
	
	//GET, POST, PUT, DELETE
	
	@RequestMapping(value = { "/them-nhom-dich"}, method = RequestMethod.POST)
	public String insertNhomDich(Model model, HttpServletRequest request, HttpSession session) {

		String urlRedirect = "";
		if (!Authencation.Auth(request, 1)) {
			urlRedirect = "redirect:/";
		} else {
			
			String tenNhomDich=request.getParameter("tenNhomDich");
			
			NhomDichModel nhomDichModel= new NhomDichModel();
			nhomDichModel.setTenNhomDich(tenNhomDich);
			
			nhomDichDao.insertNhomDich(nhomDichModel);
			
			session.setAttribute("add", tenNhomDich);
			
			urlRedirect = "redirect:/quan-tri/ql-nhom-dich";
		}

		return urlRedirect;
	}
	
	@RequestMapping(value = "/ajax", method = RequestMethod.POST)
	public @ResponseBody String loadAjax(Model model, HttpServletRequest request) throws JsonProcessingException {

		int id = Integer.parseInt(request.getParameter("id"));
		
		NhomDichModel info = nhomDichDao.findNhomDichModel(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(info);
		return json;
	}
	
	
	@RequestMapping(value = { "/sua-nhom-dich"}, method = RequestMethod.POST)
	public String updateNhomDich(Model model, HttpServletRequest request, HttpSession session) {

		String urlRedirect = "";
		if (!Authencation.Auth(request, 1)) {
			urlRedirect = "redirect:/";
		} else {
			
			int maNhomDich= Integer.parseInt(request.getParameter("maNhomDich"));
			
			String tenNhomDich=request.getParameter("tenNhomDich");
			
			String trangThai = request.getParameter("trangThai");
			
			NhomDichModel nhomDichModel= new NhomDichModel();
			nhomDichModel.setMaNhomDich(maNhomDich);
			nhomDichModel.setTenNhomDich(tenNhomDich);
			nhomDichModel.setTrangThai(trangThai);
			
			nhomDichDao.capNhatNhomDich(nhomDichModel);
			
			session.setAttribute("update", tenNhomDich);
			
			urlRedirect = "redirect:/quan-tri/ql-nhom-dich";
		}

		return urlRedirect;
	}
	
	
	@RequestMapping(value = { "/xoa-nhom-dich"}, method = RequestMethod.POST)
	public String deleteNhomDich(Model model, HttpServletRequest request, HttpSession session) {

		String urlRedirect = "";
		if (!Authencation.Auth(request, 1)) {
			urlRedirect = "redirect:/";
		} else {
			
			int maNhomDich= Integer.parseInt(request.getParameter("maNhomDich"));
			
			String tenNhomDich=request.getParameter("tenNhomDich");
			
			nhomDichDao.xoaNhomDich(maNhomDich);
			
			session.setAttribute("delete", tenNhomDich);
			
			urlRedirect = "redirect:/quan-tri/ql-nhom-dich";
		}

		return urlRedirect;
	}
	@RequestMapping(value = "/tac-vu/{action}", method = RequestMethod.POST)
	public String tacVu(Model model, @PathVariable("action") String action, HttpServletRequest request,
			HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		String json = request.getParameter("array_id");
		ObjectMapper mapper = new ObjectMapper();
		String[] array_id = mapper.readValue(json, String[].class);
		Map<String, String> mess = new HashMap<String, String>();
		TheLoaiTruyenInfo theLoaiTruyenInfo = new TheLoaiTruyenInfo();
		switch (action) {
		case "enable":
			for (String id : array_id) {
//				theLoaiTruyenInfo.setId(Integer.parseInt(id));
//				theLoaiTruyenInfo.setTrangThai("1");
//				theLoaiTruyenDAO.capNhatTrangThaiTheLoai(theLoaiTruyenInfo);
			}
			mess.put("css", "alert-info");
			mess.put("trangThai", "Kích hoạt thành công: <br>" + array_id.length + " thể loại truyện.");
			break;
		case "disable":
			for (String id : array_id) {
//				theLoaiTruyenInfo.setId(Integer.parseInt(id));
//				theLoaiTruyenInfo.setTrangThai("0");
//				theLoaiTruyenDAO.capNhatTrangThaiTheLoai(theLoaiTruyenInfo);
			}
			mess.put("css", "alert-info");
			mess.put("trangThai", "Bỏ kích hoạt thành công: <br>" + array_id.length + " thể loại truyện. ");
			break;
		case "delete":
			for (String id : array_id) {
				nhomDichDao.xoaNhomDich((Integer.parseInt(id)));
			}
			mess.put("css", "alert-danger");
			mess.put("trangThai", "Vừa xóa: " + array_id.length + "  nhóm dịch thành công!");
			break;
		default:
			break;

		}
		session.setAttribute("tacVu", mess);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}
	
	
}

package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TheLoaiTruyenInfo;

@Controller(value = "QL_TheLoaiTruyenControllerOfAdmin")
@RequestMapping(value = "/quan-tri/ql-the-loai-truyen")
public class QL_TheLoaiTruyenController {

	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDAO;

	public PaginationResult<TheLoaiTruyenInfo> getData(HttpServletRequest request) {

		int Max_Result = 10;
		final int Max_Navigation = 10;
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		String tuKhoa = request.getParameter("tu-khoa") == null ? "" : request.getParameter("tu-khoa");
		PaginationResult<TheLoaiTruyenInfo> list;
		if (tuKhoa.isEmpty()) {
			list = theLoaiTruyenDAO.listTheLoaiTruyen(page, Max_Result, Max_Navigation);
		} else {
			Max_Result = 100;
			list = theLoaiTruyenDAO.searchTheLoai(tuKhoa, page, Max_Result, Max_Navigation);
			request.getSession().setAttribute("tuKhoa", tuKhoa);
		}
		return list;
	}

	@RequestMapping(value = { "/*", "" }, method = RequestMethod.GET)
	public String QlTheLoaiTruyenPage(Model model, HttpServletRequest request) {

		String urlRedirect = "";
		if (!Authencation.Auth(request, 1)) {
			urlRedirect = "redirect:/";
		} else {
			PaginationResult<TheLoaiTruyenInfo> listTheLoaiTruyen = getData(request);
			Map<Integer, Integer> slTruyen = new HashMap<Integer, Integer>();
			for (TheLoaiTruyenInfo theLoai : listTheLoaiTruyen.getList()) {
				slTruyen.put(theLoai.getId(), theLoaiTruyenDAO.soLuongTruyenOfOneTheLoai(theLoai.getId()));
			}

			model.addAttribute("listTheLoaiTruyen", listTheLoaiTruyen);
			model.addAttribute("slTruyen", slTruyen);
			urlRedirect="admin/ql_theloaitruyen";
		}

		return urlRedirect;
	}

	@RequestMapping(value = "/them-the-loai")
	public String theTheLoaiTruyen(Model model, HttpServletRequest request) {
		String tenTheLoai = request.getParameter("tenTheLoai");
		String gioiThieu = request.getParameter("gioiThieu");
		TheLoaiTruyenInfo theLoai = new TheLoaiTruyenInfo();

		theLoai.setTenTheLoai(tenTheLoai);
		theLoai.setGioiThieu(gioiThieu);

		theLoaiTruyenDAO.insertTheLoaiTruyen(theLoai);

		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}

	@RequestMapping(value = "/ajax", method = RequestMethod.POST)
	public @ResponseBody String loadAjax(Model model, HttpServletRequest request) throws JsonProcessingException {

		int id = Integer.parseInt(request.getParameter("id"));
		TheLoaiTruyenInfo info = theLoaiTruyenDAO.findTheLoaiTruyenInfo(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(info);
		return json;
	}

	@RequestMapping(value = "/sua-the-loai", method = RequestMethod.POST)
	public String editTheLoai(Model model, HttpServletRequest request, HttpSession session) {
		//lay thong tin request tu trang web
		int id = Integer.parseInt(request.getParameter("idTheLoai"));
		String tenTheloai = request.getParameter("tenTheLoai");
		String gioiThieu = request.getParameter("gioiThieu");
		String trangThai = request.getParameter("trangThai");
		// kiem tra do dai cua ten the loai moi
		if (tenTheloai.length() > 10 || !tenTheloai.isEmpty()) {
			// tao moi mot the loai
			TheLoaiTruyenInfo theLoai = new TheLoaiTruyenInfo();
			theLoai.setId(id);
			theLoai.setTenTheLoai(tenTheloai);
			theLoai.setTrangThai(trangThai);
			theLoai.setGioiThieu(gioiThieu);
			//cap nhat lai thong tin the loai
			theLoaiTruyenDAO.capNhatTheLoaiTruyen(theLoai);
			//thong bao
			session.setAttribute("mess", true);
			session.setAttribute("tenTheLoaiMoi", tenTheloai);
		} else {
			session.setAttribute("mess", false);
		}
		// redirect lai trang
		String back = request.getHeader("Referer");
		return "redirect:" + back;
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
				theLoaiTruyenInfo.setId(Integer.parseInt(id));
				theLoaiTruyenInfo.setTrangThai("1");
				theLoaiTruyenDAO.capNhatTrangThaiTheLoai(theLoaiTruyenInfo);
			}
			mess.put("css", "alert-info");
			mess.put("trangThai", "Kích hoạt thành công: <br>" + array_id.length + " thể loại truyện.");
			break;
		case "disable":
			for (String id : array_id) {
				theLoaiTruyenInfo.setId(Integer.parseInt(id));
				theLoaiTruyenInfo.setTrangThai("0");
				theLoaiTruyenDAO.capNhatTrangThaiTheLoai(theLoaiTruyenInfo);
			}
			mess.put("css", "alert-info");
			mess.put("trangThai", "Bỏ kích hoạt thành công: <br>" + array_id.length + " thể loại truyện. ");
			break;
		case "delete":
			for (String id : array_id) {
				theLoaiTruyenDAO.XoaTheLoaiTruyenTheoID(Integer.parseInt(id));
			}
			mess.put("css", "alert-danger");
			mess.put("trangThai", "Vừa xóa: " + array_id.length + "  thể loại truyện thành công!");
			break;
		default:
			break;

		}
		session.setAttribute("tacVu", mess);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}

	@RequestMapping(value = "/xoa-the-loai", method = RequestMethod.POST)
	public String deleteTheLoai(Model model, HttpServletRequest request, HttpSession session) {
		int id = Integer.parseInt(request.getParameter("idTheLoai"));
		String tenTheLoai = request.getParameter("tenTheLoai");
		theLoaiTruyenDAO.XoaTheLoaiTruyenTheoID(id);

		session.setAttribute("tenTheLoai", tenTheLoai);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}
}

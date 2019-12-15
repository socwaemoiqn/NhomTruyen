package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Authencation;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;

@Controller
@RequestMapping(value = "/quan-tri/ql-tacgia")
public class QL_TacGiaController {
	@Autowired
	private TacGiaDAO tacGiaDAO;

	public PaginationResult<TacGiaInfo> getData(HttpServletRequest request) {
		int Max_Result = 10;
		final int Max_Navigation = 10;
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		String search = request.getParameter("search") != null ? request.getParameter("search") : "";
		PaginationResult<TacGiaInfo> list;
		if(search.isEmpty() |search.equals(""))
			 list = tacGiaDAO.paginationListTacGia(page, Max_Result, Max_Navigation);
		else
		{
			Max_Result = 100;
			list = tacGiaDAO.getTacGiaByTen(page, Max_Result, Max_Navigation, search);
			Map<String,String> mess =new HashMap<String, String>();
			mess.put("status","Tìm kiếm thành công!");
			mess.put("name","Tìm được "+list.getTotalRecords()+" kết quả!");
			request.getSession().setAttribute("mess", mess);
		}
			
		return list;
	}

	public Map<Integer, Integer> getDataSL(PaginationResult<TacGiaInfo> list) {
		Map<Integer, Integer> listSL = new HashMap<Integer, Integer>();
		for (TacGiaInfo tg : list.getList()) {
			int maTacGia = tg.getID();
			int soluong = tacGiaDAO.getSoLuongTruyenById(maTacGia);
			listSL.put(maTacGia, soluong);
		}
		return listSL;
	}

	@RequestMapping(value = {"/*",""}, method = RequestMethod.GET)
	public String QlTacGiaPage(Model model, HttpServletRequest request) {
		String urlRedirect =  !Authencation.Auth(request,1) ? "redirect:/" : "admin/ql_tacgia";
		PaginationResult<TacGiaInfo> list = getData(request);
		model.addAttribute("listTacGia", list);
		Map<Integer, Integer> listSL = getDataSL(list);
		model.addAttribute("listSL", listSL);
		return urlRedirect;
	}

	@RequestMapping(value = "/ajax", method = RequestMethod.POST)
	public @ResponseBody String getTacGiaById(HttpServletRequest request) throws JsonProcessingException {
		int id = Integer.parseInt(request.getParameter("id"));
		TacGiaInfo tg = tacGiaDAO.getTacGiaById(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(tg);
		return json;
	}


	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, HttpSession session) {
		String tenTacGia = request.getParameter("tenTacGia").trim();
		String gioiThieu = request.getParameter("gioiThieu");
		Map<String, String> mess = new HashMap<String, String>();
		// kiem tra ten tac gia nhap vao
		if (tenTacGia.length() > 0 && tenTacGia.length() <= 50) {
			//tao moi mot tac gia
			if(tacGiaDAO.findTacGiaEntityByTen(tenTacGia) == null)
			{
				TacGiaInfo tacgiainfo = new TacGiaInfo();
				tacgiainfo.setGioiThieu(gioiThieu);
				tacgiainfo.setTenTacGia(tenTacGia);
				//them tac gia
				tacGiaDAO.insert(tacgiainfo);
				//thong bao
				mess.put("status", "Thêm tác giả thành công!");
				mess.put("name", "Tác giả vừa được thêm: " + tenTacGia);
			}
			else
			{
				mess.put("status", "Thêm tác giả không thành công!");
				mess.put("name", "Tác giả vừa được thêm đã tồn tại!");
			}

		} else {
			mess.put("status", "Thêm tác giả không thành công!");
			mess.put("name", "Độ dài tên tác giả 50 ký tự và không để trống");

		}
		//gui thong bao len form va redirect lai trang.
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(HttpServletRequest request, HttpSession session) {
		Map<String, String> mess = new HashMap<String, String>();
		String tenTacGia = request.getParameter("tenTacGia");
		if (tenTacGia.length() > 0 && tenTacGia.length() <= 50) {
			TacGiaInfo tacgiainfo = new TacGiaInfo();
			tacgiainfo.setID(Integer.parseInt(request.getParameter("id")));
			tacgiainfo.setTenTacGia(tenTacGia);
			tacgiainfo.setGioiThieu(request.getParameter("gioiThieu"));
			tacgiainfo.setTrangThai(request.getParameter("trangThai"));
			tacGiaDAO.edit(tacgiainfo);
			mess.put("status", "Sửa tác giả thành công!");
			mess.put("name", "Tác giả vừa được sửa: " + tenTacGia);
		} else {
			mess.put("status", "Thêm tác giả không thành công!");
			mess.put("name", "Độ dài tên tác giả 50 ký tự và không để trống");
		}
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}

	@RequestMapping(value = "/xoa/{id}", method = RequestMethod.POST)
	public String xoa(HttpServletRequest request, HttpSession session, @PathVariable(value = "id") String id) {
		int maTacGia = Integer.parseInt(id);
		TacGiaInfo tacGiaInfo = tacGiaDAO.getTacGiaById(maTacGia);
		tacGiaDAO.xoa(maTacGia);
		Map<String, String> mess = new HashMap<String, String>();
		mess.put("status", "Xóa tác giả thành công!");
		mess.put("name", "Tác giả vừa được xóa: " + tacGiaInfo.getTenTacGia());
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}

	@RequestMapping(value = "/select-all/{action}", method = RequestMethod.POST)
	public String selectAll(HttpServletRequest request, HttpSession session,
			@PathVariable(value = "action") String action)
			throws JsonParseException, JsonMappingException, IOException {
		String json = request.getParameter("array_id");
		ObjectMapper mapper = new ObjectMapper();
		String[] array_id = mapper.readValue(json, String[].class);
		Map<String, String> mess = new HashMap<String, String>();
		TacGiaInfo tacGiaInfo = new TacGiaInfo();
		switch (action) {
		case "enable":
			for (String id : array_id) {
				tacGiaInfo.setID(Integer.parseInt(id));
				tacGiaInfo.setTrangThai("1");
				tacGiaDAO.updateTrangThai(tacGiaInfo);
				mess.put("status", "Kích hoạt thành công!");
				mess.put("name", "Kích hoạt: " + array_id.length + " tác giả");
			}
			break;
		case "disable":
			for (String id : array_id) {
				tacGiaInfo.setID(Integer.parseInt(id));
				tacGiaInfo.setTrangThai("0");
				tacGiaDAO.updateTrangThai(tacGiaInfo);
				mess.put("status", "Vô hiệu hóa thành công!");
				mess.put("name", "Vô hiệu: " + array_id.length + " tác giả");
			}
			break;
		case "delete":
			for (String id : array_id) {
				tacGiaDAO.xoa(Integer.parseInt(id));
				mess.put("status", "Xóa thành công!");
				mess.put("name", "Vừa xóa: " + array_id.length + " tác giả");
			}
			break;
		default:
			break;
		}
		session.setAttribute("mess", mess);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}
}
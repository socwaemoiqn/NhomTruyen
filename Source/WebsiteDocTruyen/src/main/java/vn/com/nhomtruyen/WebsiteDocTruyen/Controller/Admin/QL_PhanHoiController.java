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
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.PhanHoiDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PhanHoiInfo;

@Controller
@RequestMapping("quan-tri/phan-hoi")
public class QL_PhanHoiController {
	@Autowired
	private PhanHoiDAO phanHoiDAO;
	public PaginationResult<PhanHoiInfo> getData(HttpServletRequest request)
	{
		int Max_Result = 10;
		final int Max_Navigation = 10;
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		String search = request.getParameter("search") != null ? request.getParameter("search") : "";
		String type = request.getParameter("type") != null ? request.getParameter("type") : "new";
		String subject = request.getParameter("subject") != null ? request.getParameter("subject") : "all";
		PaginationResult<PhanHoiInfo> list;
		if(search.isEmpty() && type.equals("new") && subject.equals("all"))
			 list = phanHoiDAO.paginationListPhanHoi(page, Max_Result, Max_Navigation);
		else
		{
			
			Max_Result = 100;
			Map<String, String> listSearch = new HashMap<String, String>();
			listSearch.put("search",search);
			listSearch.put("type",type);
			listSearch.put("subject",subject);
			list = phanHoiDAO.getPhanHoiBySearch(page, Max_Result, Max_Navigation, listSearch);
			request.getSession().setAttribute("mess", "Tìm được "+list.getTotalRecords()+" kết quả!");
		}
			
		return list;
	}
	@RequestMapping("")
	public String phanHoiPage(Model model,HttpServletRequest request)
	{
		String urlRedirect =  !Authencation.Auth(request,1) ? "redirect:/" : "admin/ql_phanhoi";
		PaginationResult<PhanHoiInfo> list = getData(request);
		model.addAttribute("listPhanHoi",list);
		return urlRedirect;
	}
	@RequestMapping(value = "/insert",method = RequestMethod.POST)
	public String insert(HttpServletRequest request,HttpSession session)
	{
		PhanHoiInfo phanHoi = new PhanHoiInfo();
		phanHoi.setChuDe(request.getParameter("chuDe"));
		phanHoi.setTenNguoiGui(request.getParameter("tenNguoiGui"));
		phanHoi.setEmail(request.getParameter("email"));
		phanHoi.setNoiDung(request.getParameter("noiDung"));
		phanHoiDAO.insert(phanHoi);
		session.setAttribute("mess", "Gửi phản hồi thành công!");
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	}
	@RequestMapping(value = "/xoa/{id}", method = RequestMethod.POST)
	public String xoa(HttpServletRequest request,HttpSession session,@PathVariable(value = "id")String id)
	{
		phanHoiDAO.xoa(Integer.parseInt(id));
		session.setAttribute("mess", "Xóa phản hồi thành công!");
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	}
	@RequestMapping(value = "/ajax",method = RequestMethod.POST)
	public @ResponseBody String ajax(HttpServletRequest request) throws JsonProcessingException
	{
		int maPhanHoi = Integer.parseInt(request.getParameter("id"));
		PhanHoiInfo phanhoi = phanHoiDAO.getPhanHoiById(maPhanHoi);
		if(!phanhoi.getDaXem())
			{
				phanhoi.setDaXem(true);
				phanHoiDAO.updateTrangThai(phanhoi);
			}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(phanhoi);
		return json;
	}
	@RequestMapping(value = "/select-all/{action}", method = RequestMethod.POST)
	public String selectAll(HttpServletRequest request,
			@PathVariable(value = "action") String action)
			throws JsonParseException, JsonMappingException, IOException {
		String json = request.getParameter("array_id");
		ObjectMapper mapper = new ObjectMapper();
		String[] array_id = mapper.readValue(json, String[].class);
		switch (action) {
		case "delete":
			for (String id : array_id) {
				phanHoiDAO.xoa(Integer.parseInt(id));
				
			}
			request.getSession().setAttribute("mess", "Vừa xóa: " + array_id.length + " phản hồi");
			break;
		default:
			break;
		}
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}
}

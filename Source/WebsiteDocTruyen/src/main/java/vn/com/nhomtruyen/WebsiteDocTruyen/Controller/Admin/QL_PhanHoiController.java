package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.PhanHoiDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PhanHoiInfo;

@Controller
@RequestMapping("quan-tri/phan-hoi")
public class QL_PhanHoiController {
	@Autowired
	private PhanHoiDAO phanHoiDAO;
	public PaginationResult<PhanHoiInfo> getData(String pageStr)
	{
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 10;
		final int Max_Navigation = 10;
		PaginationResult<PhanHoiInfo> list = phanHoiDAO.paginationListPhanHoi(page, Max_Result, Max_Navigation);
		return list;
	}
	@RequestMapping("")
	public String phanHoiPage(Model model,@RequestParam(value = "page", defaultValue = "1")String pageStr)
	{
		PaginationResult<PhanHoiInfo> list = getData(pageStr);
		model.addAttribute("listPhanHoi",list);
		return "admin/ql_phanhoi";
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
	@RequestMapping(value = "/search",method = RequestMethod.GET)
	public String search(HttpServletRequest request,HttpSession session, 
			@RequestParam(value="page",defaultValue = "1")String pageStr,
			@RequestParam(value="key",defaultValue = "all")String key,
			@RequestParam(value="type",defaultValue = "new")String type,
			@RequestParam(value="subject",defaultValue = "all")String subject)
	{
		if(!key.equals("all"))
		{
			int page = 1;
			try {
				page = Integer.parseInt(pageStr);
			} catch (Exception e) {
				// TODO: handle exception
			}
			final int Max_Result = 100;
			final int Max_Navigation = 10;
			Map<String,String> list = new HashMap<String, String>();
			list.put("key",key);
			list.put("type",type);
			list.put("subject",subject);
			PaginationResult<PhanHoiInfo> listPhanHoi = phanHoiDAO.getPhanHoiBySearch(page, Max_Result, Max_Navigation,list);
			request.setAttribute("listPhanHoi",listPhanHoi);
			session.setAttribute("mess","Tìm được: "+listPhanHoi.getList().size()+" kết quả!");
			return "admin/ql_phanhoi";
		}
		return "redirect:/quan-tri/phan-hoi";
	}
}

package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TacGiaEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;

@Controller
@RequestMapping(value = "/quan-tri/ql-tacgia")
public class QL_TacGiaController {
	@Autowired
	private TacGiaDAO tacGiaDAO;
	public PaginationResult<TacGiaInfo> getData(String pageStr)
	{
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		final int Max_Result = 10;
		final int Max_Navigation = 10;
		PaginationResult<TacGiaInfo> list = tacGiaDAO.paginationListTacGia(page, Max_Result, Max_Navigation);
		return list;
	}
	public Map<Integer, Integer> getDataSL(PaginationResult<TacGiaInfo> list){
		Map<Integer, Integer> listSL = new HashMap<Integer, Integer>();
		for(TacGiaInfo tg : list.getList()) {
			int maTacGia = tg.getID();
			int soluong = tacGiaDAO.getSoLuongTruyenById(maTacGia);
			listSL.put(maTacGia,soluong);
		}
		return listSL;
	}
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String QlTacGiaPage(Model model, @RequestParam(value="page",defaultValue = "1")String pageStr) {
		PaginationResult<TacGiaInfo> list = getData(pageStr);
		model.addAttribute("listTacGia",list);
		Map<Integer, Integer> listSL = getDataSL(list);
		model.addAttribute("listSL",listSL);
		return "admin/ql_tacgia";
	}
	@RequestMapping(value = "/ajax",method = RequestMethod.POST)
	public @ResponseBody String getTacGiaById(HttpServletRequest request) throws JsonProcessingException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		TacGiaInfo tg = tacGiaDAO.getTacGiaById(id);
		 ObjectMapper mapper = new ObjectMapper();
		 String json = mapper.writeValueAsString(tg);
		return json;
	}
	@RequestMapping(value = "/search",method = RequestMethod.GET)
	public String search(HttpServletRequest request,HttpSession session, @RequestParam(value="page",defaultValue = "1")String pageStr) 
	{
		String key = request.getParameter("key");
		if(!key.isEmpty())
		{
			int page = 1;
			try {
				page = Integer.parseInt(pageStr);
			} catch (Exception e) {
				// TODO: handle exception
			}
			final int Max_Result = 100;
			final int Max_Navigation = 10;
			PaginationResult<TacGiaInfo> listTacGia = tacGiaDAO.getTacGiaByTen(page, Max_Result, Max_Navigation,key);
			request.setAttribute("listTacGia",listTacGia);
			Map<Integer, Integer> listSL = new HashMap<Integer, Integer>();
			for(TacGiaInfo tg : listTacGia.getList()) {
				int maTacGia = tg.getID();
				int soluong = tacGiaDAO.getSoLuongTruyenById(maTacGia);
				listSL.put(maTacGia,soluong);
			}
			request.setAttribute("listSL",listSL);
			Map<String,String> mess = new HashMap<String, String>();
			mess.put("status", "Tìm kiếm thành công!");
			mess.put("name","Tìm được: "+listTacGia.getList().size()+" kết quả!");
			session.setAttribute("mess", mess);
			return "admin/ql_tacgia";
		}
		return "redirect:/quan-tri/ql-tacgia";
	}
	@RequestMapping(value = "/insert",method = RequestMethod.POST)
	public String insert(HttpServletRequest request,HttpSession session)
	{
		String tenTacGia = request.getParameter("tenTacGia");
		String gioiThieu = request.getParameter("gioiThieu");
		if(tenTacGia.length() > 0 && tenTacGia.length() <= 50)
		{
			TacGiaInfo tacgiainfo = new TacGiaInfo();
			tacgiainfo.setGioiThieu(gioiThieu);
			tacgiainfo.setTenTacGia(tenTacGia);
			TacGiaEntity tacgia = tacGiaDAO.insert(tacgiainfo);
			Map<String,String> mess = new HashMap<String, String>();
			mess.put("status", "Thêm tác giả thành công!");
			mess.put("name","Tác giả vừa được thêm: "+tenTacGia);
			session.setAttribute("mess", mess);
		}
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	} 
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(HttpServletRequest request,HttpSession session)
	{
		int id = Integer.parseInt(request.getParameter("id"));
		String tenTacGia = request.getParameter("tenTacGia");
		String gioiThieu = request.getParameter("gioiThieu");
		String trangThai = request.getParameter("trangThai");
		if(tenTacGia.length() > 0 && tenTacGia.length() <= 50)
		{
			TacGiaInfo tacgiainfo = new TacGiaInfo();
			tacgiainfo.setGioiThieu(gioiThieu);
			tacgiainfo.setTenTacGia(tenTacGia);
			tacgiainfo.setTrangThai(trangThai);
			tacgiainfo.setID(id);
			Map<String,String> mess = new HashMap<String, String>();
			if(tacGiaDAO.edit(tacgiainfo))
			{
				mess.put("status", "Sửa tác giả thành công!");
				mess.put("name","Tác giả vừa được sửa: "+tenTacGia);
			}
			else
			{
				mess.put("status", "Sửa tác giả không thành công!");
			}
			session.setAttribute("mess", mess);
		}
		String back = request.getHeader("Referer");
		return "redirect:"+back;
	}
}
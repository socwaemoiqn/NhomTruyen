package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;

@Controller
@RequestMapping(value = "/quan-tri/ql-tacgia")
public class QL_TacGiaController {
	@Autowired
	private TacGiaDAO tacGiaDAO;
	
	@RequestMapping(value = "/ajax",method = RequestMethod.POST)
	public @ResponseBody String getTacGiaById(HttpServletRequest request) throws JsonProcessingException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		TacGiaInfo tg = tacGiaDAO.getTacGiaById(id);
		 ObjectMapper mapper = new ObjectMapper();
		 String json = mapper.writeValueAsString(tg);
		return json;
	}
}
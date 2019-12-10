package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;

@Controller(value = "ThongKeController")
@RequestMapping(value="/quan-tri/thong-ke")
public class QL_ThongKeController {
	@Autowired
	private TruyenDAO truyenDao;

	@RequestMapping(value ="/truyen",method = RequestMethod.GET)
	public String thongKeTruyenPage(HttpServletRequest request, Model model) {
		return "admin/ql_thongke";
	}
	@RequestMapping(value ="/truyen/loc-thong-tin",method = RequestMethod.GET)
	public String locThongTin(HttpServletRequest request, Model model) {
		String thongKe=request.getParameter("thong-ke");
		String thoiGian=request.getParameter("thoi-gian");
		String begin = request.getParameter("begin");
		String end= request.getParameter("end");
		List<SelectTruyenInfo> truyen = null;
		if(thoiGian.isEmpty() && begin.isEmpty() && end.isEmpty()) {
			if(thongKe.equals("full") || thongKe.equals("hot") || thongKe.equals("news")) {
				
			}
			truyen=truyenDao.selectAllTheLoaiTruyen(thongKe);
		}
		model.addAttribute("thongKeTruyen", truyen);
		return "admin/ql_thongke";
	}
}

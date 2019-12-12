package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;

@Controller(value = "ThongKeController")
@RequestMapping(value = "/quan-tri/thong-ke")
public class QL_ThongKeController {
	@Autowired
	private TruyenDAO truyenDao;

	@RequestMapping(value = "/truyen", method = RequestMethod.GET)
	public String thongKeTruyenPage(HttpServletRequest request, Model model) {
		return "admin/ql_thongke";
	}

	@RequestMapping(value = "/truyen/loc-thong-tin", method = RequestMethod.GET)
	public String locThongTin(HttpServletRequest request, Model model) {
		String thongKe = request.getParameter("thong-ke");
		String thoiGian = request.getParameter("thoi-gian");
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		Calendar cal = Calendar.getInstance();
		String day = Helper.getToday();
		String batDau = "";
		String ketThuc = "";
		String mess="";
		Map<String, String> map = new HashMap<String, String>();
		Map<String, String> map1 = new HashMap<String, String>();
		List<SelectTruyenInfo> truyen = null;
		if (thoiGian.equals("") && begin.equals("") && end.equals("")) {
			if (thongKe.equals("full") || thongKe.equals("hot") || thongKe.equals("news")) {
				truyen = truyenDao.selectAllTruyenByDanhMuc(thongKe);

			} else {
				// thông kê truyện theo tìm kiếm
				// phần này chưa thống kê được
				truyen = null;
			}
			mess="Thống kê truyện "+thongKe.substring(0, 1).toUpperCase() + thongKe.substring(1).toLowerCase();
		} else {
			if (!thongKe.isEmpty() && !thoiGian.isEmpty() && begin.isEmpty() || end.isEmpty()) {
				begin = null;
				end = null;
				switch (thoiGian) {
				case "days":
					batDau = day + " 00:00:00";
					ketThuc = day + " 23:59:59";
					truyen = truyenDao.thongKetruyen(thongKe, batDau, ketThuc);
					map1.put("days", "Ngày");
					mess="Thống Kê Ngày "+day;
					break;
				case "weeks":
					cal.roll(Calendar.DATE, -7);
					batDau = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/"
							+ cal.get(Calendar.DAY_OF_MONTH) + " 00:00:00";
					ketThuc = Helper.getCurrentDateAndTime();
					truyen = truyenDao.thongKetruyen(thongKe, batDau, ketThuc);
					map1.put("weeks", "Tuần");
					mess="Thống Kê Truyện "+thongKe.substring(0, 1).toUpperCase() + thongKe.substring(1).toLowerCase()+" Theo Tuần";
					break;
				case "months":
					String ngayDauThang = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/"
							+ cal.getActualMinimum(Calendar.DATE) + " 00:00:00";
					String ngayCuoiThang = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/"
							+ cal.getActualMaximum(Calendar.DATE) + " 00:00:00";
					truyen = truyenDao.thongKetruyen(thongKe, ngayDauThang, ngayCuoiThang);
					map1.put("months", "Tháng");
					mess="Thống Kê Truyện "+ thongKe.substring(0, 1).toUpperCase() + thongKe.substring(1).toLowerCase()+" Tháng "+ + (cal.get(Calendar.MONTH) + 1);
					break;

				}
			} else 
			if(!begin.isEmpty() && !end.isEmpty()){
				thoiGian = null;
				batDau = begin + " 00:00:00";
				ketThuc = end + " 00:00:00";
				truyen = truyenDao.thongKetruyen(thongKe, batDau, ketThuc);
				mess="Thống Kê Từ Ngày "+ begin+ " đến "+end;
			}
		}

		map.put(thongKe,
				"-Thống kê truyên " + thongKe.substring(0, 1).toUpperCase() + thongKe.substring(1).toLowerCase() + "-");
		model.addAttribute("thongKeTruyen", truyen);
		model.addAttribute("thongKe", map);
		model.addAttribute("thoiGian", map1);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("mess", mess);
		return "admin/ql_thongke";
	}
}

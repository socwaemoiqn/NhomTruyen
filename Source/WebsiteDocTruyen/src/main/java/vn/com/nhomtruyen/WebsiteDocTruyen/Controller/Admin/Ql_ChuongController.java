package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import vn.com.nhomtruyen.WebsiteDocTruyen.Common.Helper;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.ChuongDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.DanhMucTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TacGiaDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TheLoaiTruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;
import vn.com.nhomtruyen.WebsiteDocTruyen.Entity.TruyenEntity;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.ChuongInfo;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.PaginationResult;
import vn.com.nhomtruyen.WebsiteDocTruyen.Model.SelectTruyenInfo;

@Controller
@RequestMapping(value = "/quan-tri/ql-truyen/ql-chuong")
public class Ql_ChuongController {
	@Autowired
	private ChuongDAO chuongDao;
	@Autowired
	private TruyenDAO truyenDao;
	@Autowired
	private DanhMucTruyenDAO dmtruyenDao;
	@Autowired
	private TheLoaiTruyenDAO theLoaiTruyenDao;
	@Autowired
	private TacGiaDAO tacGiaDao;

	public PaginationResult<ChuongInfo> getData(HttpServletRequest request, String idTruyen) {

		int Max_Result = 10;
		final int Max_Navigation = 10;
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		String tuKhoa = request.getParameter("tu-khoa") == null ? "" : request.getParameter("tu-khoa");
		PaginationResult<ChuongInfo> list;
		if (tuKhoa.isEmpty()) {
			list = chuongDao.listChuongOfTruyen(idTruyen, "DESC", page, Max_Result, Max_Navigation);
		} else {
			Max_Result = 100;
			list = chuongDao.searchChuogn(idTruyen, tuKhoa, page, Max_Result, Max_Navigation);
			request.getSession().setAttribute("tuKhoa", tuKhoa);
		}
		return list;
	}

	@RequestMapping(value = "/{tenTruyen}", method = RequestMethod.GET)
	public String qlChuongPage(Model model, @PathVariable("tenTruyen") String tenTruyen, HttpServletRequest request) {

		String urlRedirect = "";
		if (!Authencation.Auth(request, 1)) {
			urlRedirect = "redirect:/";
		} else {
			Map<String, String> urlTruyen = truyenDao.listPathVariableString();
			String maTruyen = urlTruyen.get(tenTruyen);

			SelectTruyenInfo truyen = truyenDao.selectTruyenByMa(maTruyen);
			String sort = "DESC";
			PaginationResult<ChuongInfo> listChuongByTruyen = getData(request, maTruyen);
			Map<String, String> urlChuong = chuongDao.listPathVariableString(maTruyen);

			List<ChuongInfo> listChuong = chuongDao.listChuongOfTruyenSortASC(maTruyen);
			Map<String, Integer> soChuong = new HashMap<String, Integer>();
			int i = 1;
			for (ChuongInfo ch : listChuong) {

				soChuong.put(ch.getId(), i);
				i++;
			}

			model.addAttribute("tenTruyen", truyen.getTenTruyen());
			model.addAttribute("pathTenTruyen", tenTruyen);
			model.addAttribute("listChuongOfTruyen", listChuongByTruyen);
			model.addAttribute("urlChuong", urlChuong);
			model.addAttribute("soChuong", soChuong);
			urlRedirect = "admin/ql_truyen_ql_chuong";
		}

		return urlRedirect;
	}

	@RequestMapping(value = "/{tenTruyen}/them-chuong", method = RequestMethod.POST)
	public String addChuongPage(Model model, @PathVariable("tenTruyen") String tenTruyen, HttpServletRequest request,
			HttpSession session) {
		String idChuong = Helper.CreateId("CH");
		String tieuDe = request.getParameter("ten");
		String noiDung = request.getParameter("noiDung");
		int trangThai = 1;
		String ngayTao = Helper.getCurrentDateAndTime();
		Map<String, String> url = truyenDao.listPathVariableString();
		String maTruyen = url.get(tenTruyen);

		// cap nhat so luong chuong vao bang truyện
		truyenDao.capNhatSoLuongChuong(maTruyen, chuongDao.listChuongOfTruyenSortDESC(maTruyen).size() + 1);

		// tạo 1 đối tượng
		ChuongInfo newChuong = new ChuongInfo(idChuong, maTruyen, tieuDe, noiDung, trangThai, ngayTao);

		// insert vào csdl
		chuongDao.insertChuong(newChuong);
		session.setAttribute("themChuong", tieuDe);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = "get-chuong-ajax", method = RequestMethod.POST)
	public @ResponseBody String getChuong(Model model, HttpServletRequest request) throws JsonProcessingException {
		String idChuong = request.getParameter("id");
		ChuongInfo chuong = chuongDao.chuongInfo(idChuong);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(chuong);
		return json;

	}

	@RequestMapping(value = "{tenTruyen}/tac-vu/{action}", method = RequestMethod.POST)
	public String tacVu(Model model, @PathVariable("action") String action, HttpServletRequest request,
			HttpSession session) throws JsonParseException, JsonMappingException, IOException {

		String json = request.getParameter("array_id");
		ObjectMapper mapper = new ObjectMapper();
		String[] array_id = mapper.readValue(json, String[].class);
		Map<String, String> mess = new HashMap<String, String>();
		ChuongInfo chuongInfo = new ChuongInfo();
		switch (action) {
		case "enable":
			for (String id : array_id) {
				chuongInfo.setId(id);
				chuongInfo.setTrangThai(1);
				chuongDao.upDateTrangThaiChuong(chuongInfo);
			}
			mess.put("css", "alert-info");
			mess.put("trangThai", "Kích hoạt thành công: <br>" + array_id.length + " chương.");
			break;
		case "disable":
			for (String id : array_id) {
				chuongInfo.setId(id);
				chuongInfo.setTrangThai(0);
				chuongDao.upDateTrangThaiChuong(chuongInfo);
			}
			mess.put("css", "alert-info");
			mess.put("trangThai", "Bỏ kích hoạt thành công: <br>" + array_id.length + " chương. ");
			break;
		case "delete":
			for (String id : array_id) {
				chuongDao.deleteChuong(id);
			}
			mess.put("css", "alert-danger");
			mess.put("trangThai", "Vừa xóa: " + array_id.length + "  chương thành công!");
			break;
		default:
			break;

		}
		session.setAttribute("tacVu", mess);
		String back = request.getHeader("Referer");
		return "redirect:" + back;
	}

	@RequestMapping(value = "/{tenTruyen}/sua-chuong", method = RequestMethod.POST)
	public String editChuongForm(Model model, HttpServletRequest request, HttpSession session,
			@PathVariable("tenTruyen") String tenTruyen) {

		Map<String, String> urlTruyen = truyenDao.listPathVariableString();
		String maTruyen = urlTruyen.get(tenTruyen);
		String idChuong = request.getParameter("idChuong");
		String tieuDe = request.getParameter("tieuDe");
		String noiDung = request.getParameter("noiDungSua");
		String trangThai = request.getParameter("trangThai");

		ChuongInfo chuong = new ChuongInfo();
		chuong.setId(idChuong);
		chuong.setNoiDung(noiDung);
		chuong.setTieuDe(tieuDe);
		chuong.setTrangThai(Integer.parseInt(trangThai));
		session.setAttribute("capNhatChuong", tieuDe);

		chuongDao.upDateChuong(chuong);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = "/{tenTruyen}/xoa-chuong", method = RequestMethod.POST)
	public String deleteChuongForm(Model model, @PathVariable("tenTruyen") String tenTruyen, HttpServletRequest request,
			HttpSession session) {

		Map<String, String> urlTruyen = truyenDao.listPathVariableString();
		String maTruyen = urlTruyen.get(tenTruyen);
		String idChuong = request.getParameter("idChuong");
		String tieuDe = request.getParameter("tieuDe");

		// cập nhật số lượng truyện khi xóa chương
		truyenDao.capNhatSoLuongChuong(maTruyen, chuongDao.listChuongOfTruyenSortDESC(maTruyen).size() - 1);
		// xóa chương trong csdl
		chuongDao.deleteChuong(idChuong);
		session.setAttribute("xoaChuong", tieuDe);

		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@RequestMapping(value = "/{tenTruyen}/{chuongSo}", method = RequestMethod.GET)
	public String xemChuongPage(Model model, @PathVariable("tenTruyen") String tenTruyen,
			@PathVariable("chuongSo") String chuongSo) {
		Map<String, String> urlTruyen = truyenDao.listPathVariableString();
		String maTruyen = urlTruyen.get(tenTruyen);
		System.out.println(maTruyen);
		TruyenEntity tr=truyenDao.findTruyenEntity(maTruyen);
		
		List<ChuongInfo> listChuong = chuongDao.listChuongOfTruyenSortASC(maTruyen);
		Map<String, String> urlChuong = new HashMap<String, String>();
		int i = 1;
		for (ChuongInfo ch : listChuong) {
			urlChuong.put(Helper.pathVariableString("chuong-" + i), ch.getId());
			i++;
		}

		String idChuong = urlChuong.get(chuongSo);
		ChuongInfo chuongOfId = chuongDao.chuongInfo(idChuong);

		System.out.println(idChuong);
		model.addAttribute("chuong", chuongOfId);
		model.addAttribute("tenTruyen", tr.getTenTruyen());
		model.addAttribute("pathTenTruyen", Helper.pathVariableString(tr.getTenTruyen()));
		return "admin/ql_truyen_xemchuong";
	}

}

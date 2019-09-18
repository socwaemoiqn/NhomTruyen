package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller(value = "QL_TruyenControllerOfAdmin")
@RequestMapping(value = "/quan-tri/ql_truyen")
public class QL_TruyenController {
	
	
	@RequestMapping(value = "/ql_chuong", method=RequestMethod.GET)
	public String qlChuongPage(Model model) {
		return "admin/ql_truyen_ql_chuong";
	}
	
	@RequestMapping(value = "/ql_chuong/them_chuong", method=RequestMethod.GET)
	public String themtruyenPage(Model model) {
		String noi="<p style=\"margin-left:192px\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_Hlk19518267\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">C&aacute;c tầng trong Spring MVC độc lập n&ecirc;n việc unit test dễ d&agrave;ng hơn.</span></span></a></span></span></p>\r\n" + 
				"\r\n" + 
				"<p style=\"margin-left:192px\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Phần view c&oacute; thể t&iacute;<span style=\"color:#16a085\">ch hợp với nhiều Framework về UI như JSF, Fr</span>eemarker, Themeleaf&hellip;</span></span></span></span></p>\r\n" + 
				"\r\n" + 
				"<p style=\"margin-left:192px\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:#ecf0f1\">Spring MVC base tr&ecirc;n c&aacute;c POJO</span> class n&ecirc;n c&aacute;c h&agrave;nh động của n&oacute; kh&aacute; đơn giản</span></span></span></span></p>\r\n" + 
				"\r\n" + 
				"<p style=\"margin-left:192px\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Hỗ trợ cả Annotation v&agrave; XML config gi&uacute;p việc ph&aacute;t triển nhanh hơn v&agrave; sạch hơn.</span></span></span></span></p>\r\n" + 
				"\r\n" + 
				"<p style=\"margin-left:192px\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Cung cấp việc ph&acirc;n chia một c&aacute;ch r&otilde; r&agrave;ng, linh hoạt giữa controller, service, data acces layer.</span></span></span></span></p>\r\n" + 
				"";
		model.addAttribute("noi", noi);
		return "admin/ql_truyen_themchuong";
	}
	@RequestMapping(value = "/ql_chuong/xem_chuong", method=RequestMethod.GET)
	public String xemChuongPage(Model model) {
		return "admin/ql_truyen_xemchuong";
	}
	
	@RequestMapping(value = "/ql_chuong/addChuong", method=RequestMethod.POST)
	public String addChuongPage(Model model, @RequestParam("noidung") String noidung) {
		
		model.addAttribute("noidung", noidung);
		return "admin/ql_truyen_xemchuong";
	}
	
}

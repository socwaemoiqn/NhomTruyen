package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.TranslateTeam.Members;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value = "ControllerMembersOfTranslate")
@RequestMapping(value = "/nhom-dich/thanh-vien")
public class MembersController {
	@RequestMapping(value = { "/", "index", "" }, method = RequestMethod.GET)
	public String indexAdminPage(Model model) {
		return "translateTeam/members/index";
	}
}

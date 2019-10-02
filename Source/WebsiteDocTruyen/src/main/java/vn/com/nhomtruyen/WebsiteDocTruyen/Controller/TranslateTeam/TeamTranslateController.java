package vn.com.nhomtruyen.WebsiteDocTruyen.Controller.TranslateTeam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value = "ControllerOfTranslateTeam")
@RequestMapping(value = "/nhom-dich")
public class TeamTranslateController {

	@RequestMapping(value = { "/", "home", "" }, method = RequestMethod.GET)
	public String indexAdminPage(Model model) {
		return "translateTeam/index";
	}
}

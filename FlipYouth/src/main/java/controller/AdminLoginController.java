package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.bean.AdministratorBean;
import model.service.AdminLoginService;

@Controller
@RequestMapping
public class AdminLoginController {
	@Autowired
	private AdminLoginService adminLoginService;

	@RequestMapping(path = {"/admin/secure/adminLogin.controller"}, method = {RequestMethod.POST})
	public String adminLoginMethod(
			// 接收資料
			@RequestParam(defaultValue="") String admId, @RequestParam(defaultValue="") String admPassword, Model model, HttpSession session) {

		Map<String, String> errors = new HashMap<String, String>();
		// 驗證資料
		if (admId.trim().isEmpty())
			errors.put("admId", "不可為空");
		if (admPassword.trim().isEmpty())
			errors.put("admPassword", "不可為空");
		if (!errors.isEmpty()) {
			model.addAttribute("errors", errors);
			System.out.println(errors);
			return "adminLogin.logPage";
		}
		// 呼叫model
		AdministratorBean ab = adminLoginService.login(admId, admPassword);
		// 根據結果顯示view
		if (ab == null) {
			errors.put("admPassword", "帳號密碼錯誤");
			model.addAttribute("errors", errors);
			return "adminLogin.logPage";
		} else {
			if (!(ab.getAuthId().getAuthId() > 3) && !(ab.getAuthId().getAuthId() < 1)) {
				session.setAttribute("access", adminLoginService.getAccessList(ab.getAuthId().getAuthId()));
			}
			session.setAttribute("admin", ab);
			return "adminLogin.index";
		}
	}

}

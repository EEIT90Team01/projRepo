package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.MemberBean;
import model.service.EnergyService;

@Controller
@RequestMapping
public class PlayGameController {
	@Autowired
	private EnergyService energyService;

	@RequestMapping(path = { "/playGame.controller" }, method = { RequestMethod.GET })
	public String playGameMethod(Model model, HttpSession session) {

		String error = "";
		MemberBean mbean = (MemberBean) session.getAttribute("loginOK");
		Map<String, MemberBean> result = null;
		if (mbean == null) {
			error = "尚未登入";
		} else {
			result = energyService.playGameConsumeEnergy(mbean);
			if (result.get("fail") != null) {
				mbean = result.get("fail");
				error = "能量不足";
			} else if (result.get("ok") != null) {
				mbean = result.get("ok");
			}
		}
		session.setAttribute("LoginOK", mbean);
		if (!error.isEmpty()) {
			model.addAttribute("playGameError", error);
			System.out.println(error);
			return "playgame.fail";
		} else {
			return "playgame.ok";
		}
	}
}

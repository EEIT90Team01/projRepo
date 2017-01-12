package controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.EventBean;
import model.EventDetailBean;
import model.EventSNDetailFbBean;
import model.MemberBean;
import model.dao.EventDaoImpl;
import model.dao.EventDetailDaoImpl;
import model.dao.MemberDAO;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventSNDetail" })
public class testcon {
	@Autowired
	SessionFactory sessionFactory;
	@Resource
	MemberBean memberBean;
	@RequestMapping(path = { "/test.controller" })
	public String eventSNDetailProcess(String eventSN,String locName,EventSNDetailFbBean eventSNDetailFbBean,Model model,HttpSession session){
		System.out.println(sessionFactory.getCurrentSession().createQuery("select Member.mbrSN from Member mbrSN"));
		return null;
	}
}
package controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.engine.transaction.jta.platform.internal.SynchronizationRegistryBasedSynchronizationStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.MemberBean;
import model.RelationBean;
import model.RelationService;
import model.dao.MemberDAO;
import model.dao.RelationDAO;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
public class RelationController {

	@Autowired
	@Resource
	MemberBean memberBean;

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	RelationBean relationBean;

	@Autowired
	RelationService relationService;
	@Autowired
	RelationDAO relationDAO;

	
//	*****************  一開始顯示會員資料    *************************************************************************
	//顯示(搜尋)所有好友
	@RequestMapping(path = "/searchRelation.controller")
	public String searchRelation(HttpSession session) {

		String imageBase64 = null;
		// list 有順序且可重复
		List<RelationBean> list = null;// 使用者的好朋友們
		List<String> nicknameList = new ArrayList<>();// 裝轉使用者好朋友們nickname 的 "list")
		List<Integer> mbrSNList = new ArrayList<>();// 裝轉使用者好朋友們nickname 的 "list")
		List<String> imageList = new ArrayList<>();// 裝轉成base64 Image的
													// "list"(使用者好朋友們的image)

		MemberBean memberBean = (MemberBean) session.getAttribute("loginOK");

		if (!(memberBean == null)) {
			Integer mbrSN = memberBean.getMbrSN();

			System.out.println("Controller mbrSN (使用者號碼)= " + mbrSN);

			list = relationService.selectAllFriend(mbrSN);

			for (int i = 0; i < list.size(); i++) {

				// nicknameList放入所有好友的暱稱
				nicknameList.add(list.get(i).getTargetMbrSN().getNickName());
				System.out.println("List<RelationBean> (使用者所有的好友暱稱)= " + list.get(i).getTargetMbrSN().getNickName());
				// mbrSNList放入所有好友的編號
				mbrSNList.add(list.get(i).getTargetMbrSN().getMbrSN());
				
				// 將所有好友圖片轉成base64 放入imageList
				imageBase64 = Base64.getEncoder().encodeToString(list.get(i).getTargetMbrSN().getImage());
				// System.out.println("List<RelationBean> (使用者所有的好友圖片編碼)= " +
				// imageBase64);
				imageList.add(imageBase64);
			}
			// System.out.println("imageList = " + imageList);

			Map<String, List<?>> searchRelationMap = new HashMap<String, List<?>>();
			searchRelationMap.put("searchRelationFriend", nicknameList);
			searchRelationMap.put("searchRelationFriendSN", mbrSNList);
			searchRelationMap.put("searchRelationImage", imageList);

			// 將所有好友關聯放進 session
			session.setAttribute("searchRelationMap", searchRelationMap);

			System.out.println("searchRelation.controller 成功");

		} else {
			System.out.println("relationController 失敗");
		}

		return "relation";
	}// end of searchRelation.controller


//	***************** 顯示(搜尋)所有封鎖名單   *****************************************************************************	
	@RequestMapping(path="/showBlockadeMember.controller")
	public String showBlockadeMember(HttpSession session){

		String imageBase64 = null;
		// list 有順序且可重复
		List<RelationBean> list = null;// 使用者的封鎖名單
		List<String> nicknameList = new ArrayList<>();// 裝轉使用者封鎖名單nickname 的
		List<Integer> mbrSNList = new ArrayList<>();// 裝轉使用者封鎖名單SN 的 "list")												// "list")
		List<String> imageList = new ArrayList<>();// 裝轉成base64 Image的
													// "list"(使用者封鎖名單的image)

		MemberBean memberBean = (MemberBean) session.getAttribute("loginOK");

		if (!(memberBean == null)) {
			Integer mbrSN = memberBean.getMbrSN();

			System.out.println("Controller mbrSN (使用者號碼)= " + mbrSN);

			list = relationService.selectAllBlockadeMember(mbrSN);

			for (int i = 0; i < list.size(); i++) {

				// nicknameList放入所有好友的暱稱
				nicknameList.add(list.get(i).getTargetMbrSN().getNickName());
				System.out.println("List<RelationBean> (使用者所有的封鎖名單   暱稱)= " + list.get(i).getTargetMbrSN().getNickName());
				
				// mbrSNList放入所有封鎖的編號
				mbrSNList.add(list.get(i).getTargetMbrSN().getMbrSN());
				
				// 將所有好友圖片轉成base64 放入imageList
				imageBase64 = Base64.getEncoder().encodeToString(list.get(i).getTargetMbrSN().getImage());
				// System.out.println("List<RelationBean> (使用者所有的好友圖片編碼)= " +
				// imageBase64);
				imageList.add(imageBase64);
			}
			// System.out.println("imageList = " + imageList);

			Map<String, List<?>> showBlockadeMemberMap = new HashMap<String, List<?>>();
			showBlockadeMemberMap.put("searchBlockadeMember", nicknameList);
			showBlockadeMemberMap.put("searchBlockadeMemberSN", mbrSNList);
			showBlockadeMemberMap.put("searchBlockadeMemberImage", imageList);

			// 將所有好友關聯放進 session
			session.setAttribute("showBlockadeMemberMap", showBlockadeMemberMap);

			System.out.println("showBlockadeMember.controller 成功");

		} else {
			System.out.println("showBlockadeMember 失敗");
		}

		return "showBlockadeMember";
	}//end of showBlockadeMember.controller
	
	
//	*****************  單獨搜尋一個好友--未完成    **********************************************************************	
	@RequestMapping(path = "/searchFriend.controller")
	public String searchFriend(String nickName, HttpSession session) {

		if (!nickName.isEmpty()) {
		}

		return "";
	}
	
//	*****************  新增好友    ***************************************************************************************
	@RequestMapping(path = "/insertFriend.controller")
	// 雖然沒有回傳值 但還是寫一下@ResponseBody 比較保險
	public @ResponseBody void insertFriend(String mbrSN, String targetNickname) {

		//
		MemberBean tempSN = new MemberBean();
		int mbrSNTemp = Integer.parseInt(mbrSN);
		tempSN.setMbrSN(mbrSNTemp);

		int targetMbrSNTemp = memberDAO.selectOne(targetNickname).getMbrSN();

		MemberBean tempT = new MemberBean();
		tempT.setMbrSN(targetMbrSNTemp);

		RelationBean relationBean = new RelationBean(tempSN, tempT, null, 1, new java.util.Date());

		relationDAO.insertFriend(relationBean);

	}
//	***************** 封鎖會員(黑名單)    *************************************************************************
	@RequestMapping(path = "/blockadeMember.controller")
	public @ResponseBody void blockadeMember(String mbrSN, String targetNickname) {

		
		MemberBean tempSN = new MemberBean();
		int mbrSNTemp = Integer.parseInt(mbrSN);
		tempSN.setMbrSN(mbrSNTemp);

		int targetMbrSNTemp = memberDAO.selectOne(targetNickname).getMbrSN();

		MemberBean tempT = new MemberBean();
		tempT.setMbrSN(targetMbrSNTemp);

		RelationBean relationBean = new RelationBean(tempSN, tempT, null, 2, new java.util.Date());

		relationDAO.insertFriend(relationBean);

	}

//	***************** 刪除好友    ***************************************************************************************
	@RequestMapping(path = "/deleteFriend.controller")
	public @ResponseBody void deleteFriend(String mbrSN, String targetNickname) {
		System.out.println("deleteFriend.controller的mbrSN = " + mbrSN + ", targetNickname = " + targetNickname);

		if (!(targetNickname.isEmpty() || mbrSN.isEmpty())) {

			int targetMbrSN = memberDAO.selectOne(targetNickname).getMbrSN();

			System.out.println("deleteFriend.controller 開始");
			relationDAO.deleteFriend(mbrSN, targetMbrSN);
			System.out.println("deleteFriend.controller 成功");

		} else {
			System.out.println("deleteFriend.controller 失敗---mbrSN 或 targetNickname 是空的");
		}
	}//end of deleteFriend.controller
	
//	***************** 解除封鎖    ***************************************************************************************
	@RequestMapping(path = "/unBlockadeMember.controller")
	public @ResponseBody void unBlockadeMember(String mbrSN, String targetNickname) {
		System.out.println("unBlockadeMember.controller的mbrSN = " + mbrSN + ", targetNickname = " + targetNickname);

		if (!(targetNickname.isEmpty() || mbrSN.isEmpty())) {

			int targetMbrSN = memberDAO.selectOne(targetNickname).getMbrSN();

			System.out.println("unBlockadeMember.controller 開始");
			relationDAO.unBlockadeMember(mbrSN, targetMbrSN);
			System.out.println("unBlockadeMember.controller 成功");

		} else {
			System.out.println("unBlockadeMember.controller 失敗---mbrSN 或 targetNickname 是空的");
		}
	}//end of deleteFriend.controller

}

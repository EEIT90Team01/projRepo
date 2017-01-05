package controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.CommentBean;
import model.CommentDao;
import model.MemberBean;
import model.MemberInsertDao;

@Controller
@RequestMapping(method={RequestMethod.POST, RequestMethod.GET})
public class CommentController {
	
	@Autowired
	@Resource(name="commentDao")
	CommentDao dao ;
	@Autowired
	@Resource(name="MemberInsertDao")
	MemberInsertDao mDao;

//=====================================================================================v=================
	
	@RequestMapping(path={"/CommentInsert.controller"})
	public @ResponseBody String insertComment(
			@RequestParam(name="comment")String comment,
			@RequestParam(name="mbrSN")String strMbrSN,
			@RequestParam(name="gameSN")String strGameSN){
		long ct = System.currentTimeMillis();	Date currentTime = new Date(ct); //目前系統時間
		CommentBean bean = new CommentBean();
		MemberBean memberTemp = new MemberBean();
		int gameSN = Integer.parseInt(strGameSN);
		int mbrSN =Integer.parseInt(strMbrSN); 
		bean.setGameSN(gameSN);
		bean.setCmtTime(currentTime);
		bean.setMbrSN(mDao.select(mbrSN));
		bean.setText(comment);
		CommentBean result = dao.insert(bean);
		
		Gson gson = new Gson();
		gson.toJson(result);
		return gson.toJson(result);
	} 
	
	//==============================================================Comment Delete======================
	@RequestMapping(path={"/CommentDelete.controller"})
	public @ResponseBody String deleteComment(@RequestParam(name="cmtSN")String temp){
		int cmtSN = Integer.parseInt(temp);
		dao.delete(cmtSN);
		return "";
	}
	
	//==============================================================Comment mbrImage======================
		@RequestMapping(path="/commentMemberImage.controller")   
		public @ResponseBody String commentMemberImage(@RequestParam(name="mbrSN") String strMbrSN){
			System.out.println("進入/commentMemberImage.controller");
			int mbrSN = Integer.parseInt(strMbrSN);
			return mDao.selectImage(mbrSN);
		}
	
		//
		
		
		
		
}

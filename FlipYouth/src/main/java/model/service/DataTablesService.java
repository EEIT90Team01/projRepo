package model.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.commons.validator.routines.DateValidator;
import org.apache.commons.validator.routines.IntegerValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import model.CommentBean;
import model.EventBean;
import model.EventDetailBean;
import model.EventDetailPK;
import model.LocationBean;
import model.MemberBean;
import model.OrderBean;
import model.OrderDetailBean;
import model.OrderDetailPK;
import model.RelationBean;
import model.ShopBean;
import model.bean.AdministratorBean;
import model.bean.AuthorityBean;
import model.bean.BackEndLogBean;
import model.dao.AdministratorDTDAO;
import model.dao.AuthorityDTDAO;
import model.dao.BackEndLogDTDAO;
import model.dao.CommentDTDAO;
import model.dao.EventDTDAO;
import model.dao.EventDetailDTDAO;
import model.dao.LocationDTDAO;
import model.dao.MemberDTDAO;
import model.dao.OrderDTDAO;
import model.dao.OrderDetailDTDAO;
import model.dao.RelationDTDAO;
import model.dao.ShopDTDAO;

@Service(value = "dataTablesService")
public class DataTablesService {
	@Autowired
	private TempService tempService;
	@Autowired
	private Gson gson;
	@Autowired
	private IntegerValidator integerValidator;
	@Autowired
	private DateValidator dateValidator;
	@Autowired
	private AuthorityDTDAO authorityDtdao;
	@Autowired
	private AdministratorDTDAO administratorDtdao;
	@Autowired
	private BackEndLogDTDAO backEndLogDtdao;
	@Autowired
	private ShopDTDAO shopDtdao;
	@Autowired
	private MemberDTDAO memberDtdao;
	@Autowired
	private OrderDTDAO orderDtdao;
	@Autowired
	private OrderDetailDTDAO orderDetailDtdao;
	@Autowired
	private RelationDTDAO relationDtdao;
	@Autowired
	private CommentDTDAO commentDtdao;
	@Autowired
	private EventDTDAO eventDtdao;
	@Autowired
	private EventDetailDTDAO eventDetailDtdao;
	@Autowired
	private LocationDTDAO locationDtdao;
	

	public String ajaxQueryService(String table, String[] cols, String search, List<Integer> col, List<String> dir,
			int draw, int start, int length) throws IOException {
		Integer total = 0, totalAfterFilter = 0;

		StringBuffer hql = new StringBuffer().append("FROM ").append(table + "Bean");
		//

		//
		total = ajaxCountHandler(hql.toString(), table);
		if (!search.equals("")) {
			hql.append(" where (" + cols[0] + " like '%" + search + "%'");
			for (int i = 1; i < cols.length; i++) {
				if (cols[i].lastIndexOf("_Dis") != -1) {
					continue;
				} else {
					hql.append(" or " + cols[i] + " like '%" + search + "%'");
				}
			}
			hql.append(")");
			totalAfterFilter = ajaxCountHandler(hql.toString(), table);
		} else {
			totalAfterFilter = total;
		}

		hql.append(" order by " + cols[col.get(0)].replace("_Dis", "") + " " + dir.get(0));
		if (col.size() > 1) {
			for (int i = 1; i < col.size(); i++) {
				hql.append(", " + cols[col.get(i)].replace("_Dis", "") + " " + dir.get(i));
			}
		}
		JsonArray resultArray = ajaxQueryHandler(hql.toString(), table, start, length);
		JsonObject jObj = new JsonObject();

		jObj.add("draw", gson.toJsonTree(draw));
		jObj.add("recordsTotal", gson.toJsonTree(total));
		jObj.add("recordsFiltered", gson.toJsonTree(totalAfterFilter));
		jObj.add("data", resultArray);

		return gson.toJson(jObj);
	}

	public boolean checkExistHandler(String table, String column, String value){
		return (ajaxCountHandler("From "+table+"Bean where (" + column + " = '" + value + "')",table)>0);
	}
	public boolean checkExistHandler(String table, String column, String column2, String value, String value2){
		return (ajaxCountHandler("From "+table+"Bean where (" + column + " = '" + value + "' and "+column2+" = '"+value2+"')",table)>0);
	}
	
	@Transactional(readOnly = true)
	int ajaxCountHandler(String hql, String table) {
		switch (table) {
		case "Authority":
			return authorityDtdao.ajaxCount(hql);
		case "Administrator":
			return administratorDtdao.ajaxCount(hql);
		case "BackEndLog":
			return backEndLogDtdao.ajaxCount(hql);
		case "Shop":
			return shopDtdao.ajaxCount(hql);
		case "Member":
			return memberDtdao.ajaxCount(hql);
		case "Order":
			return orderDtdao.ajaxCount(hql);
		case "OrderDetail":
			return orderDetailDtdao.ajaxCount(hql);
		case "Relation":
			return relationDtdao.ajaxCount(hql);
		case "Comment":
			return commentDtdao.ajaxCount(hql);
		case "Event":
			return eventDtdao.ajaxCount(hql);
		case "EventDetail":
			return eventDetailDtdao.ajaxCount(hql);
		case "Location":
			return locationDtdao.ajaxCount(hql);
		default:
			return 0;
		}
	}
	//回傳給datatables
	@Transactional(readOnly = true)
	JsonArray ajaxQueryHandler(String hql, String table, int start, int length) throws IOException {
		JsonArray jArray = new JsonArray();

		switch (table) {
		case "Authority":
			List<AuthorityBean> auths = authorityDtdao.ajaxQuery(hql.toString(), start, length);
			for (AuthorityBean auth : auths) {

				JsonObject jObj = gson.toJsonTree(auth).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + auth.getAuthId()));
				jArray.add(jObj);
			}
			return jArray;
		case "Administrator":
			List<AdministratorBean> admins = administratorDtdao.ajaxQuery(hql.toString(), start, length);
			for (AdministratorBean admin : admins) {

				JsonObject jObj = new JsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + admin.getAdmId()));
				jObj.add("admId", gson.toJsonTree(admin.getAdmId()));
				try {
					jObj.add("admPassword", gson.toJsonTree(new String(admin.getAdmPassword(), "UTF-8")));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				jObj.add("admEmail", gson.toJsonTree(admin.getAdmEmail()));
				jObj.add("authId_Dis", gson.toJsonTree(admin.getAuthId().getAuthName()));
				jObj.add("authId", gson.toJsonTree(admin.getAuthId().getAuthId()));
				jArray.add(jObj);
			}
			return jArray;
		case "BackEndLog":
			List<BackEndLogBean> bels = backEndLogDtdao.ajaxQuery(hql.toString(), start, length);
			for (BackEndLogBean bel : bels) {

				JsonObject jObj = gson.toJsonTree(bel).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + bel.getAdmId() + "_" + bel.getExecuteTime()));
				jArray.add(jObj);
			}
			return jArray;
		case "Shop":
			List<ShopBean> shops = shopDtdao.ajaxQuery(hql.toString(), start, length);
			for (ShopBean shop : shops) {

				JsonObject jObj = gson.toJsonTree(shop).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + shop.getGameSN()));
				jObj.add("BigImage_Dis", gson.toJsonTree(
						"<img width='150px' src='/FlipYouth/Tim" + shop.getBigImage() + "?" + System.currentTimeMillis() + "' />"));
				jObj.add("SmallImage_Dis", gson.toJsonTree(
						"<img width='150px' src='/FlipYouth/Tim" + shop.getSmallImage() + "?" + System.currentTimeMillis() + "' />"));
				// jObj.add("div1Dis",
				// gson.toJsonTree(HtmlUtils.htmlEscape(shop.getDiv1())));
				jArray.add(jObj);
			}
			return jArray;
		case "Member":
			List<MemberBean> mbrs = memberDtdao.ajaxQuery(hql.toString(), start, length);
			for (MemberBean mbr : mbrs) {

				JsonObject jObj = gson.toJsonTree(mbr).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + mbr.getMbrSN()));
				jObj.add("image_Dis", gson.toJsonTree(tempService.getTempImg(mbr.getImage())));
	
				jObj.remove("image");
				jArray.add(jObj);
			}
			return jArray;
		case "Order":
			//System.out.println(hql);
			List<OrderBean> ords = orderDtdao.ajaxQuery(hql.toString(), start, length);
			for (OrderBean ord : ords) {

				JsonObject jObj = gson.toJsonTree(ord).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + ord.getOrderSN()));
				jObj.add("mbrSN_Dis", gson.toJsonTree(ord.getMbrSN()+" ( id = "+memberDtdao.select(ord.getMbrSN()).getMbrId()+" )"));
				jArray.add(jObj);
			}
			return jArray;
		case "OrderDetail":
			//System.out.println(hql);
			List<OrderDetailBean> ordtails = orderDetailDtdao.ajaxQuery(hql.toString(), start, length);
			for (OrderDetailBean ordtail : ordtails) {

				JsonObject jObj = gson.toJsonTree(ordtail).getAsJsonObject();
				Integer orderSN = ordtail.getPK().getOrderSN().getOrderSN();
				Integer gameSN = ordtail.getPK().getGameSN().getGameSN();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + orderSN +"_"+gameSN));
				jObj.add("orderSN", gson.toJsonTree(orderSN));
				jObj.add("gameSN", gson.toJsonTree(gameSN));
				jObj.add("gameSN_Dis", gson.toJsonTree(gameSN+" ( name = "+shopDtdao.select(gameSN).getGameName()+" )"));
				
				jArray.add(jObj);
			}
			return jArray;
		case "Relation":
			List<RelationBean> rels = relationDtdao.ajaxQuery(hql.toString(), start, length);
			for (RelationBean rel : rels) {

				JsonObject jObj = gson.toJsonTree(rel).getAsJsonObject();
				Integer mbrSN = rel.getMbrSN().getMbrSN();
				String mbrSN_Dis = rel.getMbrSN().getMbrId();
				Integer targetMbrSN = rel.getTargetMbrSN().getMbrSN();
				String targetMbrSN_Dis = rel.getTargetMbrSN().getMbrId();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + mbrSN +"_"+targetMbrSN));
				jObj.add("mbrSN", gson.toJsonTree(mbrSN));
				jObj.add("mbrSN_Dis", gson.toJsonTree(mbrSN+" ( id = "+mbrSN_Dis+" )"));
				jObj.add("targetMbrSN", gson.toJsonTree(targetMbrSN));
				jObj.add("targetMbrSN_Dis", gson.toJsonTree(targetMbrSN+" ( id = "+targetMbrSN_Dis+" )"));
				if (rel.getRelation()==1){
					jObj.add("relation_Dis", gson.toJsonTree("好友"));
				} else if (rel.getRelation()==2){
					jObj.add("relation_Dis", gson.toJsonTree("拉黑"));
				}
				jArray.add(jObj);
			}
			return jArray;
		case "Comment":
			List<CommentBean> coms = commentDtdao.ajaxQuery(hql.toString(), start, length);
			for (CommentBean com : coms) {

				JsonObject jObj = gson.toJsonTree(com).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + com.getCmtSN()));
				jObj.add("mbrSN", gson.toJsonTree(com.getMbrSN().getMbrSN()));
				jObj.add("mbrSN_Dis", gson.toJsonTree(com.getMbrSN().getMbrSN()+"( id ="+com.getMbrSN().getMbrId()+" )"));
				jArray.add(jObj);
			}
			return jArray;
		case "Event":
			List<EventBean> evts = eventDtdao.ajaxQuery(hql.toString(), start, length);
			for (EventBean evt : evts) {

				JsonObject jObj = gson.toJsonTree(evt).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + evt.getEventSN()));
				jObj.add("hostMbrSN", gson.toJsonTree(evt.getHostMbrSN().getMbrSN()));
				jObj.add("hostMbrSN_Dis", gson.toJsonTree(evt.getHostMbrSN().getMbrSN()+"( id = "+evt.getHostMbrSN().getMbrId()+" )"));
				jArray.add(jObj);
			}
			return jArray;
		case "EventDetail":
			//System.out.println(hql);
			List<EventDetailBean> evtdtails = eventDetailDtdao.ajaxQuery(hql.toString(), start, length);
			for (EventDetailBean evtdtail : evtdtails) {

				JsonObject jObj = gson.toJsonTree(evtdtail).getAsJsonObject();
				Integer eventSN = evtdtail.getEventDetailPK().getEventSN().getEventSN();
				Integer mbrSN = evtdtail.getEventDetailPK().getMbrSN().getMbrSN();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + eventSN +"_"+mbrSN));
				jObj.add("eventSN", gson.toJsonTree(eventSN));
				jObj.add("mbrSN", gson.toJsonTree(mbrSN));
				
				jArray.add(jObj);
			}
			return jArray;
		case "Location":
			List<LocationBean> locs = locationDtdao.ajaxQuery(hql.toString(), start, length);
			for (LocationBean loc : locs) {
				JsonObject jObj = gson.toJsonTree(loc).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" +loc.getLocSN()));
				jArray.add(jObj);
			}
			return jArray;

		default:
			return jArray;
		}
	}

	@Transactional
	public String ajaxDeleteHandler(String table, String[] toDelete, String admId, String note) {
		String result = "";
		int count = -1;
		BackEndLogBean belBean = new BackEndLogBean(admId, new Date());
		belBean.setBelNotes(note);
		;
		StringBuffer sql = new StringBuffer("delete from ").append(table);
		switch (table) {
		case "Authority":
			count = authorityDtdao.ajaxDelete(toDelete);
			sql.append(" where authId in (");
			break;
		case "Administrator":
			count = administratorDtdao.ajaxDelete(toDelete);
			sql.append(" where admId in (");
			break;
//		case "BackEndLog":
//			count = backEndLogDtdao.ajaxDelete(toDelete);
//			sql.append(" where composite id admId_executeTime in (");
//			break;
		case "Shop":
			count = shopDtdao.ajaxDelete(toDelete);
			sql.append(" where GameSN in (");
			break;
		case "Member":
			count = memberDtdao.ajaxDelete(toDelete);
			sql.append(" where mbrSN in (");
			break;
		case "Order":
			count = orderDtdao.ajaxDelete(toDelete);
			sql.append(" where orderSN in (");
			break;
		case "OrderDetail":
			count = orderDetailDtdao.ajaxDelete(toDelete);
			sql.append(" where composite id orderSN_gameSN in (");
			break;
		case "Comment":
			count = commentDtdao.ajaxDelete(toDelete);
			sql.append(" where cmtSN in (");
			break;
		case "Event":
			count = eventDtdao.ajaxDelete(toDelete);
			sql.append(" where orderSN in (");
			break;
		case "EventDetail":
			count = eventDetailDtdao.ajaxDelete(toDelete);
			sql.append(" where composite id eventSN_mbrSN in (");
			break;
		default:
			break;
		}
		sql.append(String.join(",", toDelete)).append(")");
		belBean.setSqlCommand(sql.toString());
		backEndLogDtdao.create(belBean);
		if (count == -1) {
			result = "刪除錯誤，請檢查表格關聯性。";
		} else {
			result = "成功刪除 " + count + " 筆資料";
		}
		JsonObject jObj = new JsonObject();
		jObj.add("text", gson.toJsonTree(result));
		return gson.toJson(jObj);
	}

	@Transactional
	public String ajaxAuthorityCuHandler(Map<String, String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		Integer authId = Integer.parseInt(cuParam.get("authId"));
		AuthorityBean bean = null;
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new AuthorityBean(authId);
		} else {
			bean = authorityDtdao.select(authId);
		}
		bean.setAuthName(cuParam.get("authName"));
		authorityDtdao.cu(bean);
		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " Authority : " + bean.toString()));
		return result;
	}

	@Transactional
	public String ajaxAdministratorCuHandler(Map<String, String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		String admId = cuParam.get("admId");
		AdministratorBean bean = null;
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new AdministratorBean(admId);
		} else {
			bean = administratorDtdao.select(admId);
		}
		bean.setAdmPassword(cuParam.get("admPassword").getBytes());
		bean.setAdmEmail(cuParam.get("admEmail"));
		bean.setAuthId(authorityDtdao.select(integerValidator.validate(cuParam.get("authId"))));
		administratorDtdao.cu(bean);
		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " Administrator : " + bean.toString()));
		return result;
	}

	@Transactional
	public String ajaxShopCuHandler(Map<String, String> cuParam, MultipartFile file) throws IOException {
		String result = "";

		JsonObject jObj = new JsonObject();
		ShopBean bean = null;
		Integer GameSN = integerValidator.validate(cuParam.get("GameSN"));
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new ShopBean();
		} else {
			bean = shopDtdao.select(GameSN);
		}
		bean.setGameName(cuParam.get("GameName"));
		bean.setIntroduction(cuParam.get("Introduction"));
		bean.setPlayingTime(cuParam.get("PlayingTime"));
		bean.setPlayerNumber(cuParam.get("PlayerNumber"));
		bean.setStockQuantity(integerValidator.validate(cuParam.get("StockQuantity")));
		bean.setGameclass(cuParam.get("Gameclass"));
		bean.setStrGameTheme(cuParam.get("StrGameTheme"));
		bean.setStrGameMechanics(cuParam.get("StrGameMechanics"));
		bean.setStrLanguage(cuParam.get("StrLanguage"));
		bean.setPrice(integerValidator.validate(cuParam.get("Price")));
		bean.setDiscount(cuParam.get("Discount"));
		bean.setFreight(cuParam.get("Freight"));

		// System.out.println(bean);
		shopDtdao.cu(bean);
		// 真正IO
		if (file != null) {
			if (!forUpdate) {
				String ext = file.getOriginalFilename();
				String filepath = "/image/small/" + bean.getGameSN() + ext.substring(ext.lastIndexOf("."));
				cuParam.put("filepath", filepath);
			}
			String gamepath = tempService.getRootPath()
					+ ("/Tim" + cuParam.get("filepath")).replace("/", File.separator);
			File outFile = new File(gamepath);
			outFile.createNewFile();
			FileOutputStream fos = new FileOutputStream(outFile);
			InputStream fis = file.getInputStream();
			IOUtils.copy(fis, fos);
			IOUtils.closeQuietly(fis);
			IOUtils.closeQuietly(fos);
			bean.setSmallImage(cuParam.get("filepath"));
		}

		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " Game : " + bean.toString()));
		return result;
	}

	@Transactional
	public String ajaxMemberCuHandler(Map<String, String> cuParam, MultipartFile file) throws IOException {
		String result = "";

		JsonObject jObj = new JsonObject();
		MemberBean bean = null;
		Integer mbrSN = integerValidator.validate(cuParam.get("mbrSN"));
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new MemberBean();
			bean.setCreateTime(new Date());
		} else {
			bean = memberDtdao.select(mbrSN);
		}
		bean.setMbrId(cuParam.get("mbrId"));
		bean.setGender(cuParam.get("gender"));
		bean.setMbrPassword(cuParam.get("mbrPassword"));
		bean.setMbrName(cuParam.get("mbrName"));
		System.out.println(cuParam.get("createTime"));
		bean.setPhone(cuParam.get("phone"));
		bean.setAddress(cuParam.get("address"));
		bean.setMbrEmail(cuParam.get("mbrEmail"));
		bean.setMbrState(integerValidator.validate(cuParam.get("mbrState")));
		bean.setEnergy(integerValidator.validate(cuParam.get("energy")));
		bean.setNickName(cuParam.get("nickName"));
		if (file != null) {
			bean.setImage(file.getBytes());
		}
		System.out.println(bean);
		memberDtdao.cu(bean);

		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " Member : " + bean.toString()));

		return result;
	}
	
	@Transactional
	public String ajaxOrderCuHandler(Map<String, String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		Integer orderSN = integerValidator.validate(cuParam.get("orderSN"));
		OrderBean bean = null;
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new OrderBean();
			bean.setOrderDate(new Date(System.currentTimeMillis()));
		} else {
			bean = orderDtdao.select(orderSN);
		}
		bean.setMbrSN(integerValidator.validate(cuParam.get("mbrSN")));
		bean.setOrderAmount(integerValidator.validate(cuParam.get("orderAmount")));
		bean.setShippedDate(dateValidator.validate(cuParam.get("shippedDate"), "yyyy/MM/dd HH:mm"));
		bean.setProductDelivery(cuParam.get("productDelivery"));
		bean.setFreight(integerValidator.validate(cuParam.get("freight")));
		bean.setPaymentMethod(cuParam.get("paymentMethod"));
		bean.setOrderState(cuParam.get("orderState"));
		bean.setEmail(cuParam.get("email"));
		bean.setAddress(cuParam.get("address"));
		bean.setName(cuParam.get("name"));
		bean.setTel(cuParam.get("tel"));
		bean.setPhone(cuParam.get("phone"));
		orderDtdao.cu(bean);
		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " Order1 : " + bean.toString()));
		return result;
	}
	
	@Transactional
	public String ajaxOrderDetailCuHandler(Map<String, String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		OrderBean orderSN = orderDtdao.select(integerValidator.validate(cuParam.get("orderSN")));
		ShopBean gameSN = shopDtdao.select(integerValidator.validate(cuParam.get("gameSN")));
		OrderDetailBean bean = null;
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new OrderDetailBean();
			bean.setPK(new OrderDetailPK(orderSN, gameSN));
		} else {
			bean = orderDetailDtdao.select(new OrderDetailPK(orderSN, gameSN));
		}
		bean.setQuantity((integerValidator.validate(cuParam.get("Quantity"))));
		orderDetailDtdao.cu(bean);
		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " OrderDetail : " + bean.toString()));
		return result;
	}
	
	@Transactional
	public String ajaxCommentCuHandler(Map<String, String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		Integer cmtSN = integerValidator.validate(cuParam.get("cmtSN"));
		CommentBean bean = null;
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new CommentBean();
			bean.setCmtTime(new Date(System.currentTimeMillis()));
		} else {
			bean = commentDtdao.select(cmtSN);
		}
		bean.setGameSN((integerValidator.validate(cuParam.get("gameSN"))));
		bean.setMbrSN(memberDtdao.select(integerValidator.validate(cuParam.get("mbrSN"))));
		bean.setText(cuParam.get("text"));
		commentDtdao.cu(bean);
		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " Comment : " + bean.toString()));
		return result;
	}
	
	@Transactional
	public String ajaxEventCuHandler(Map<String, String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		Integer eventSN = integerValidator.validate(cuParam.get("eventSN"));
		EventBean bean = null;
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new EventBean();
		} else {
			bean = eventDtdao.select(eventSN);
		}
		bean.setHostMbrSN(memberDtdao.select(integerValidator.validate(cuParam.get("hostMbrSN"))));
		bean.setLocSN(integerValidator.validate(cuParam.get("locSN")));
		bean.setMinMember(integerValidator.validate(cuParam.get("minMember")));
		bean.setBeginTime(dateValidator.validate(cuParam.get("beginTime"), "yyyy/MM/dd HH:mm"));
		bean.setEndTime(dateValidator.validate(cuParam.get("endTime"), "yyyy/MM/dd HH:mm"));
		bean.setEventState(integerValidator.validate(cuParam.get("eventState")));
		bean.setMaxMember(integerValidator.validate(cuParam.get("maxMember")));
		bean.setDeadline(dateValidator.validate(cuParam.get("deadline"), "yyyy/MM/dd HH:mm"));
		eventDtdao.cu(bean);
		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " Event : " + bean.toString()));
		return result;
	}
	
	@Transactional
	public String ajaxEventDetailCuHandler(Map<String, String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		EventBean eventSN = eventDtdao.select(integerValidator.validate(cuParam.get("eventSN")));
		MemberBean mbrSN = memberDtdao.select(integerValidator.validate(cuParam.get("mbrSN")));
		EventDetailBean bean = null;
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new EventDetailBean();
			bean.setEventDetailPK(new EventDetailPK(eventSN, mbrSN));
		} else {
			bean = eventDetailDtdao.select(new EventDetailPK(eventSN, mbrSN));
		}
		eventDetailDtdao.cu(bean);
		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " EventDetail : " + bean.toString()));
		return result;
	}
	
	@Transactional
	public String ajaxLocationCuHandler(Map<String, String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		Integer locSN = integerValidator.validate(cuParam.get("locSN"));
		LocationBean bean = null;
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate) {
			bean = new LocationBean();
		} else {
			bean = locationDtdao.select(locSN);
		}
		bean.setLocName(cuParam.get("locName"));
		bean.setLocLong(cuParam.get("locLong"));
		bean.setLocLat(cuParam.get("locLat"));
		bean.setLocPhone(cuParam.get("locPhone"));
		locationDtdao.cu(bean);
		jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
		result = gson.toJson(jObj);
		backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"),
				((forUpdate) ? ("update ") : ("insert into ")) + " Location : " + bean.toString()));
		return result;
	}
}

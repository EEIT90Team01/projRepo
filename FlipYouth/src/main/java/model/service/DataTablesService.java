package model.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import model.bean.AdministratorBean;
import model.bean.AuthorityBean;
import model.bean.BackEndLogBean;
import model.dao.AdministratorDTDAO;
import model.dao.AuthorityDTDAO;
import model.dao.BackEndLogDTDAO;

@Service(value = "dataTablesService")
public class DataTablesService {
	@Autowired
	private Gson gson;
	@Autowired
	private AuthorityDTDAO authorityDtdao;
	@Autowired
	private AdministratorDTDAO administratorDtdao;
	@Autowired
	private BackEndLogDTDAO backEndLogDtdao;

	public String ajaxQueryService(String table, String[] cols, String search, List<Integer> col, List<String> dir,
			int draw, int start, int length) {
		Integer total = 0, totalAfterFilter = 0;

		StringBuffer hql = new StringBuffer().append("FROM ").append(table + "Bean");
		//

		//
		total = ajaxCountHandler(hql.toString(), table);
		if (!search.equals("")) {
			hql.append(" where (" + cols[0] + " like '%" + search + "%'");
			for (int i = 1; i < cols.length; i++) {
				hql.append(" or " + cols[i] + " like '%" + search + "%'");
			}
			hql.append(")");
			totalAfterFilter = ajaxCountHandler(hql.toString(), table);
		} else {
			totalAfterFilter = total;
		}

		hql.append(" order by " + cols[col.get(0)] + " " + dir.get(0));
		if (col.size() > 1) {
			for (int i = 1; i < cols.length; i++) {
				hql.append(", " + cols[col.get(i)] + " " + dir.get(i));
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

	@Transactional(readOnly = true)
	int ajaxCountHandler(String hql, String table) {
		switch (table) {
		case "Authority":
			return authorityDtdao.ajaxCount(hql);
		case "Administrator":
			return administratorDtdao.ajaxCount(hql);
		case "BackEndLog":
			return backEndLogDtdao.ajaxCount(hql);
		default:
			return 0;
		}
	}

	@Transactional(readOnly = true)
	JsonArray ajaxQueryHandler(String hql, String table, int start, int length) {
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
				jObj.add("authIdText", gson.toJsonTree(admin.getAuthId().getAuthName()));
				jObj.add("authId", gson.toJsonTree(admin.getAuthId().getAuthId()));
				jArray.add(jObj);
			}
			return jArray;
		case "BackEndLog":
			List<BackEndLogBean> bels = backEndLogDtdao.ajaxQuery(hql.toString(), start, length);
			for (BackEndLogBean bel : bels) {

				JsonObject jObj = gson.toJsonTree(bel).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + bel.getAdmId() +"_"+bel.getExecuteTime()));
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
		belBean.setBelNotes(note);;
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
		case "BackEndLog":
			count = backEndLogDtdao.ajaxDelete(toDelete);
			sql.append(" where composite id admId_executeTime in (");
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
	public String ajaxAuthorityCuHandler(Map<String,String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		Integer authId = Integer.parseInt(cuParam.get("authId"));
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate && authorityDtdao.select(authId)!=null){
			jObj.add("miscE", gson.toJsonTree("已存在資料，無法新增"));
			result = gson.toJson(jObj); 
		} else {
			AuthorityBean bean = new AuthorityBean(authId,cuParam.get("authName"));
			authorityDtdao.cu(bean);
			jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
			result = gson.toJson(jObj);
//			BackEndLogBean belBean = new BackEndLogBean(cuParam.get("adminBel"), new Date());
//			belBean.setBelNotes(cuParam.get("belInput"));
//			belBean.setSqlCommand((forUpdate)?("update "):("insert into ")+" Authority : "+ bean.toString());
//			backEndLogDtdao.create(belBean);
			backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"), (forUpdate)?("update "):("insert into ")+" Authority : "+ bean.toString()));
		}					
		return result;
	}
	
	@Transactional
	public String ajaxAdministratorCuHandler(Map<String,String> cuParam) {
		String result = "";
		JsonObject jObj = new JsonObject();
		String admId = cuParam.get("admId");
		boolean forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
		if (!forUpdate && administratorDtdao.select(admId)!=null){
			jObj.add("miscE", gson.toJsonTree("已存在資料，無法新增"));
			result = gson.toJson(jObj); 
		} else {
			AdministratorBean bean = new AdministratorBean(admId, cuParam.get("admPassword").getBytes(), cuParam.get("admEmail"), authorityDtdao.select(Integer.parseInt(cuParam.get("authId"))));
			administratorDtdao.cu(bean);
			jObj.add("cuSuccess", gson.toJsonTree("操作成功"));
			result = gson.toJson(jObj);
			backEndLogDtdao.create(new BackEndLogBean(cuParam.get("adminBel"), new Date(), cuParam.get("belInput"), (forUpdate)?("update "):("insert into ")+" Administrator : "+ bean.toString()));
		}					
		return result;
	}

}

package model.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import model.bean.AdministratorBean;
import model.bean.AuthorityBean;
import model.dao.AdministratorDAO;
import model.dao.AuthorityDAO;

@Service(value = "dataTablesService")
public class DataTablesService {

	@Autowired
	private AuthorityDAO authorityDao;
	@Autowired
	private AdministratorDAO administratorDao;

	// @Transactional
	// public Object insert(Object bean) {
	// AuthorityBean result = null;
	// if (bean != null) {
	//
	// result = genericDao.insert(bean);
	//
	// }
	// return result;
	// }
	//
	// @Transactional
	// public Object update(Object bean) {
	// AuthorityBean result = null;
	// if (bean != null) {
	//
	// result = genericDao.update(bean);
	//
	// }
	// return result;
	// }

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
		Gson gson = new Gson();
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
			return authorityDao.ajaxCount(hql);
		case "Administrator":
			return administratorDao.ajaxCount(hql);
		default:
			return 0;
		}
	}

	@Transactional(readOnly = true)
	JsonArray ajaxQueryHandler(String hql, String table, int start, int length) {
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();

		switch (table) {
		case "Authority":
			List<AuthorityBean> auths = authorityDao.ajaxQuery(hql.toString(), start, length);
			for (AuthorityBean auth : auths) {

				JsonObject jObj = gson.toJsonTree(auth).getAsJsonObject();
				jObj.add("DT_RowId", gson.toJsonTree("r_" + auth.getAuthId()));
				jArray.add(jObj);
			}
			return jArray;
		case "Administrator":
			List<AdministratorBean> admins = administratorDao.ajaxQuery(hql.toString(), start, length);
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
				jObj.add("authId", gson.toJsonTree(admin.getAuthId().getAuthName()));
				jArray.add(jObj);
			}
			return jArray;
		default:
			return jArray;
		}
	}

	@Transactional
	public String ajaxDeleteHandler(String table, String[] toDelete) {
		String result = "";
		int count = -1;

		switch (table) {
		case "Authority":
			count = authorityDao.ajaxDelete(toDelete);
			break;
		case "Administrator":
			count = administratorDao.ajaxDelete(toDelete);
			break;
		default:
			break;
		}

		if (count == -1) {
			result = "刪除錯誤，請檢查表格關聯性。";
		} else {
			result = "成功刪除 " + count + " 筆資料";
		}
		Gson gson = new Gson();
		JsonObject jObj = new JsonObject();
		jObj.add("text", gson.toJsonTree(result));
		return gson.toJson(jObj);
	}

	@Transactional
	public String ajaxUpdateHandler(String table, String[] toDelete) {
		String result = "";//TODO
		int count = -1;

		switch (table) {
		case "Authority":
			count = authorityDao.ajaxDelete(toDelete);
			break;
		case "Administrator":
			count = administratorDao.ajaxDelete(toDelete);
			break;
		default:
			break;
		}

		if (count == -1) {
			result = "刪除錯誤，請檢查表格關聯性。";
		} else {
			result = "成功刪除 " + count + " 筆資料";
		}
		
		return result;
	}
}

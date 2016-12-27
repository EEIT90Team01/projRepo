package model.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	//
	// @Transactional
	// public boolean delete(Object bean) {
	// boolean result = false;
	//// if (bean != null) {
	////
	//// result = authorityDao.delete(bean.getAuthId());
	////
	//// }
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

		JSONArray resultArray = ajaxQueryHandler(hql.toString(), table, start, length);

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("draw", draw);
		jsonMap.put("recordsTotal", total);
		jsonMap.put("recordsFiltered", totalAfterFilter);
		jsonMap.put("data", resultArray);
		JSONObject jsonObject = new JSONObject(jsonMap);
		System.out.println(jsonObject);
		return jsonObject.toString();
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
	JSONArray ajaxQueryHandler(String hql, String table, int start, int length) {
		JSONArray jsonArray = new JSONArray();
		switch (table) {
		case "Authority":
			List<AuthorityBean> auths = authorityDao.ajaxQuery(hql.toString(), start, length);
			for (AuthorityBean auth:auths){
				JSONObject adminJSON = new JSONObject(auth);
				jsonArray.put(adminJSON);
			}
			return jsonArray;
		case "Administrator":
			List<AdministratorBean> admins = administratorDao.ajaxQuery(hql.toString(), start, length);
			for (AdministratorBean admin:admins){
				JSONObject adminJSON = new JSONObject();
				adminJSON.put("admId", admin.getAdmId());
				try {
					adminJSON.put("admPassword", new String(admin.getAdmPassword(),"UTF-8"));
				} catch (JSONException e) {
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				adminJSON.put("admEmail", admin.getAdmEmail());
				adminJSON.put("authId", admin.getAuthId().getAuthName());
				jsonArray.put(adminJSON);
			}
			return jsonArray;
		default:
			return jsonArray;
		}
	}
}

package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.validator.routines.DateValidator;
import org.apache.commons.validator.routines.EmailValidator;
import org.apache.commons.validator.routines.IntegerValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import model.bean.AdministratorBean;
import model.service.ColumnService;
import model.service.DataTablesService;

@Controller
@RequestMapping
public class DataTablesController {

	@Autowired
	private EmailValidator emailValidator;

	@Autowired
	private IntegerValidator integerValidator;
	
	@Autowired
	private DateValidator dateValidator;

	@Autowired
	private Gson gson;

	@Autowired
	private DataTablesService dataTablesService;

	@Autowired
	private ColumnService columnService;

	// DataTables後端處理
	@RequestMapping(path = { "/admin/datatables.controller" }, produces = "application/json; charset=UTF-8", method = {
			RequestMethod.GET })
	@ResponseBody
	public String getDataTables(@RequestParam(name = "draw") String pDraw, @RequestParam(name = "start") String pStart,
			@RequestParam(name = "length") String pLength, @RequestParam(name = "search[value]") String search,
			HttpServletRequest request) {
		String jsonResult = "";
		String[] cols = columnService.getCols();
		String table = columnService.getTableName();

		int length = 10;
		int start = 0;
		int draw = 0;
		List<Integer> col = new ArrayList<Integer>();
		List<String> dir = new ArrayList<String>();
		int i = 0;
		while (request.getParameter("order[" + i + "][column]") != null
				&& !"".equals(request.getParameter("order[" + i + "][column]"))) {
			col.add(integerValidator.validate(request.getParameter("order[" + i + "][column]")));
			dir.add(request.getParameter("order[" + i + "][dir]"));
			i++;
		}
		if (col.size() == 0) {
			col.add(0);
			dir.add("asc");
		}
		if (pStart != null) {
			start = integerValidator.validate(pStart);
			if (start < 0)
				start = 0;
		}
		if (pLength != null) {
			length = integerValidator.validate(pLength);
			if (length < 10 || length > 100)
				length = 10;
		}
		if (pDraw != null) {
			draw = integerValidator.validate(pDraw);
		}

		jsonResult = dataTablesService.ajaxQueryService(table, cols, search, col, dir, draw, start, length);
		// System.out.println(jsonResult);
		return jsonResult;

	}

	// 依分頁決定Table並暫存table and column name...
	@RequestMapping(method = { RequestMethod.GET }, path = {
			"/admin/columns.controller" }, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getTableColumns(@RequestParam String tableName) {
		String result = "";
		if (tableName != null) {
			result = columnService.getColumnInfo(tableName);
		}
		//System.out.println(result);
		return result;
	}

	// 刪除所選
	@RequestMapping(method = { RequestMethod.POST }, path = {
			"/admin/delete.controller" }, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deleteSelected(@RequestParam(value = "toDelete[]") String[] toDelete, @RequestParam String bel,
			HttpSession session) {
		String table = columnService.getTableName();
		String admId = ((AdministratorBean) session.getAttribute("admin")).getAdmId();
		String result = "";
		JsonObject jObj = new JsonObject();
		if (toDelete.length == 0 || table == null) {

			jObj.add("text", gson.toJsonTree("理論上不該出現這樣的錯誤啊"));
			result = gson.toJson(jObj);
		} else if ("Administrator".equals(table) && Arrays.asList(toDelete).contains("admin")) {
			jObj.add("text", gson.toJsonTree("不允許刪除最高權限帳號admin"));
			result = gson.toJson(jObj);
		} else {
			result = dataTablesService.ajaxDeleteHandler(table, toDelete, admId, bel);
		}
		return result;
	}

	// 增修處理
	@RequestMapping(method = { RequestMethod.POST }, path = {
			"/admin/cu.controller" }, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String createAndUpdate(@RequestParam Map<String, String> cuParam,
			@RequestParam(name = "file", required = false) MultipartFile file, HttpSession session) throws IOException {

		String result = "";
		String table = columnService.getTableName();

		if (table != null) {
			Boolean forUpdate= null;
			String admId = ((AdministratorBean) session.getAttribute("admin")).getAdmId();
			cuParam.put("adminBel", admId);
			Map<String, String> errMap = new HashMap<String, String>();
			////
			System.out.println("test with " + gson.toJson(cuParam));
			////
			if (cuParam.get("forUpdate") == null || cuParam.get("forUpdate").isEmpty()) {
				errMap.put("miscE", "理論上不該出現這樣的錯誤啊forUpdate");
			} else {
				forUpdate = Boolean.parseBoolean(cuParam.get("forUpdate"));
			}

			switch (table) {
			case "Authority":

				if (integerValidator.validate(cuParam.get("authId")) == null) {
					errMap.put("authIdE", "不可為空且需為整數");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "authId", cuParam.get("authId"))){
					errMap.put("authIdE", "已被使用");
				}
				
				if (cuParam.get("authName") == null || cuParam.get("authName").isEmpty()
						|| cuParam.get("authName").length() > 50) {
					errMap.put("authNameE", "不可為空且長度不可超過50字");
				}
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxAuthorityCuHandler(cuParam);
				break;

			case "Administrator":

				if (cuParam.get("admId") == null || cuParam.get("admId").isEmpty()
						|| cuParam.get("admId").length() > 50) {
					errMap.put("admIdE", "不可為空且長度不可超過50字");
				} else if ("admin".equals(cuParam.get("admId"))) {
					errMap.put("admIdE", "不允許修改最高權限帳號admin");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "admId", cuParam.get("admId"))){
					errMap.put("admIdE", "已被使用");
				}
				if (cuParam.get("admPassword") == null || cuParam.get("admPassword").isEmpty()
						|| cuParam.get("admPassword").length() > 20) {
					errMap.put("admPasswordE", "不可為空且長度不可超過20字");
				}
				if (cuParam.get("admEmail") == null
						|| (!cuParam.get("admEmail").isEmpty() && !(emailValidator.isValid(cuParam.get("admEmail"))
								&& cuParam.get("admEmail").length() < 50))) {
					errMap.put("admEmailE", "需為合法Email地址且長度不可超過50字");
				}
				if (integerValidator.validate(cuParam.get("authId")) == null) {
					errMap.put("authIdE", "不該出現這錯誤的啊");
				}
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxAdministratorCuHandler(cuParam);
				break;
			case "BackEndLog":
				result = gson.toJson("不對吧");
				break;
			case "Shop":
				if (file != null) {
					if (!"image".equals(file.getContentType().split("/")[0])) {
						errMap.put("SmallImageE", "檔案類型不符");
					}
					if (file.getSize() > 20 * 1024 * 1024) {
						errMap.put("SmallImageE", "檔案太大");
					}
				}
				if (forUpdate
						&& integerValidator.validate(cuParam.get("GameSN")) == null) {
					errMap.put("GameSNE", "不可為空且需為整數");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "GameSN", cuParam.get("GameSN"))){
					errMap.put("GameSNE", "已被使用");
				}
				if (cuParam.get("GameName") == null || cuParam.get("GameName").isEmpty()
						|| cuParam.get("GameName").length() > 50) {
					errMap.put("GameNameE", "不可為空且長度不可超過50字");
				}
				if (!cuParam.get("StockQuantity").isEmpty()
						&& integerValidator.validate(cuParam.get("StockQuantity")) == null) {
					errMap.put("StockQuantityE", "需為整數");
				}
				if (!cuParam.get("Price").isEmpty() && integerValidator.validate(cuParam.get("Price")) == null) {
					errMap.put("PriceE", "需為整數");
				}
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}

				result = dataTablesService.ajaxShopCuHandler(cuParam, file);
				break;
			case "Member":
				if (file != null) {
					if (!"image".equals(file.getContentType().split("/")[0])) {
						errMap.put("imageE", "檔案類型不符");
					}
					if (file.getSize() > 20 * 1024 * 1024) {
						errMap.put("imageE", "檔案太大");
					}
				}
				if (forUpdate
						&& integerValidator.validate(cuParam.get("mbrSN")) == null) {
					errMap.put("mbrSNE", "不可為空且需為整數");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "mbrSN", cuParam.get("mbrSN"))){
					errMap.put("mbrSNE", "已被使用");
				}
				if (cuParam.get("mbrId") == null || cuParam.get("mbrId").isEmpty()
						|| cuParam.get("mbrId").length() > 50) {
					errMap.put("mbrIdE", "不可為空且長度不可超過50字");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "mbrId", cuParam.get("mbrId"))){
					errMap.put("mbrIdE", "已被使用");
				}
				if (cuParam.get("mbrPassword") == null || cuParam.get("mbrPassword").isEmpty()
						|| cuParam.get("mbrPassword").length() > 50) {
					errMap.put("mbrPasswordE", "不可為空且長度不可超過50字");
				}
				if (cuParam.get("mbrEmail") == null
						|| (!cuParam.get("mbrEmail").isEmpty() && !(emailValidator.isValid(cuParam.get("mbrEmail"))
								&& cuParam.get("mbrEmail").length() < 50))) {
					errMap.put("mbrEmailE", "需為合法Email地址且長度不可超過50字");
				}
				if (cuParam.get("mbrState") !=null && !cuParam.get("mbrState").isEmpty() && integerValidator.validate(cuParam.get("mbrState")) == null) {
					errMap.put("mbrStateE", "需為整數");
				}
				if (!cuParam.get("energy").isEmpty() && integerValidator.validate(cuParam.get("energy")) == null) {
					errMap.put("energyE", "需為整數");
				}
				if (cuParam.get("nickName") == null || cuParam.get("nickName").isEmpty()
						|| cuParam.get("nickName").length() > 50) {
					errMap.put("nickNameE", "不可為空且長度不可超過50字");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "nickName", cuParam.get("nickName"))) {
					errMap.put("nickNameE", "已被使用");
				}
				if (errMap.size() != 0) {
					System.out.println(gson.toJson(errMap));
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxMemberCuHandler(cuParam, file);
				break;
			case "Order":
				if (forUpdate
						&& integerValidator.validate(cuParam.get("orderSN")) == null) {
					errMap.put("orderSNE", "不可為空且需為整數");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "orderSN", cuParam.get("orderSN"))){
					errMap.put("orderSNE", "已被使用");
				}
				if (integerValidator.validate(cuParam.get("mbrSN")) == null) {
					errMap.put("mbrSNE", "不可為空且需為整數");
				}
				if (integerValidator.validate(cuParam.get("orderAmount")) == null) {
					errMap.put("orderAmountE", "不可為空且需為整數");
				}
				if (dateValidator.validate(cuParam.get("shippedDate")) == null) {
					errMap.put("shippedDateE", "日期格式不符");
				}
				if (dateValidator.validate(cuParam.get("orderDate")) == null) {
					errMap.put("orderDateE", "日期格式不符");
				}
				if (integerValidator.validate(cuParam.get("freight")) == null) {
					errMap.put("freightE", "不可為空且需為整數");
				}
				//
				if (cuParam.get("admId") == null || cuParam.get("admId").isEmpty()
						|| cuParam.get("admId").length() > 50) {
					errMap.put("admIdE", "不可為空且長度不可超過50字");
				} else if ("admin".equals(cuParam.get("admId"))) {
					errMap.put("admIdE", "不允許修改最高權限帳號admin");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "admId", cuParam.get("admId"))){
					errMap.put("admIdE", "已被使用");
				}
				if (cuParam.get("admPassword") == null || cuParam.get("admPassword").isEmpty()
						|| cuParam.get("admPassword").length() > 20) {
					errMap.put("admPasswordE", "不可為空且長度不可超過20字");
				}
				if (cuParam.get("admEmail") == null
						|| (!cuParam.get("admEmail").isEmpty() && !(emailValidator.isValid(cuParam.get("admEmail"))
								&& cuParam.get("admEmail").length() < 50))) {
					errMap.put("admEmailE", "需為合法Email地址且長度不可超過50字");
				}
				if (integerValidator.validate(cuParam.get("authId")) == null) {
					errMap.put("authIdE", "不該出現這錯誤的啊");
				}
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxAdministratorCuHandler(cuParam);
				break;
				
			default:
				break;
			}

		}
		return result;
	}
}

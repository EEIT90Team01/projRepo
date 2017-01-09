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
		// System.out.println(result);
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

			jObj.add("text", gson.toJsonTree("理論上不該出現這樣的錯誤啊toDelete or table"));
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
			Boolean forUpdate = null;
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
			if (cuParam.get("belInput") == null){
				errMap.put("miscE", "理論上不該出現這樣的錯誤啊belNull");
			}

			switch (table) {
			case "Authority":

				if (integerValidator.validate(cuParam.get("authId")) == null) {
					errMap.put("authIdE", "不可為空且需為整數");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "authId", cuParam.get("authId"))) {
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
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "admId", cuParam.get("admId"))) {
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
					errMap.put("miscE", "不該出現這錯誤啊authId");
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
				if (forUpdate && integerValidator.validate(cuParam.get("GameSN")) == null) {
					errMap.put("GameSNE", "不可為空且需為整數");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "GameSN", cuParam.get("GameSN"))) {
					errMap.put("GameSNE", "已被使用");
				}
				if (cuParam.get("GameName") == null || cuParam.get("GameName").isEmpty()
						|| cuParam.get("GameName").length() > 50) {
					errMap.put("GameNameE", "不可為空且長度不可超過50字");
				}
				if (cuParam.get("PlayingTime") == null ||  cuParam.get("PlayingTime").length() > 50) {
					errMap.put("PlayingTimeE", "長度不可超過50字");
				}
				if (cuParam.get("PlayerNumber") == null ||  cuParam.get("PlayerNumber").length() > 50) {
					errMap.put("PlayerNumberE", "長度不可超過50字");
				}				
				if (!cuParam.get("StockQuantity").isEmpty()
						&& integerValidator.validate(cuParam.get("StockQuantity")) == null) {
					errMap.put("StockQuantityE", "需為整數");
				}
				if (cuParam.get("Gameclass") == null ||  cuParam.get("Gameclass").length() > 50) {
					errMap.put("GameclassE", "長度不可超過50字");
				}
				if (cuParam.get("Ages") == null ||  cuParam.get("Ages").length() > 50) {
					errMap.put("AgesE", "長度不可超過50字");
				}
				if (cuParam.get("StrGameTheme") == null ||  cuParam.get("StrGameTheme").length() > 50) {
					errMap.put("StrGameThemeE", "長度不可超過50字");
				}
				if (cuParam.get("StrGameMechanics") == null ||  cuParam.get("StrGameMechanics").length() > 50) {
					errMap.put("StrGameMechanicsE", "長度不可超過50字");
				}
				if (cuParam.get("StrLanguage") == null ||  cuParam.get("StrLanguage").length() > 50) {
					errMap.put("StrLanguageE", "長度不可超過50字");
				}
				if (!cuParam.get("Price").isEmpty() && integerValidator.validate(cuParam.get("Price")) == null) {
					errMap.put("PriceE", "需為整數");
				}
				if (cuParam.get("Discount") == null ||  cuParam.get("Discount").length() > 50) {
					errMap.put("DiscountE", "長度不可超過50字");
				}
				if (cuParam.get("Freight") == null ||  cuParam.get("Freight").length() > 50) {
					errMap.put("FreightE", "長度不可超過50字");
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
				if (forUpdate && integerValidator.validate(cuParam.get("mbrSN")) == null) {
					errMap.put("mbrSNE", "不可為空且需為整數");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "mbrSN", cuParam.get("mbrSN"))) {
					errMap.put("mbrSNE", "已被使用");
				}
				if (cuParam.get("mbrId") == null || cuParam.get("mbrId").isEmpty()
						|| cuParam.get("mbrId").length() > 50) {
					errMap.put("mbrIdE", "不可為空且長度不可超過50字");
				} else if (!forUpdate && dataTablesService.checkExistHandler(table, "mbrId", cuParam.get("mbrId"))) {
					errMap.put("mbrIdE", "已被使用");
				}
				if (cuParam.get("gender") == null) {
					errMap.put("miscE", "不該出現這錯誤啊gender");
				}
				if (cuParam.get("mbrPassword") == null || cuParam.get("mbrPassword").isEmpty()
						|| cuParam.get("mbrPassword").length() > 50) {
					errMap.put("mbrPasswordE", "不可為空且長度不可超過50字");
				}
				if (cuParam.get("mbrName") == null ||  cuParam.get("mbrName").length() > 50) {
					errMap.put("mbrNameE", "長度不可超過50字");
				}
				if (cuParam.get("createTime") == null) {
					errMap.put("miscE", "不該出現這錯誤啊createTime");
				}				
				if (cuParam.get("phone") == null ||  cuParam.get("phone").length() > 50) {
					errMap.put("phoneE", "長度不可超過50字");
				}
				if (cuParam.get("address") == null ||  cuParam.get("address").length() > 50) {
					errMap.put("addressE", "長度不可超過50字");
				}
				if (cuParam.get("mbrEmail") == null
						|| (!cuParam.get("mbrEmail").isEmpty() && !(emailValidator.isValid(cuParam.get("mbrEmail"))
								&& cuParam.get("mbrEmail").length() < 50))) {
					errMap.put("mbrEmailE", "需為合法Email地址且長度不可超過50字");
				}
				if (cuParam.get("mbrState") != null && !cuParam.get("mbrState").isEmpty()
						&& integerValidator.validate(cuParam.get("mbrState")) == null) {
					errMap.put("mbrStateE", "需為整數");
				}
				if (!cuParam.get("energy").isEmpty() && integerValidator.validate(cuParam.get("energy")) == null) {
					errMap.put("energyE", "需為整數");
				}
				if (cuParam.get("nickName") == null || cuParam.get("nickName").isEmpty()
						|| cuParam.get("nickName").length() > 50) {
					errMap.put("nickNameE", "不可為空且長度不可超過50字");
				} else if (!forUpdate
						&& dataTablesService.checkExistHandler(table, "nickName", cuParam.get("nickName"))) {
					errMap.put("nickNameE", "已被使用");
				}
				if (errMap.size() != 0) {
					System.out.println(gson.toJson(errMap));
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxMemberCuHandler(cuParam, file);
				break;
			case "Order":
				if (forUpdate && integerValidator.validate(cuParam.get("orderSN")) == null) {
					errMap.put("orderSNE", "不可為空且需為整數");
				} else if (!forUpdate
						&& dataTablesService.checkExistHandler(table, "orderSN", cuParam.get("orderSN"))) {
					errMap.put("orderSNE", "已被使用");
				}
				if (integerValidator.validate(cuParam.get("mbrSN")) == null) {
					errMap.put("mbrSNE", "不可為空且需為整數");
				} else if (!dataTablesService.checkExistHandler("Member", "mbrSN", cuParam.get("mbrSN"))) {
					errMap.put("mbrSNE", "該會員不存在");
				}
				if (integerValidator.validate(cuParam.get("orderAmount")) == null) {
					errMap.put("orderAmountE", "不可為空且需為整數");
				}
				if (dateValidator.validate(cuParam.get("shippedDate"), "yyyy/MM/dd HH:mm") == null) {
					errMap.put("shippedDateE", "日期格式不符 (請參考: 2017/01/01 13:01)");
				}
				// if (dateValidator.validate(cuParam.get("orderDate")) == null)
				// {
				// errMap.put("orderDateE", "日期格式不符 (請參考: 2017/01/01 13:01)");
				// }
				if (dateValidator.validate(cuParam.get("productDelivery"), "yyyy/MM/dd HH:mm") == null) {
					errMap.put("productDeliveryE", "日期格式不符 (請參考: 2017/01/01 13:01)");
				}
				if (integerValidator.validate(cuParam.get("freight")) == null) {
					errMap.put("freightE", "不可為空且需為整數");
				}
				if (cuParam.get("paymentMethod") == null || cuParam.get("paymentMethod").isEmpty()
						|| cuParam.get("paymentMethod").length() > 50) {
					errMap.put("paymentMethodE", "不可為空且長度不可超過50字");
				}
				if (cuParam.get("orderState") == null || cuParam.get("orderState").isEmpty()
						|| cuParam.get("orderState").length() > 50) {
					errMap.put("orderStateE", "不可為空且長度不可超過50字");
				}
				if (cuParam.get("email") == null || (!cuParam.get("email").isEmpty()
						&& !(emailValidator.isValid(cuParam.get("email")) && cuParam.get("email").length() < 50))) {
					errMap.put("emailE", "需為合法Email地址且長度不可超過50字");
				}				
				if (cuParam.get("address") == null ||  cuParam.get("address").length() > 50) {
					errMap.put("addressE", "長度不可超過50字");
				}
				if (cuParam.get("name") == null ||  cuParam.get("name").length() > 50) {
					errMap.put("nameE", "長度不可超過50字");
				}
				if (cuParam.get("tel") == null ||  cuParam.get("tel").length() > 50) {
					errMap.put("telE", "長度不可超過50字");
				}
				if (cuParam.get("phone") == null ||  cuParam.get("phone").length() > 50) {
					errMap.put("phoneE", "長度不可超過50字");
				}
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxOrderCuHandler(cuParam);
				break;
			case "OrderDetail":
				if (forUpdate && integerValidator.validate(cuParam.get("orderSN")) == null) {
					errMap.put("orderSNE", "不可為空且需為整數");
				} 
				if (forUpdate && integerValidator.validate(cuParam.get("gameSN")) == null) {
					errMap.put("gameSNE", "不可為空且需為整數");
				} 
				if (!forUpdate
						&& dataTablesService.checkExistHandler(table, "orderSN", "gameSN", cuParam.get("orderSN"), cuParam.get("gameSN"))) {
					errMap.put("orderSNE", "複合主鍵已被使用");
					errMap.put("gameSNE", "複合主鍵已被使用");
				}
				if (integerValidator.validate(cuParam.get("Quantity")) == null) {
					errMap.put("QuantityE", "不可為空且需為整數");
				} 
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxOrderDetailCuHandler(cuParam);
				break;
			case "Relation":
				result = gson.toJson("不對吧");
				break;
			case "Comment":
				if (forUpdate && integerValidator.validate(cuParam.get("cmtSN")) == null) {
					errMap.put("cmtSNE", "不可為空且需為整數");
				} else if (!forUpdate
						&& dataTablesService.checkExistHandler(table, "cmtSN", cuParam.get("cmtSN"))) {
					errMap.put("cmtSNE", "已被使用");
				}
				if (integerValidator.validate(cuParam.get("gameSN")) == null) {
					errMap.put("gameSNE", "不可為空且需為整數");
				} else if (!dataTablesService.checkExistHandler("Shop", "GameSN", cuParam.get("gameSN"))) {
					errMap.put("gameSNE", "該商品不存在");
				}
				if (integerValidator.validate(cuParam.get("mbrSN")) == null) {
					errMap.put("mbrSNE", "不可為空且需為整數");
				} else if (!dataTablesService.checkExistHandler("Member", "mbrSN", cuParam.get("mbrSN"))) {
					errMap.put("mbrSNE", "該會員不存在");
				}
				if (cuParam.get("text") == null) {
					errMap.put("miscE", "不該出現這錯誤啊");
				}
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxCommentCuHandler(cuParam);
				break;
			case "Event":
				if (forUpdate && integerValidator.validate(cuParam.get("eventSN")) == null) {
					errMap.put("eventSNE", "不可為空且需為整數");
				} else if (!forUpdate
						&& dataTablesService.checkExistHandler(table, "eventSN", cuParam.get("eventSN"))) {
					errMap.put("eventSNE", "已被使用");
				}
				if (integerValidator.validate(cuParam.get("hostMbrSN")) == null) {
					errMap.put("hostMbrSNE", "不可為空且需為整數");
				} else if (!dataTablesService.checkExistHandler("Member", "mbrSN", cuParam.get("hostMbrSN"))) {
					errMap.put("hostMbrSNE", "該會員不存在");
				}
				if (!cuParam.get("locSN").isEmpty()){
					if (integerValidator.validate(cuParam.get("locSN")) == null) {
						errMap.put("locSNE", "需為整數");
					} else if (!dataTablesService.checkExistHandler("Location", "locSN", cuParam.get("locSN"))){
						errMap.put("locSNE", "該地點不存在");
					}
				}
				if (!cuParam.get("minMember").isEmpty() && integerValidator.validate(cuParam.get("minMember")) == null) {
					errMap.put("minMemberE", "需為整數");
				}
				if (!cuParam.get("beginTime").isEmpty() && dateValidator.validate(cuParam.get("beginTime"), "yyyy/MM/dd HH:mm") == null) {
					errMap.put("beginTimeE", "日期格式不符 (請參考: 2017/01/01 13:01)");
				}
				if (!cuParam.get("endTime").isEmpty() && dateValidator.validate(cuParam.get("endTime"), "yyyy/MM/dd HH:mm") == null) {
					errMap.put("endTimeE", "日期格式不符 (請參考: 2017/01/01 13:01)");
				}
				if (!cuParam.get("eventState").isEmpty() && integerValidator.validate(cuParam.get("eventState")) == null) {
					errMap.put("eventStateE", "需為整數");
				}
				if (!cuParam.get("maxMember").isEmpty() && integerValidator.validate(cuParam.get("maxMember")) == null) {
					errMap.put("maxMemberE", "需為整數");
				}
				if (!cuParam.get("deadline").isEmpty() && dateValidator.validate(cuParam.get("deadline"), "yyyy/MM/dd HH:mm") == null) {
					errMap.put("deadlineE", "日期格式不符 (請參考: 2017/01/01 13:01)");
				}
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxEventCuHandler(cuParam);
				break;
			case "EventDetail":
				if (forUpdate && integerValidator.validate(cuParam.get("eventSN")) == null) {
					errMap.put("eventSNE", "不可為空且需為整數");
				} 
				if (forUpdate && integerValidator.validate(cuParam.get("mbrSN")) == null) {
					errMap.put("mbrSNE", "不可為空且需為整數");
				} 
				if (!forUpdate
						&& dataTablesService.checkExistHandler(table, "eventSN", "mbrSN", cuParam.get("eventSN"), cuParam.get("mbrSN"))) {
					errMap.put("eventSNE", "複合主鍵已被使用");
					errMap.put("mbrSNE", "複合主鍵已被使用");
				}
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxEventDetailCuHandler(cuParam);
				break;
			case "Location":
				if (forUpdate && integerValidator.validate(cuParam.get("locSN")) == null) {
					errMap.put("locSNE", "不可為空且需為整數");
				} else if (!forUpdate
						&& dataTablesService.checkExistHandler(table, "locSN", cuParam.get("locSN"))) {
					errMap.put("locSNE", "已被使用");
				}
				if (cuParam.get("locName") == null ||  cuParam.get("locName").length() > 50) {
					errMap.put("locNameE", "長度不可超過50字");
				}
				if (cuParam.get("locLong") == null ||  cuParam.get("locLong").length() > 50) {
					errMap.put("locLongE", "長度不可超過50字");
				}
				if (cuParam.get("locLat") == null ||  cuParam.get("locLat").length() > 50) {
					errMap.put("locLatE", "長度不可超過50字");
				}
				if (cuParam.get("locPhone") == null ||  cuParam.get("locPhone").length() > 50) {
					errMap.put("locPhoneE", "長度不可超過50字");
				}
				if (errMap.size() != 0) {
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxLocationCuHandler(cuParam);
				break;
			default:
				break;
			}

		}
		return result;
	}
}

package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.validator.routines.EmailValidator;
import org.apache.commons.validator.routines.IntegerValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	private Gson gson;
	
	@Autowired
	private DataTablesService dataTablesService;

	@Autowired
	private ColumnService columnService;
	
	//DataTables後端處理
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
			col.add(Integer.parseInt(request.getParameter("order[" + i + "][column]")));
			dir.add(request.getParameter("order[" + i + "][dir]"));
			i++;
		}
		if (col.size() == 0) {
			col.add(0);
			dir.add("asc");
		}
		if (pStart != null) {
			start = Integer.parseInt(pStart);
			if (start < 0)
				start = 0;
		}
		if (pLength != null) {
			length = Integer.parseInt(pLength);
			if (length < 10 || length > 100)
				length = 10;
		}
		if (pDraw != null) {
			draw = Integer.parseInt(pDraw);
		}

		jsonResult = dataTablesService.ajaxQueryService(table, cols, search, col, dir, draw, start, length);

		return jsonResult;

	}

	//依分頁決定Table並暫存table and column name...
	@RequestMapping(method = { RequestMethod.GET }, path = {
			"/admin/columns.controller" }, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getTableColumns(@RequestParam String tableName) {
		String result = "";
		if (tableName != null) {
			result = columnService.getColumnInfo(tableName);
		}
		return result;
	}

	//刪除所選
	@RequestMapping(method = { RequestMethod.POST }, path = {
			"/admin/delete.controller" }, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deleteSelected(@RequestParam(value = "toDelete[]") String[] toDelete, @RequestParam String bel, HttpSession session) {
		String table = columnService.getTableName();
		String admId = ((AdministratorBean)session.getAttribute("admin")).getAdmId();
		String result = "";
		JsonObject jObj = new JsonObject();
		if (toDelete.length==0 || table == null) {
			
			jObj.add("text", gson.toJsonTree("理論上不該出現這樣的錯誤啊"));
			result = gson.toJson(jObj);
		} else if ("Administrator".equals(table) && Arrays.asList(toDelete).contains("admin")){
			jObj.add("text", gson.toJsonTree("不允許刪除最高權限帳號admin"));
			result = gson.toJson(jObj);
		} else {
			result = dataTablesService.ajaxDeleteHandler(table, toDelete, admId, bel);
		}
		return result;
	}

	//增修處理
	@RequestMapping(method = { RequestMethod.POST }, path = {
			"/admin/cu.controller" }, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String createAndUpdate(@RequestParam Map<String,String> cuParam, HttpSession session) throws IOException {
		String result = "";
		String table = columnService.getTableName();
		
		if (table != null) {
			String admId = ((AdministratorBean)session.getAttribute("admin")).getAdmId();
			cuParam.put("adminBel", admId);
			Map<String, String> errMap = new HashMap<String, String>();

			System.out.println("test with "+gson.toJson(cuParam));	
			if (cuParam.get("forUpdate")==null||cuParam.get("forUpdate").isEmpty()){
				errMap.put("miscE", "理論上不該出現這樣的錯誤啊forUpdate");
			}
			
			switch (table){
			case "Authority":
				
				if (integerValidator.validate(cuParam.get("authId"))==null){
					errMap.put("authIdE", "不可為空且須為整數");
				}
				if (cuParam.get("authName")==null || cuParam.get("authName").isEmpty() || cuParam.get("authName").length()>50){
					errMap.put("authNameE", "不可為空且長度不可超過50字");
				}
				if (errMap.size()!=0){
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxAuthorityCuHandler(cuParam);
				break;
				
			case "Administrator":
				
				if (cuParam.get("admId")==null || cuParam.get("admId").isEmpty() || cuParam.get("admId").length()>50){
					errMap.put("admIdE", "不可為空且長度不可超過50字");
				} else if ("admin".equals(cuParam.get("admId"))){
					errMap.put("admIdE", "不允許修改最高權限帳號admin");
				}
				if (cuParam.get("admPassword")==null || cuParam.get("admPassword").isEmpty() || cuParam.get("admPassword").length()>20){
					errMap.put("admPasswordE", "不可為空且長度不可超過20字");
				}
				if (!(emailValidator.isValid(cuParam.get("admEmail")) && cuParam.get("admEmail").length()<50)){
					errMap.put("admEmailE", "需為合法Email地址且長度不可超過50字");
				}
				if (integerValidator.validate(cuParam.get("authId"))==null){
					errMap.put("authIdE", "不該出現這錯誤的啊");
				}
				if (errMap.size()!=0){
					return gson.toJson(errMap);
				}
				result = dataTablesService.ajaxAdministratorCuHandler(cuParam);
				break;
			case "BackEndLog":
				result = gson.toJson("不對吧");
				break;
			}
			
			
		}
		return result;
	}
}

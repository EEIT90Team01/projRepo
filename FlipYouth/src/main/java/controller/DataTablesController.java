package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.service.ColumnService;
import model.service.DataTablesService;

@Controller
@RequestMapping
public class DataTablesController {

	@Autowired
	private DataTablesService dataTablesService;

	@Autowired
	private ColumnService columnService;
	
	@RequestMapping(path = { "/admin/datatables.controller" }, produces = "application/json; charset=UTF-8" , method = {RequestMethod.GET})
	@ResponseBody
	public String getDataTables(@RequestParam(name = "draw") String pDraw,
			@RequestParam(name = "start") String pStart, @RequestParam(name = "length") String pLength,
			@RequestParam(name = "search[value]") String search, HttpServletRequest request) {
		String jsonResult = "";
		String[] cols = columnService.getCols();
		String table = columnService.getTableName();

		int length = 10;
		int start = 0;
		int draw = 0;
		List<Integer> col = new ArrayList<Integer>();
		List<String> dir = new ArrayList<String>();
		int i = 0;
		while (request.getParameter("order["+i+"][column]")!=null&&!"".equals(request.getParameter("order["+i+"][column]"))){
			col.add(Integer.parseInt(request.getParameter("order["+i+"][column]")));
			dir.add(request.getParameter("order["+i+"][dir]"));
			i++;
		}
		if (col.size()==0){
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
		
		
		jsonResult = dataTablesService.ajaxQueryService(table, cols, search , col , dir, draw, start, length);

		return jsonResult;

	}

	@RequestMapping(method= {RequestMethod.GET}, path = { "/admin/columns.controller" }, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getTableColumns(@RequestParam String tableName) {
		String result="";
		if (tableName != null) {
			result = columnService.getColumnInfo(tableName);
		}
		return result;
	}
	
	@RequestMapping(method= {RequestMethod.POST}, path = { "/admin/delete.controller" }, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deleteSelected(@RequestParam(value = "toDelete[]") String[] toDelete) {
		String table = columnService.getTableName();
		String result = "";
		if (table != null) {
			result = dataTablesService.ajaxDeleteHandler(table, toDelete);
		}
		return result;
	}
	
	
}

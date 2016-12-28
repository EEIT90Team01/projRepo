$(document)
.ready(
	function () {
	var selected = [];
	var tabColumns = [];
	var editIcon = {
		"class": "icon-edit",
		"orderable": false,
		"data": null,
		"defaultContent": ""
	};

	$('a[href$="tables"]').click(function () {
		if ($.fn.dataTable.isDataTable('#dataTable')) {
			$('#dataTable').DataTable().destroy();
		}
		ajaxChangeTable(this);
	});

	$('div.tab-content').on('click', '#dataTable tbody tr',
		function () {
		var id = this.id.substring(2);
		var index = $.inArray(id, selected);
		if (index === -1) {
			selected.push(id);
		} else {
			selected.splice(index, 1);
		}
		$(this).toggleClass('selected');
	});

	$('div.tab-content').on('click', 'td.icon-edit',
		function () {
		/* alert('PK='+this.parent().id.substring(2)); */
	});

	$('#deleteModal').on('hidden.bs.modal', function () {
	    console.log('hideddd');
	    $('#dataTable').DataTable().draw();
	})
	
	$('div.tab-content').on(
		'click',
		'.icon-delete',
		function () {
		if (selected.length !== 0) {
			$('#deleteModal').modal();
			$('h3.text-danger').html(
				'將刪除 ' + selected.length
				 + ' 筆資料<br>真的嗎？');
			$('.delete-confirm').click(function () {
				ajaxDelete();
				$('h3.text-danger').text('刪除中...');
			});
		}
	});

	var ajaxChangeTable = function (target) {
		$.ajax({
			url: "columns.controller",
			data: {
				tableName: target.id
			},
			success: function (result) {
				$('tbody').empty();
				var theadtr = $('<tr/>').appendTo(
						$('thead').empty());
				var tfoottr = $('<tr/>').appendTo(
						$('tfoot').empty());
				for (var idx in result.colStrings) {
					$('<th/>', {
						text: result.colStrings[idx]
					}).appendTo(theadtr);
					$('<th/>', {
						text: result.colStrings[idx]
					}).appendTo(tfoottr);
				}
				theadtr.append($('<th/>'));
				tfoottr.append($('<th/>'));
				tabColumns = result.cols;
				tabColumns.push(editIcon);
				tableGen();
			}
		});
	};

	var ajaxDelete = function () {
		console.log(JSON.stringify(selected));
		$.ajax({
			url: 'delete.controller',
			method: 'POST',
			data: {
				toDelete: selected
			},
			success: function (result) {
				console.log(result.text);
				selected = [];
				$('h3.text-danger').text(result.text);				
			},
			error: function(why){
				console.log(why);
			}
		});
	};

	var tableGen = function () {
		$('#dataTable')
		.DataTable({
			"dom": "<'row'<'col-sm-6'l><'col-sm-4'f><'col-sm-2 text-right'<'icon-new'><'icon-delete'>>>"
			 + "<'row'<'col-sm-12'tr>>"
			 + "<'row'<'col-sm-5'i><'col-sm-7'p>>",
			"processing": true,
			"serverSide": true,
			"ajax": "datatables.controller",
			"columns": tabColumns,
			"language": {
				"zeroRecords": "沒有符合資料",
				"emptyTable": "表格為空",
				"info": "顯示第 _START_ 筆至第 _END_ 筆資料，共 _TOTAL_ 筆",
				"infoEmpty": "顯示第 0 筆至第 0 筆資料",
				"infoFiltered": "(篩選前共有 _MAX_ 筆資料)",
				"thousands": ",",
				"lengthMenu": "一頁顯示 _MENU_ 筆資料",
				"loadingRecords": "讀取中...",
				"processing": "處理資料中...",
				"search": "搜尋",
				"paginate": {
					"first": "第一頁",
					"last": "最後一頁",
					"next": "向後一頁",
					"previous": "向前一頁"
				},
				"aria": {
					"sortAscending": ": 由小到大排序",
					"sortDescending": ": 由大到小排序"
				}
			},
			"rowCallback": function (row, data) {
				if ($
					.inArray(data.DT_RowId
						.substring(2),
						selected) !== -1) {
					$(row).addClass('selected');
				}
			}
		});
	};
});
$(document)
.ready(
	function () {
	var selected = []; //datatables中被選擇欄位的pk
	//var tabColumns = []; //navbar可存取的tables
	//var editIcon = ;

	//navbar的tab on click change table
	$('#navbar').find('a[href$="tables"]').click(function () {
		if ($.fn.dataTable.isDataTable('#dataTable')) {
			$('#dataTable').DataTable().destroy();
		}
		ajaxChangeTable(this.id);
	});

	$('#tables').on('click', '#dataTable tbody tr',
		function () {
		//select datatables row on click
		var pk = this.id.substring(2);
		var index = $.inArray(pk, selected);
		if (index === -1) {
			selected.push(pk);
		} else {
			selected.splice(index, 1);
		}
		$(this).toggleClass('selected');
	}).on(
		'click',
		'#dataTable td.icon-edit',
		function (event) {
		//修改資料  on click
		event.stopPropagation();
		cuHandler($('#navbar').find('li.active').find('a').attr('id'), $(this)
			.parent().attr('id').substring(2));
	}).on(
		'click',
		'div.icon-new',
		function () {
		//新增資料  on click
		cuHandler($('#navbar').find('li.active').find('a').attr('id'), null);
	}).on(
		'click',
		'div.icon-delete',
		function () {
		//刪除資料 on click
		if (selected.length !== 0) {
			$('#deleteModal').modal();
			$('#deleteModal').find('h3').toggleClass('text-success text-danger').html(
				'將刪除 ' + selected.length
				 + ' 筆資料<br>真的嗎？');
			$('#deleteModal').find('.delete-confirm').on('click', function () {
				ajaxDelete();
				$('#deleteModal').find('h3').text('刪除中...');
			});
		}
	});

	//關modal時redraw
	$('div.modal').on('hidden.bs.modal', function () {
		$('#dataTable').DataTable().draw();
	})

	//依table 顯示create/update form
	function cuHandler(table, pk) {
		$('#cuModal').modal();
		var cuForm = $('#cuModal').find('form').off();

		// 生成DOM (maybe call another js?)
		switch (table) {
		case "Authority":
			break;
		default:
			break;
		}

		var options = {
			success: function (result) {
				console.log(result);
				cuForm.find('input:first').prop('readonly', false);
			}
		};

		if (pk != null) {
			var pkInput = cuForm.find('input:first');
			pkInput.val(pk).prop('readonly', true);

			cuForm.on('reset', function (ev) {

				ev.preventDefault();
				cuForm.clearForm();
				pkInput.val(pk);
			});
			options['data'] = {
				forUpdate: true
			};
		}
		cuForm.ajaxForm(options);
	}

	function ajaxChangeTable(navId) {
		$.ajax({
			url: "columns.controller",
			data: {
				tableName: navId
			},
			success: function (result) {
				$('#dataTable').find('tbody').empty();
				var theadtr = $('<tr/>').appendTo(
						$('#dataTable').find('thead').empty());
				var tfoottr = $('<tr/>').appendTo(
						$('#dataTable').find('tfoot').empty());
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
				var tabColumns = result.cols;
				tabColumns.push({
					"class": "icon-edit",
					"orderable": false,
					"data": null,
					"defaultContent": ""
				});
				tableGen(tabColumns);
			},
			error: function (err) {
				console.log(err);
			}
		});
	};

	function ajaxDelete() {
		$.ajax({
			url: 'delete.controller',
			method: 'POST',
			data: {
				toDelete: selected
			},
			success: function (result) {
				console.log(result.text);
				selected = [];
				$('#deleteModal').find('h3').text(result.text).toggleClass('text-danger text-success');
				$('#deleteModal').find('button.delete-confirm').off();
			},
			error: function (err) {
				console.log(err);
			}
		});
	};

	function tableGen(tabColumns) {
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
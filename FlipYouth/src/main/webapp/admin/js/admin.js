$(document)
.ready(
	function () {
	var selected = []; //datatables中被選擇欄位的pk 可能要改

	//navbar的tab on click change table
	$('#navbar').find('a').click(function () {
		if (!$(this).parent().hasClass('active')) {
			if ($.fn.dataTable.isDataTable('#dataTable')) {
				$('#dataTable').DataTable().destroy();
				$('#dataTable').find('tbody').empty();
				$('#dataTable').find('tr').empty();
			}
			if ($(this).attr('href') == '#tables') {
				ajaxChangeTable(this.id);
			};
		}
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
		cuHandler($('#navbar').find('li.active').find('a').attr('id'), $('#dataTable').DataTable().row($(this).parent()).data());
		//分別傳了tablename and row data
	});

	//關modal時redraw
	$('div.modal').on('hidden.bs.modal', function (e) {

		$('#dataTable').DataTable().draw('full-hold');

		$(e.target).find('span').empty();
		$(e.target).find(':hidden').show(); //回復隱藏的確認鈕
		if ($(e.target).find('form').length>0){
		$(e.target).find('form')[0].reset();}
		$(e.target).find('img').attr('src','').removeData('temp');
		$(e.target).find('.form-control').removeData('temp'); //清除初始值
	})

	//依table 顯示create/update form
	function cuHandler(table, data) {
		var $cuForm = $('#cuModal').find('form');
		
		$cuForm.on('change','.form-control[type="file"]', function(){
		    readImgURL(this);
		});
		$('#cuModal').modal();
		if (isReadOnlyTable(table)) {
			table = "ReadOnly";
		}
		// 生成DOM
		if (table != $cuForm.data('table')) { //避免重複生成
			$cuForm.data('table', table);
			$.ajax({
				  url: '/FlipYouth/admin/pages/' + table + 'Form.html',
				  context: $cuForm[0],
				  cache: false
				}).done(function(page) {
				  $(this).html(page);
				  cuPart2();
			});
		} else {
			cuPart2();
		}
		function cuPart2(){
			$('#cuSuccess').empty();
			var options = {
				success: function (result) {
					console.log('cuajaxreturn');
					console.log(result);
					if (result['cuSuccess']) {
						$('#cuSuccess').text(result['cuSuccess']);
						$cuForm.find('button.cu-confirm').hide();
					} else {
						$cuForm.find('span').each(function (idx) {
							$(this).text(result[this.id]);
						});
					}
				},
				//only for debug
				beforeSubmit: function (arr, $form, options) {
					console.log('cuajaxgo:');
				}
			};
			if (data != null) {
				$cuForm.find('.form-control').each(function (idx) {
					if ($(this).attr('type')==='file'){
						var $img = $(this).closest('div').find('img');
						var imgSrc = $(data[$img.attr('id')]).attr('src');
						$img.attr('src',imgSrc).data('temp',imgSrc);
						console.log($('#filepath'));
						console.log(data[this.id]);
						$('#filepath').val(data[this.id]).data('temp', data[this.id]);
					} else{
						$(this).val(data[this.id]).data('temp', data[this.id]);
						if ($(this).hasClass('isPk')) {
							$(this).prop('readonly', true);
						}
					}
				});
				$cuForm.on('reset', function (ev) {
					ev.preventDefault();
					$cuForm.clearForm();
					$cuForm.find('.form-control').each(function(){
						if ($(this).attr('type')==='file'){
							var $img = $(this).closest('div').find('img');
							$img.attr('src',$img.data('temp'));
						} else {
							$(this).val($(this).data('temp'));
						}
					});
				});
				options['data'] = {
					forUpdate: true
				};
			} else {
				$pkInput = $cuForm.find('.isPk');
				if ($pkInput.attr('placeholder')==null){
					$pkInput.prop('readonly', false);
				} else {
					$pkInput.prop('readonly', true);
				}
				$cuForm.clearForm();
				options['data'] = {
					forUpdate: false
				};
			}
			$cuForm.ajaxForm(options);
			}
		
		function readImgURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();

		        reader.onload = function (e) {
		        	var $img = $(input).closest('div').find('img');
					$img.attr('src', e.target.result);
		        }

		        reader.readAsDataURL(input.files[0]);
		    }
		}

	}

	function ajaxChangeTable(navId) {
		$.ajax({
			url: "columns.controller",
			data: {
				tableName: navId
			},
			success: function (result) {
				var dtTr = $('#dataTable').find('tr');
				for (var idx in result.colStrings) {
					dtTr.append($('<th/>', {
							text: result.colStrings[idx]
						}));
				}
				dtTr.append($('<th/>'));
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

	function ajaxDelete(bel) {
		$.ajax({
			url: 'delete.controller',
			method: 'POST',
			data: {
				'toDelete': selected,
				'bel': bel
			},
			success: function (result) {
				console.log(result.text);
				selected = [];
				$('#deleteModal').find('h3').text(result.text).toggleClass('text-danger text-success');
				$('#deleteModal').find('button.delete-confirm').hide();
			},
			error: function (err) {
				console.log(err);
			}
		});
	};

	function tableGen(tabColumns) {
		$('#dataTable')
		.DataTable({
			"fixedHeader": {
				footer: true
			},
			buttons: [{
					extend: 'colvis',
					text: '<div class="icon-config"></div>'
				}, {
					extend: 'excel',
					text: '<div class="icon-save"></div>'
				}, {
					text: '<div class="icon-new"></div>',
					action: function (e, dt, node, config) {
						//新增資料  on click
						cuHandler($('#navbar').find('li.active').find('a').attr('id'), null);
					}
				}, {
					text: '<div class="icon-delete"></div>',
					action: function (e, dt, node, config) {
						//刪除資料 on click

						var $dModal = $('#deleteModal').modal();
						if (isReadOnlyTable($('#navbar').find('li.active').find('a').attr('id'))) {
							$dModal.find('h3').text('本表格不可手動刪除');
							$dModal.find('label').hide();
							$dModal.find('button.delete-confirm').hide();
						} else if (selected.length == 0) {}
						else {
							$('#deleteModal').find('h3').toggleClass('text-success text-danger').html(
								'將刪除 ' + selected.length
								 + ' 筆資料<br>真的嗎？');
							$('#deleteModal').find('.delete-confirm').on('click', function () {
								ajaxDelete($('#belInput').val());
								$('#belInput').val('');
								$('#deleteModal').find('h3').text('刪除中...');
							});
						}
					}
				}
			],
			"autoWidth": false,
			"colReorder": true,
			"dom": "<'row'<'col-sm-6'B<'inline-fix'l>><'col-sm-6'f>>"
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
//		.on( 'xhr', function () {
//		    var data = $('#dataTable').DataTable().ajax.params();
//		    for (var i in data){
//		    	console.log(i+" : ");
//		    	console.log(data[i]);
//		    }
//		}); //for debug
	};
	function isReadOnlyTable(table) {
		var readOnlyTable = ["BackEndLog", "Relation", "BanLog"];
		if (readOnlyTable.indexOf(table) != -1) {
			return true;
		} else {
			return false;
		}
	}
});

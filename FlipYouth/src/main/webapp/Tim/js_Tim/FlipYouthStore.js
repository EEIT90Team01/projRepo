$( document ).ready(function () {
		$(window).trigger('resize')
	});
$(window).resize(function() {
	if($(window).width()<770){

		$('.navbar-nav').children().css("display","table-cell");
		$('#lastli').remove();
		$('#shopTopRow').hide();
		$('.menuIcon').show();
	}else{

		$('.navbar-nav').children().css("display","table-cell");
		$('#lastli').remove();
		$('#shopTopRow').show();
		$('.menuIcon').hide();
	}
	
	});
	
	$('.menuIcon').on('click',function(){
		$('#lastli').remove();
		$('<li role="presentation" id="lastli"  onclick="closeNav()"><a href="javascript:void(0)">\<--------</a></li>').appendTo($('.navbar-nav'));
		$('.navbar-nav').children().css("display","block");
// 		$('#shopTopRow').show();
		$('#shopTopRow').show("slide", { direction: "left" }, 500);
		$('.menuIcon').hide();
	})
	function closeNav(){
		$('#lastli').remove();
		$('.navbar-nav').children().css("display","table-cell");
		$('#shopTopRow').hide("slide", { direction: "right" }, 500);
		$('.menuIcon').show();
	}
	
	$('#shopTopRow').on('click',function(){
		if($(window).width()<770){
		$(this).hide();
		$('.menuIcon').show();}
	})
	
	$(function(){
			$(window).scroll(function(){
				var scrollTop = $(document).scrollTop();
				$('.shoppingBox').stop().animate({top:scrollTop+240},500);	
			});
			
		});
		
		$(function(){
			$(window).scroll(function(){
				var scrollTop = $(document).scrollTop();
				$('.menuIcon').stop().animate({top:scrollTop+70},500);	
			});
			
		});
		$( window ).scroll(function() {
			if(window.scrollY > 279)
				{
				$('#navbar').addClass("scroll-300");
				}else{
				$('#navbar').removeClass("scroll-300");
				$('.shopTopRow').animate({'padding':10},100);
				
			}
			
			});


		$(function () {
		    move_div();
		    $(window).resize(move_div);
		    $(window).scroll(move_div);
		});
		function move_div() {
		//  window_width =window.parent.outerWidth;
		//  window_height = window.parent.outerHeight;
		 window_width =$(window).width();
		 window_height = $(window).height();
			obj_width = $('#loadingIMG').width();
		 obj_height = $('#loadingIMG').height();
		 $('#loadingIMG').css({
		     'top': ((window_height / 2) - (obj_height / 2) + document.body.scrollTop),
		     'left': (window_width / 2) - (obj_width / 2)
		 });
		}


//	<!-- fullcalendar  iooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo -->
		$(document).ready(
				function() {
					var date = new Date();
					var d = date.getDate();
					var m = date.getMonth();
					var y = date.getFullYear();
					$('#datepicker').datepicker({
						changeYear : true,
						changeMonth : true,
						inline : true,
						onSelect : function(dateText, inst) {
							var d = new Date(dateText);
							$('#calendar').fullCalendar('gotoDate', d);
 						}
					});
					$('#calendar').fullCalendar(
							{	editable : false,
								header : {
									left : 'myCustomButton,prev,next today',
									center : 'title',
									right : 'month,agendaWeek,agendaDay'
								},
								events : {
									url : "/FlipYouth/fullcalendar.controller",
									error : function() {
									}
								},
								eventClick : function(event, jsEvent, view) {
									window.open("data:image/png;base64,"
											+ event.image, '訂單明細',
											config = 'height=700,width=700')
								},
								loading : function(bool) {
									$('#nobrtext').text("處理中...");
									$('#loadingIMG').toggle();
								},
							});
				});
		
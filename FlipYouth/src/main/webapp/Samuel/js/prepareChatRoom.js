	$(document).ready( function(){
		var divbox = $("<div></div>").addClass("chat_room_box");
		var inputNick = $('<input>').attr({type:'hidden',value:'$\{loginOK.nickName\}',id:'websocketUserNickName'});
		var divHead = $("<div></div>").addClass("chat_room_head").text("Chat Room");
		var divBody = $("<div></div>").addClass("chat_room_body");
		var chat_js = "<script type='text/javascript' src='js/chatRoom.js'/>"
			console.log("進入chatRoom.js的$(function(){3}");
 		$(document.body).append(divbox.append(inputNick).append(divHead).append(divBody));
 		$(document.body).append(chat_js);
//			$(document.body).append(divbox.append(inputNick).append(divHead).append(divBody));

	})
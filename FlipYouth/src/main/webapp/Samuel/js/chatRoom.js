
var userSN = $('#websocketUserSN').val();
var userNickName = $('#websocketUserNickName').val();

var webSocket = new WebSocket("ws://localhost:8080/FlipYouth/privateChatServer/"+userNickName);
		webSocket.onmessage = function(data) {processMessage(data)};
		webSocket.onopen = function(){
			console.log("userNickName : "+userNickName+"已連上webSocket userSN="+userSN);
		}
		
		$('.chat_room_head').click(function(){					//點擊 聊天室即 顯示聊天室body
			$('.chat_room_body').slideToggle('slow');			//傳到webSocketServer讓其他分頁開啟
			var jsonData = JSON.stringify({
				"action" : "clickChatRoom"
			});
			//===========傳到webSocketServer讓其他分頁開啟=======================================
//			webSocket.send(jsonData);
			//==============================================================================
		});
		
		
		function oneToOneChat(from, to, text) {
			console.log("oneToOneChat, from="+from+",to="+to+"text="+text);
			var jsonData = JSON.stringify({
				"from" : from,
				"to" : to,
				"text" : text,
				"action" : "oneChat"
			});
			webSocket.send(jsonData);
			$('#message').val("");
		}
		
		
//***********************	processMessage   *************************************
		function processMessage(message) {
			console.log("收到" + message.data)
			var jsonData = JSON.parse(message.data);
			var action = jsonData.action;
			console.log("action = " + action);
			
			switch (action) {
			
			//============		某位使用者上線   	=========================	
			case "updateOnline":						
				console.log(jsonData.userName + "上線囉");
				var mbrName = jsonData.userName;
				var mbrSN = mbrSNByNickName(mbrName);
				var strBaseImage = mbrImageBymbrSN(mbrSN);
				var updateUser = "<div id='"+mbrSN+"_List'onclick='clickUserList("+mbrSN+",\""+mbrName+"\")' class='chat_room_user' ><img style='margin-right:8px;width:40px;height:40px' src='data:image/jpg;base64,"+strBaseImage+"'/>"+mbrName+"</div>";
				$('.chat_room_body').append(updateUser);
				break;
			
			//=============	   收到訊息(包括自己其他分頁收到自己發送給他人的訊息)		==================
			case "oneChat":	
				var receive = jsonData.to;
				var text = jsonData.text;
				var from = jsonData.from;
				var id = mbrSNByNickName(from);			//傳訊人的mbrSN
				var userMbrSN = mbrSNByNickName(receive);			//在自己其他分頁用得到
				if(from === userNickName){								//自己的其他頁面接收自己發出給他人的訊息
					var mbrSNImage = mbrImageBymbrSN(id);	//傳訊人的大頭貼
//					console.log("對話框中的頭像 , mbrSNImage = "+mbrSNImage);
//					console.log("進入oneChat的if(from === userNickName), from = "+from);
					if(!$("#" + userMbrSN).length){
//						console.log("進入if(!$(\"#\" + userMbrSN).length)");
						chatboxManager.addBox(userMbrSN, {title : receive, to : from, userImage:mbrSNImage}, text);
						
					}else{
						$("#" + userMbrSN).chatbox("option", "boxManager").addMsgSelf(from, text,mbrSNImage);
					}
					break;
				}
				
				var mbrSNImage = mbrImageBymbrSN(id);
				var receiveMemberImage = mbrImageBymbrSN(userMbrSN);
//				console.log("對話框中的頭像 , mbrSNImage = "+mbrSNImage);
//				console.log("進入oneChat, from = "+from);
				
				if(!$("#" + id).length){
					console.log("進入if(!$(\"#\" + id).length)");
					chatboxManager.addBox(id, {title : from, to : receive, userImage:receiveMemberImage}, text);
				}else{
					console.log("進入if(!$(\"#\" + id).length)的  else*********");
					$("#" + id).chatbox("option", "boxManager").addMsg(from, text, mbrSNImage);					
				}
				break;

				
			//=============	   得到已上線使用者的名單		==================				
			case "getOnlineUser":
				console.log("進入case getOnlineUse, 得到已上線名單+" + jsonData.userNameArray)
				
				//	用for迴圈在聊天室顯示所有已上線使用者		
				for ( var name in jsonData.userNameArray) {
					var mbrName = jsonData.userNameArray[name];
					var mbrSN = mbrSNByNickName(mbrName);
					var strBaseImage = mbrImageBymbrSN(mbrSN);
					var onlineUser = "<div id='"+mbrSN+"_List'onclick='clickUserList("+mbrSN+",\""+mbrName+"\")' class='chat_room_user' ><img style='margin-right:8px;width:40px;height:40px;' src='data:image/jpg;base64,"+strBaseImage+"'/>"+mbrName+"</div>";
					$('.chat_room_body').append(onlineUser);					
				}
				break;
			
			case "getLeavingUser":
				console.log("哪位user下線，getLeavingUser = "+jsonData.userNameArray[0]);
					var userName = jsonData.userNameArray[0];
					var mbrSN = mbrSNByNickName(userName);
					$('#'+mbrSN+"_List").remove();
				break;
				
			case "clickChatRoom":
				$('.chat_room_body').slideToggle('slow');
				break;
				
			//*****************		comment的message		************************************	
			case "sendComment":
				var nickName = jsonData.nickName;
				console.log("case sendComment: nickName="+nickName+", comment="+comment);
				var comment = jsonData.comment;
				var cmtTime = jsonData.cmtTime
				var cmtSN = jsonData.cmtSN;
					
					$.ajax({
						url:"/FlipYouth/commentMemberImage.controller",
						type:'POST',
						data:"&mbrSN="+jsonData.mbrSN,
			 			mimeType: "text/plain; charset=x-user-defined",
						dataType:"text",
						success:function(data){
							if(userNickName == nickName){
								var commentBlock = "<div class='container-fluid'><input type='hidden' id='"+cmtSN+"'><div class='row'><div class='col-md-1'></div><div class='col-md-10'><div class='panel panel-default'><div class='panel-heading'><h3 class='panel-title'><img style='width:50px;height:50px' src='data:image/png;base64,"+data+"'/><span style='color: blue;'>"+nickName+"</span><br></h3></div><div class='panel-body'><span >"+comment+"</span></div><div class='panel-footer'><div class='row'><div class='col-md-11'><span>"+cmtTime+"</span></div><div class='col-md-1'><button class='btn btn-xs btn-link active' type='submit' onclick='deleteSQLComment("+cmtSN+")'  >delete</button></div></div></div></div></div><div class='col-md-1'></div></div></div>";	
							}else{
								var commentBlock = "<div class='container-fluid'><input type='hidden' id='"+cmtSN+"'><div class='row'><div class='col-md-1'></div><div class='col-md-10'><div class='panel panel-default'><div class='panel-heading'><h3 class='panel-title'><img style='width:50px;height:50px' src='data:image/png;base64,"+data+"'/><span style='color: blue;'>"+nickName+"</span><br></h3></div><div class='panel-body'><span >"+comment+"</span></div><div class='panel-footer'><div class='row'><div class='col-md-11'><span>"+cmtTime+"</span></div><div class='col-md-1'></div></div></div></div></div><div class='col-md-1'></div></div></div>";
							}
							$('#commentDiv').append(commentBlock);
						}
					});
			break;
			
			case "deleteComment":
				var cmtSN = jsonData.cmtSN;
				deleteComment(cmtSN);
			break;
			//******************************************************************************************
			
			
			}//switch下括號
			
		}
	//*****************************************************************************************************************		
		function nickNameBymbrSN(mbrSN){
			var result;
			$.ajax({			
				url:"/FlipYouth/getNickNameByMbrSN.controller",
				type:'POST',
				data:"&mbrSN="+mbrSN,
				async: false ,
				success:function(nickName){
					result = nickName;     
				}
			});			
			return result;
		}
		
		
		function mbrImageBymbrSN(mbrSN){
			var result;
			$.ajax({			
				url:"/FlipYouth/commentMemberImage.controller",
				type:'POST',
				data:"&mbrSN="+mbrSN,
				async: false ,
				success:function(strBaseImage){
					result = strBaseImage;     
				}
			});			
			return result;
		}
		
		function mbrSNByNickName(nickName){				//用nickName查詢 mbrSN
			console.log("進入mbrSNByNickName, nickName="+nickName);
			var result;
			
			$.ajax({			
				url:"/FlipYouth/getMbrSNByNickName.controller",
				type:'POST',
				data:"&nickName="+nickName,
				async: false ,
				success:function(mbrSN){
					result = mbrSN;     
				}
			})
			return result;
		}
		
		function clickUserList(mbrSN, mbrName){			//點擊聊天室列表user建立一對話框
			var mbrSNImage = mbrImageBymbrSN(mbrSNByNickName(userNickName));	//使用者的大頭貼		
			console.log("進入clickUserList, mbrSN = "+mbrSN+", title : mbrName = "+mbrName+", to : userNickName="+userNickName);
			chatboxManager.addBox(mbrSN, {title : mbrName , to : userNickName, userImage:mbrSNImage },null);
		}						
		
		//==========================	  聊天室接資料庫		============================
		
		function selectAllChat(user,received,clickedMbrName,scrollPosition){		//=======查詢聊天紀錄==========
//			console.log("進入查詢歷史訊息selectAllChat user ="+user+", received="+received+", clickedMbrName="+clickedMbrName);
			
			var counter = $('#'+received+'hidden').val();
			
			$.ajax({			
				url:"/FlipYouth/selectChatHistory.controller	",
				type:'POST',
				data:"&send="+user+"&receive="+received+"&counter="+counter,
				
				success:function(data){
					if(scrollPosition == 500){
						var dataJson = JSON.parse(data);
						var countChatTimes = 0;
						for(var index in dataJson){
							countChatTimes  +=1 ;
							showChatHistoryAndScroll(dataJson[index],clickedMbrName,received);
						}
						console.log("有幾個ChatBean countChatTimes="+countChatTimes);
						if(countChatTimes == 10){
							var hiddenInput = $('#'+received+'hidden').val();
							$('#'+received+'hidden').val((hiddenInput/10+1)*10);
	//						console.log("hiddenInput="+hiddenInput);
						}else{
							$('#'+received+'hidden').remove();
						}
					}else{
						var dataJson = JSON.parse(data);
						var countChatTimes = 0;
						for(var index in dataJson){
							countChatTimes  +=1 ;
							showChatHistory(dataJson[index],clickedMbrName,received);
						}
						console.log("有幾個ChatBean countChatTimes="+countChatTimes);
						if(countChatTimes == 10){
							var hiddenInput = $('#'+received+'hidden').val();
							$('#'+received+'hidden').val((hiddenInput/10+1)*10);
	//						console.log("hiddenInput="+hiddenInput);
						}else{
							$('#'+received+'hidden').remove();
						}
					}
				}
			})
			
		}
//		function addLoadMore(receivedMbrSN){
//			$("#" + receivedMbrSN).chatbox("option", "boxManager").addLoadDiv();
//		}
		
		
		
		function showChatHistory(chatBean,clickedMbrName,receivedMbrSN){
//			console.log("showChatHistory拿到的chatBean="+JSON.stringify(chatBean)+", clickedMbrName="+clickedMbrName+", receivedMbrSN="+receivedMbrSN+",userSN="+userSN);
			if(chatBean.sendMbrSN == userSN){		//當sendMbr就是使用者本人，對話在右邊
				$("#" + receivedMbrSN).chatbox("option", "boxManager").addMsgS(userNickName, chatBean.message,mbrImageBymbrSN(userSN) );
																			// 使用者暱稱		*訊息內容				*使用者大頭貼
			}else{
				$("#" + receivedMbrSN).chatbox("option", "boxManager").addMsgS(clickedMbrName, chatBean.message,mbrImageBymbrSN(chatBean.sendMbrSN) );
			}
		}
		
		//==================================	chatContent拉條置頂用	====================================
		function showChatHistoryAndScroll(chatBean,clickedMbrName,receivedMbrSN){		
//			console.log("showChatHistory拿到的chatBean="+JSON.stringify(chatBean)+", clickedMbrName="+clickedMbrName+", receivedMbrSN="+receivedMbrSN+",userSN="+userSN);
			if(chatBean.sendMbrSN == userSN){		//當sendMbr就是使用者本人，對話在右邊
				$("#" + receivedMbrSN).chatbox("option", "boxManager").addMsgScroll(userNickName, chatBean.message,mbrImageBymbrSN(userSN) );
																			// 使用者暱稱		*訊息內容				*使用者大頭貼
			}else{
				$("#" + receivedMbrSN).chatbox("option", "boxManager").addMsgScroll(clickedMbrName, chatBean.message,mbrImageBymbrSN(chatBean.sendMbrSN) );
			}
		}
		//==========================================================================================================
		
		
		function saveChat(receiver,sendnickName,msg){	//========儲存聊天訊息========
			var send = mbrSNByNickName(sendnickName);
//			console.log("進入saveChat receiver="+receiver+", send="+send+", msg="+msg);
			$.ajax({			
				url:"/FlipYouth/saveChatHistory.controller	",
				type:'POST',
				data:"&send="+send+"&receive="+receiver+"&message="+msg,
				success:function(data){
					console.log(data);
				}
			})
		}
		
		
		//==============================================================================
		
		function chatContentScroll(divId){
//			var scrollTOP = $( "div[name='chatContent']" ).scrollTop();
			var thisScrollTOP = $('#'+divId).scrollTop();
			console.log("chatDiv拉條位置="+thisScrollTOP);
			if($('#'+divId+'hidden').length){
				if(thisScrollTOP===0){
					var nickName = nickNameBymbrSN(divId);
					selectAllChat(userSN,divId,nickName,500);
				}
			}
		}
		
		
		
		
		
		
		
		
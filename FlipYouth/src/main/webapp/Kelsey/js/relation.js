	
//		***************************  搜尋會員方法  開始  ***********************************************************************************	
	
// 	$('#searchMemberButton').click(function(){
		 function searchMember() {
			 var searchMemberNickname = $('#nickName');
			if(searchMemberNickname.val().length == 0 || searchMemberNickname.val()== "" 
					|| searchMemberNickname.val() == null || searchMemberNickname.val()== " "){
// 				if(isEmpty( searchMemberNickname.val() ) ){
				return;
			}//end of if
			
			console.log("成功進入 searchMemeber");
			$.ajax({
				url : "/FlipYouth/searchMember.controller",
				type : "GET",
				data : 
					
					"&nickName=" + searchMemberNickname.val(),

				// 	由於AJAX 預設都是 非同步模式 (Asynchronous) 所以必須把 Asynchronous 設為 false (就是同步 Synchronous) 
				// 	解釋就是等AJAX 有了返回值才會執行下面的 JS 
				// 	jquery的async:false,這個屬性默認是true：異步，false：同步
				async : true,
				success : function(data) {
					
					//console.log(data);
					$('#searchMemberImage').attr("src","data:image/png;base64,"+data);
					$('#searchMemberNickname').text(searchMemberNickname.val());
					$('#searchMemberArea').css("display","");
					
					//抓取relation.jsp 中的值。因資料庫nickname 第一個字是大寫剩下小寫  所以並需這樣轉換才可以抓到值
					var nickname = 
					searchMemberNickname.val().charAt(0).toUpperCase()+searchMemberNickname.val().toLowerCase().substring(1);
					
					console.log(nickname);
					//teststr等於   <div name="FriendImage" class="${friend}Tag">${friend}</div>  中 的 class="   ${friend}Tag  "
					var teststr = 'div.'+nickname+'Tag';
					console.log(teststr);
					if ($(''+teststr).length!=0){//代表好友列表中沒有這個人的名子  即不是好友  "加入好友"的按鈕就隱藏
						$('#insertFriendButton').hide();
					}
					
				},//end of success
			})
// 			 end of ajax
			
		};// end of searchMember()
		
//		***************************  搜尋會員方法  結束  ***********************************************************************************
		
		
// 		***************************  加入好友方法  開始  ***********************************************************************************

		$('#insertFriendButton').click(function(){
			console.log('#insertFriendButton 進入成功')
			$.ajax({
				url : "/FlipYouth/insertFriend.controller",
				type : "GET",
				//
				data : "&mbrSN=" +$('#mbrSN').val()+"&targetNickname=" + $('#searchMemberNickname').text(),
				async : true,
				//如果加入成功 則直接再啟動window.location.reload(),更新好友頁面
				success : function() {
	  				console.log(" insertFriendButton   成功~~");
	  				window.location.reload();
					
				},//end of success
			})
		
		})//end of insertFriendButton
		
		
		
//		function insertFriendButton(){
//			console.log('#insertFriendButton 進入成功')
//			$.ajax({
//				url : "/FlipYouth/insertFriend.controller",
//				type : "GET",
//				//
//				data : "&mbrSN=" +$('#mbrSN').val()+"&targetNickname=" + $('#searchMemberNickname').text(),
//				async : true,
//				//如果加入成功 則直接再啟動window.location.reload(),更新好友頁面
//				success : function() {
//	  				console.log(" insertFriendButton   成功~~");
//	  				window.location.reload();
//					
//				},//end of success
//			})
//		}
		
		
		
// 		***************************  加入好友方法  結束  ***********************************************************************************

// 		***************************  封鎖會員方法(黑名單)-1(button)  開始  ***********************************************************************************
		
		$('#BlockadeMemberButton').click(function(){
			$.ajax({
				url : "/FlipYouth/blockadeMember.controller",
				type : "GET",
				//
				data : "&mbrSN=" +$('#mbrSN').val()+"&targetNickname=" + $('#searchMemberNickname').text(),
				async : true,
				//如果加入成功 則直接再啟動window.location.reload(),更新好友頁面
				success : function() {
	  				console.log(" BlockadeMemberButton   成功~~");
	  				window.location.reload();
					
				},//end of success
			})
		
		})//end of insertFriendButton
		
// 		***************************  封鎖會員方法(黑名單)-1(button)  結束  ***********************************************************************************

// 		***************************  封鎖會員方法(黑名單)-2(image)  開始  ***********************************************************************************
		
		//只需要顯示一次即可  已經在"deleteFriendImage"那邊寫了  所以這邊註解起來(但為了方便閱讀  所以還是有加上)
//			function clickFriend(targetMbrSN){
//			console.log("進入friendArea, targetMbrSN = "+targetMbrSN);
// 				$('#'+targetMbrSN).css("display" ,"");
// 			};//end of clickFriend(targetMbrSN)
		
		function BlockadeMemberImageButton(targetNickname){
			$.ajax({
				url : "/FlipYouth/blockadeMember.controller",
				type : "GET",
				//
				data : "&mbrSN=" +$('#mbrSN').val()+"&targetNickname=" + targetNickname,
				async : true,
				//如果加入成功 則直接再啟動window.location.reload(),更新好友頁面
				success : function() {
	  				console.log(" BlockadeMemberButton   成功~~");
	  				window.location.reload();
					
				},//end of success
			})
			
		}//end of BlockadeMemberImageButton
		
// 		***************************  封鎖會員方法(黑名單)-2(image)  結束  ***********************************************************************************

		

// 		***************************  刪除好友方法-1(button)  開始  ***********************************************************************************
		 
		$('#deleteFriendButton').click(function(){
			$.ajax({
				url : "/FlipYouth/deleteFriend.controller",
				type : "GET",
				//
				data : "&mbrSN=" +$('#mbrSN').val()+"&targetNickname=" + $('#searchMemberNickname').text(),
				async : true,
				//如果加入成功 則直接再啟動window.location.reload(),更新好友頁面
				success : function() {
	  				console.log("deleteFriend.controller   成功~~");
	  				window.location.reload();
					
				},//end of success
			})
		
		})//end of deleteFriendButton
		
// 		***************************  刪除好友方法-1(button)  結束  ***********************************************************************************
		

// 		***************************  刪除好友方法-2(image)  開始  ***********************************************************************************
		
 			function clickFriend(targetMbrSN){
			console.log("進入friendArea, targetMbrSN = "+targetMbrSN);
 				$('#'+targetMbrSN).css("display" ,"");
 			};//end of clickFriend(targetMbrSN)
 			
// 			deleteFriendImageButton()方法 需要帶入一個 targetNickname 參數
					function deleteFriendImageButton(targetNickname){
				console.log("進入deleteFriendImageButton")
						$.ajax({
				 				url : "/FlipYouth/deleteFriend.controller",
				 				type : "GET",
				 				//
				 				data : "&mbrSN=" +$('#mbrSN').val()+"&targetNickname=" + targetNickname,
				 				async : true,
				 				//如果加入成功 則直接再啟動window.location.reload(),更新好友頁面
				 				success : function() {
				 	  				console.log("deleteFriend.controller   成功~~");
				 	  				window.location.reload();
									
				 				},//end of success
							}) //end of ajax
							
				};//end of deleteFriendImageButton(targetNickname)
 				
//			***************************  刪除好友方法-2(image)  結束  ***********************************************************************************

				
				
//		 	***************************  解除封鎖會員方法(黑名單)-2(image)  開始  ***********************************************************************************
				
					function blockadeMemberArea(targetMbrSN){
					console.log("blockadeMemberArea, targetMbrSN = "+targetMbrSN);
		 				$('#'+targetMbrSN).css("display" ,"");
		 			};//end of clickFriend(targetMbrSN)
				
				function unBlockadeMemberImageButton(targetNickname){
					$.ajax({
						url : "/FlipYouth/unBlockadeMember.controller",
						type : "GET",
						//
						data : "&mbrSN=" +$('#mbrSN').val()+"&targetNickname=" + targetNickname,
						async : true,
						//如果加入成功 則直接再啟動window.location.reload(),更新好友頁面
						success : function() {
			  				console.log(" unBlockadeMemberImageButton   成功~~");
			  				window.location.reload();
							
						},//end of success
					})
					
				}//end of BlockadeMemberImageButton
				
//		 	***************************  解除封鎖會員方法(黑名單)-2(image)  結束  ***********************************************************************************

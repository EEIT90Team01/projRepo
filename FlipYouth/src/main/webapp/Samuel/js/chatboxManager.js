// Need this to make IE happy
// see http://soledadpenades.com/2007/05/17/arrayindexof-in-internet-explorer/
if (!Array.indexOf) {
	Array.prototype.indexOf = function(obj) {
		for (var i = 0; i < this.length; i++) {
			if (this[i] == obj) {
				return i;
			}
		}
		return -1;
	}
}

var chatboxManager = function() {

	// list of all opened boxes
	var boxList = new Array();
	// list of boxes shown on the page
	var showList = new Array();
	// list of first names, for in-page demo
	var nameList = new Array();

	var config = {
//		width : 200, // px
//		chatRoom:270,
		width : 270, // px
		chatRoom:270,
		gap : 20,
		maxBoxes : 5,
		messageSent : function(dest, user, msg, userImage) {
			// override this
			console.log("進入 chatboxManager的config.messageSent dest="+dest+", user="+user);
			$("#" + dest).chatbox("option", "boxManager").addMsg(user, msg,userImage);
		}
	};

	var init = function(options) {
		$.extend(config, options)
	};

	var delBox = function(id) {
		// TODO
	};

	var getNextOffset = function() {
		return (config.width + config.gap) * showList.length + 270 ;
	};

	var boxClosedCallback = function(id) {
		// close button in the titlebar is clicked
		var idx = showList.indexOf(id);
		console.log("close button in the titlebar is clicked  idx="+idx+", id="+id);
		console.log("$(\"#\"+id).parent().parent()="+$("#"+id).parent().parent());
		$("#"+id).parent().parent().remove();
		if (idx != -1) {		//showList裡有找到該id
			console.log("showList="+showList+", boxList="+boxList+", nameList="+nameList);
			showList.splice(idx, 1);	//移除掉第idx個array元素
			boxList.splice(idx, 1);		//移除掉第idx個array元素
			nameList.splice(idx, 1);
			console.log(" after close  ==> showList="+showList+", boxList="+boxList+", nameList="+nameList);
			diff = config.width + config.gap;
			for (var i = idx; i < showList.length; i++) {
				console.log("boxClosedCallback");
				offset = $("#" + showList[i]).chatbox("option", "offset");
				$("#" + showList[i]).chatbox("option", "offset", offset - diff);
				
			}
		} else {
			alert("should not happen: " + id);
		}
	};
	// ============================================================================    addBox
	// caller should guarantee the uniqueness of id
	var addBox = function(id, user, name ) {
		console.log("進入chatboxManager.js的addbox, id = " + id);
		console.log("id = "+id+", user.title = "+user.title+", user.to = "+user.to+", name = "+name);
		var idx1 = showList.indexOf(id);
		var idx2 = boxList.indexOf(id);
		
		if (idx1 != -1) {
			console.log("addBox idx1 != -1");
			// found one in show box, do nothing
		} else if (idx2 != -1) {
			// exists, but hidden
			// show it and put it back to showList
			console.log("addBox idx2 != -1");
			$("#" + id).chatbox("option", "offset", getNextOffset());
			var manager = $("#" + id).chatbox("option", "boxManager");
			manager.toggleBox();
			showList.push(id);
		} else {
			var el = document.createElement('div');
			el.setAttribute('id', id);
			$(el).attr("onscroll","chatContentScroll("+id+")");
			var hiddenInput = "<input type='hidden' id='"+id+"hidden' value=0>"
			$(el).append(hiddenInput);
			$(el).chatbox({
				id : id,
				user : user,
				title : user.title,
				hidden : false,
				width : config.width,
				offset : getNextOffset(),
				messageSent : messageSentCallback,
				boxClosed : boxClosedCallback
			})//**********************************************
			selectAllChat(userSN,id,user.title);	//建立新對話框時，把對話記錄加進去
			boxList.push(id);
			showList.push(id);
			nameList.push(id);
			console.log("boxList = "+boxList+", showList = "+showList+", nameList = "+nameList);
			
		}

	};

	var messageSentCallback = function(title, user, msg) {	//title是被密的那個人的id
		console.log("進入chatManager的messageSentCallback, msg = "+msg+", title="+title+", user="+user);
		if(msg == null){
			console.log("進入messageSentCallback的if(msg == null)");
		return;	
		}
		console.log("user.to = "+user.to);
		console.log("user.title = "+user.title);
		console.log("msg = "+msg);
		
		saveChat(title,user.to,msg);//儲存對話資料  user.to是送訊息的人的暱稱 title是收到訊息的人的id
		
		oneToOneChat(user.to,user.title,msg); //************************************************************
		var idx = boxList.indexOf(title);
		config.messageSent(nameList[idx],user.to, msg, user.userImage);
	};

	// not used in demo
	var dispatch = function(id, user, msg) {
		$("#" + id).chatbox("option", "boxManager")
				.addMsg(user.first_name, msg);
	}

	return {
		init : init,
		addBox : addBox,
		delBox : delBox,
		dispatch : dispatch
	};
}();
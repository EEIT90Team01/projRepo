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
			console.log("進入 chatboxManager的config.messageSent");
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
		console.log("close button in the titlebar is clicked");
		// close button in the titlebar is clicked
		var idx = showList.indexOf(id);
		if (idx != -1) {
			showList.splice(idx, 1);
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
			// found one in show box, do nothing
		} else if (idx2 != -1) {
			// exists, but hidden
			// show it and put it back to showList
			$("#" + id).chatbox("option", "offset", getNextOffset());
			var manager = $("#" + id).chatbox("option", "boxManager");
			manager.toggleBox();
			showList.push(id);
		} else {
			var el = document.createElement('div');
			el.setAttribute('id', id);
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
			
			boxList.push(id);
			showList.push(id);
			nameList.push(id);
			console.log("boxList = "+boxList+", showList = "+showList+", nameList = "+nameList);
			
		}

	};

	var messageSentCallback = function(title, user, msg) {
		console.log("進入chatManager的messageSentCallback, msg = "+msg+", title="+title+", user="+user);
		if(msg == null){
			console.log("進入messageSentCallback的if(msg == null)");
		return;	
		}
		console.log("title = "+title);
		console.log("user = "+user.title);
		console.log("msg = "+msg);
		
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
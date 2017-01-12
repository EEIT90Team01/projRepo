/*
 * Copyright 2010, Wen Pu (dexterpu at gmail dot com)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * Check out http://www.cs.illinois.edu/homes/wenpu1/chatbox.html for document
 *
 * Depends on jquery.ui.core, jquery.ui.widiget, jquery.ui.effect
 *
 * Also uses some styles for jquery.ui.dialog
 *
 */

// TODO: implement destroy()
(function($) { // $(document).ready(function(){...})的簡寫形式
	

	$.widget("ui.chatbox",{options : {
							id : null, // id for the DOM element
							title : null, // title of the chatbox
							user : null, // can be anything associated withthis chatbox
							userImage:null,
							hidden : false,
							offset : 0, // relative to right edge of the browserwindow
							width : 300, // width of the chatbox
							messageSent : function(id, user, msg, userImage) {
								// override this
								console.log("進入jquery.ui.chatbox.js的chatbox.messageSend方法, userImage = "+userImage);
								this.boxManager.addMsg(user.first_name, msg,userImage);
							},
							boxClosed : function(id) {
								
							}, // called when the close icon is clicked
							boxManager : {
								// thanks to the widget factory facility
								// similar to http://alexsexton.com/?p=51
								init : function(elem) {
									this.elem = elem;
								},
								
								
								
							addLoadDiv : function(){
								console.log("進入ui.chat的addLoadDiv");
								var self = this;
								var box = self.elem.uiChatboxLog;
								var e = document.createElement('div');
								box.prepend(e);
								var sp = document.createElement('span');
								$(sp).text("LoadMore...");
								$(sp).attr("margin-left",100);
								$(e).append(sp);
//								
							},	
							addMsgScroll : function(peer, msg, mbrSNImage){
								console.log("進入addMsgScroll方法~~~~");
								var self = this;
								var box = self.elem.uiChatboxLog;
								var e = document.createElement('div');
								box.prepend(e);
								var chatImg = "<img style='width:40px;height:40px;' src='data:image/png;base64,"+mbrSNImage+"'/>";
								var picDiv =  "<div class='picture'>"+chatImg+"</div>";
								var msgDiv = "<div class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
								$(e).prepend(picDiv);
								
								if(peer === userNickName){
									var msgDiv = "<div style='margin-left:27px;' class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
									$(e).append(msgDiv);
									$(e).addClass("message-box right-img");
								}else{
									var msgDiv = "<div class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
									$(e).append(msgDiv);
									$(e).addClass("message-box left-img");
								}
								$(e).css({"maxWidth":$(box).width(),"margin-bottom":"5px"});
								$(e).fadeIn();
								self.elem.uiChatboxLog.scrollTop(350);
							},
							addMsgS : function(peer, msg, mbrSNImage){		//append 改成prepend，為了歷史對話記錄用的
									console.log("成功進入覆寫的addMsgS");	
									
									var self = this;
									var box = self.elem.uiChatboxLog;
									var e = document.createElement('div');
									box.prepend(e);
									var chatImg = "<img style='width:40px;height:40px;' src='data:image/png;base64,"+mbrSNImage+"'/>";
									var picDiv =  "<div class='picture'>"+chatImg+"</div>";
									var msgDiv = "<div class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
									$(e).prepend(picDiv);
									
									if(peer === userNickName){
										var msgDiv = "<div style='margin-left:27px;' class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
										$(e).append(msgDiv);
										$(e).addClass("message-box right-img");
									}else{
										var msgDiv = "<div class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
										$(e).append(msgDiv);
										$(e).addClass("message-box left-img");
									}
									$(e).css({"maxWidth":$(box).width(),"margin-bottom":"5px"});
									$(e).fadeIn();
									self._scrollToBottom();

									
									
							},	
								
							addMsgSelf	 : function(peer, msg, mbrSNImage){ //使用者的其他分頁用
								
								var self = this;
								var box = self.elem.uiChatboxLog;
								var e = document.createElement('div');
								box.append(e);
								var chatImg = "<img style='width:40px;height:40px;' src='data:image/png;base64,"+mbrSNImage+"'/>";
								var picDiv =  "<div class='picture'>"+chatImg+"</div>";
								var msgDiv = "<div class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
								$(e).append(picDiv);
								
								if(peer === userNickName){
									var msgDiv = "<div style='margin-left:27px;' class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
									$(e).append(msgDiv);
									$(e).addClass("message-box right-img");
								}else{
									var msgDiv = "<div class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
									$(e).append(msgDiv);
									$(e).addClass("message-box left-img");
								}
								$(e).css({"maxWidth":$(box).width(),"margin-bottom":"5px"});
								$(e).fadeIn();
								self._scrollToBottom();
							},
								
//================================		修改addMsg方法	================================================
								
								
							addMsg : function(peer, msg, mbrSNImage) {
								console.log("進入jquery.ui.chatbox.js的addMsg方法 peer= "+peer+", msg= "+msg );
//									var self = this;
//									var box = self.elem.uiChatboxLog;
//									var e = document.createElement('div');
//									box.append(e);
//									$(e).hide();
//									var systemMessage = false;
//									var chatImg = "<img style='width:30px;height:30px;margin-left:0px;' src='data:image/png;base64,"+mbrSNImage+"'/>";
//									
//									if (peer) {
//										var peerName = document
//												.createElement("b");
//										$(peerName).text(peer + ": ");
//										$(e).append(chatImg);//*******************************大頭照sppend to <div>
//										e.appendChild(peerName);
//									} else {
//										systemMessage = true;
//									}
//
//									var msgElement = document
//											.createElement(systemMessage ? "i"
//													: "span");
//									$(msgElement).text(msg).css("word-wrap", "break-word");
//									e.appendChild(msgElement);
//									if(peer === userNickName){
//										console.log("peer === userNickName");
//										$(e).addClass("ui-chatbox-msg-bySamuel");  //ui-chatbox-msg等同於println 每句話換行	
//									}else{
//										console.log("peer != userNickName");
//										$(e).addClass("ui-chatbox-msg");
//									}
////									$(e).css("maxWidth", $(box).width());
//									$(e).fadeIn();
//									self._scrollToBottom();
//
//									if (!self.elem.uiChatboxTitlebar
//											.hasClass("ui-state-focus")
//											&& !self.highlightLock) {
//										self.highlightLock = true;
//										self.highlightBox();
//									}
								
								//***************************************************************************
								var self = this;
								var box = self.elem.uiChatboxLog;
								var e = document.createElement('div');
								box.append(e);
								var chatImg = "<img style='width:40px;height:40px;' src='data:image/png;base64,"+mbrSNImage+"'/>";
								var picDiv =  "<div class='picture'>"+chatImg+"</div>";
								var msgDiv = "<div class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
								$(e).append(picDiv);
								
								if(peer === userNickName){
									var msgDiv = "<div style='margin-left:27px;' class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
									$(e).append(msgDiv);
									$(e).addClass("message-box right-img");
								}else{
									var msgDiv = "<div class='message'><span>"+peer+"</span><p>"+msg+"</p></div>"
									$(e).append(msgDiv);
									$(e).addClass("message-box left-img");
								}
								$(e).css({"maxWidth":$(box).width(),"margin-bottom":"5px"});
								$(e).fadeIn();
								self._scrollToBottom();
								if (!self.elem.uiChatboxTitlebar
										.hasClass("ui-state-focus")
										&& !self.highlightLock) {
									self.highlightLock = true;
									self.highlightBox();
								}
								
								
								
//								<div class="chat-box">
//							    <div class="message-box right-img">
//							      <div class="picture">
//							        <img src="http://dribbble.s3.amazonaws.com/users/212696/avatars/small/monogram_pixel_perfect.png?1359994784" title="user name">
//							        <span class="time">2 mins</span>
//							      </div>
//							      <div class="message">
//							        <span>Mike Moloney</span>
//							        <p>Pretty good, Eating nutella, nommommom</p>
//							      </div>
//							    </div>
//							  </div>
								},
//============================================      收到訊息特效       ==================================
							//可以換特效   到https://jqueryui.com/effect/  
								highlightBox : function() {
									var self = this;
									self.elem.uiChatboxTitlebar.effect(
											"highlight", {}, 300);
									
									self.elem.uiChatbox.effect("pulsate", { 
										times : 3
									}, 300, function() {
										self.highlightLock = false;
										
										self._scrollToBottom();
										
										
									});
									console.log("self.elem.uiChatboxLog.scrollTop()="+self.elem.uiChatboxLog.scrollTop());
									
								},
								toggleBox : function() {
									this.elem.uiChatbox.toggle();
								},
								_scrollToBottom : function() {
									var box = this.elem.uiChatboxLog;
									box.scrollTop(box.get(0).scrollHeight);
								}
							}
						},
//================================================================================================
						//**************************************************
						toggleContent : function(event) {
							this.uiChatboxContent.toggle();
							if (this.uiChatboxContent.is(":visible")) {
								this.uiChatboxInputBox.focus();
							}
						},
						//**************************************************
						widget : function() {
							return this.uiChatbox
						},
						_create : function() {
							var self = this, options = self.options, title = options.title
									|| "No Title",
							// chatbox
							uiChatbox = (self.uiChatbox = $('<div></div>'))
									.appendTo(document.body)
									.addClass(
											'ui-widget ' + 'ui-corner-top '
													+ 'ui-chatbox')
									.attr('outline', 0)
									.focusin(
											function() {
												// ui-state-highlight is not
												// really helpful here
												// self.uiChatbox.removeClass('ui-state-highlight');
												self.uiChatboxTitlebar
														.addClass('ui-state-focus');
											})
									.focusout(
											function() {
												self.uiChatboxTitlebar
														.removeClass('ui-state-focus');
											}),
							// titlebar
							uiChatboxTitlebar = (self.uiChatboxTitlebar = $('<div></div>'))
									.addClass(
											'ui-widget-header '
													+ 'ui-corner-top '
													+ 'ui-chatbox-titlebar '
													+ 'ui-dialog-header' // take
																			// advantage
																			// of
																			// dialog
																			// header
																			// style
									).click(function(event) {
										self.toggleContent(event);
									}).appendTo(uiChatbox), uiChatboxTitle = (self.uiChatboxTitle = $('<span></span>'))
									.html(title).appendTo(uiChatboxTitlebar), uiChatboxTitlebarClose = (self.uiChatboxTitlebarClose = $('<a href="#"></a>'))
									.addClass(
											'ui-corner-all '
													+ 'ui-chatbox-icon ')
									.attr('role', 'button')
									.hover(
											function() {
												uiChatboxTitlebarClose
														.addClass('ui-state-hover');
											},
											function() {
												uiChatboxTitlebarClose
														.removeClass('ui-state-hover');
											})
									.click(
											function(event) {
//												slideToggle();
												uiChatbox.hide();
												self.options
														.boxClosed(self.options.id);
												return false;
											}).appendTo(uiChatboxTitlebar), uiChatboxTitlebarCloseText = $(
									'<span></span>').addClass(
									'ui-icon ' + 'ui-icon-closethick').text(
									'close').appendTo(uiChatboxTitlebarClose), uiChatboxTitlebarMinimize = (self.uiChatboxTitlebarMinimize = $('<a href="#"></a>'))
									.addClass(
											'ui-corner-all '
													+ 'ui-chatbox-icon')
									.attr('role', 'button')
									.hover(
											function() {
												uiChatboxTitlebarMinimize
														.addClass('ui-state-hover');
											},
											function() {
												uiChatboxTitlebarMinimize
														.removeClass('ui-state-hover');
											}).click(function(event) {
										self.toggleContent(event);
										return false;
									}).appendTo(uiChatboxTitlebar), uiChatboxTitlebarMinimizeText = $(
									'<span></span>').addClass(
									'ui-icon ' + 'ui-icon-minusthick').text(
									'minimize').appendTo(
									uiChatboxTitlebarMinimize),
							// content
							uiChatboxContent = (self.uiChatboxContent = $('<div></div>'))
									.addClass(
											'ui-widget-content '
													+ 'ui-chatbox-content ')
									.appendTo(uiChatbox), uiChatboxLog = (self.uiChatboxLog = self.element)
									.addClass(
											'ui-widget-content '
													+ 'ui-chatbox-log').attr("name","chatContent")
									.appendTo(uiChatboxContent), uiChatboxInput = (self.uiChatboxInput = $('<div></div>'))
									.addClass(
											'ui-widget-content '
													+ 'ui-chatbox-input')
									.click(function(event) {
										// anything?
									}).appendTo(uiChatboxContent), uiChatboxInputBox = (self.uiChatboxInputBox = $('<textarea></textarea>'))
									.addClass(
											'ui-widget-content '
													+ 'ui-chatbox-input-box '
													+ 'ui-corner-all')
									.appendTo(uiChatboxInput)
									.keydown(
											function(event) {
												if (event.keyCode
														&& event.keyCode == $.ui.keyCode.ENTER) {
													msg = $.trim($(this).val());
													if (msg.length > 0) {
														self.options
																.messageSent(
																		self.options.id,
																		self.options.user,
																		msg);
													}
													$(this).val('');
													return false;
												}
											})
									.focusin(
											function() {
												uiChatboxInputBox
														.addClass('ui-chatbox-input-focus');
												var box = $(this).parent()
														.prev();
												box
														.scrollTop(box.get(0).scrollHeight);
											})
									.focusout(
											function() {
												uiChatboxInputBox
														.removeClass('ui-chatbox-input-focus');
											});

							// disable selection
							uiChatboxTitlebar.find('*').add(uiChatboxTitlebar)
									.disableSelection();

							// switch focus to input box when whatever clicked
							uiChatboxContent.children().click(function() {
								// click on any children, set focus on input box
								self.uiChatboxInputBox.focus();
							});

							self._setWidth(self.options.width);
							self._position(self.options.offset);

							self.options.boxManager.init(self);

							if (!self.options.hidden) {
								uiChatbox.show();
							}
						},
						_setOption : function(option, value) {
							if (value != null) {
								switch (option) {
								case "hidden":
									if (value)
										this.uiChatbox.hide();
									else
										this.uiChatbox.show();
									break;
								case "offset":
									this._position(value);
									break;
								case "width":
									this._setWidth(value);
									break;
								}
							}
							$.Widget.prototype._setOption
									.apply(this, arguments);
						},
						_setWidth : function(width) {
							this.uiChatboxTitlebar.width(width + "px");
							this.uiChatboxLog.width(width + "px");
							this.uiChatboxInput.css("maxWidth", width + "px");
							// padding:2, boarder:2, margin:5
							this.uiChatboxInputBox.css("width", (width - 18)
									+ "px");
						},
						_position : function(offset) {
							this.uiChatbox.css("right", offset);
						}
					});}(jQuery));

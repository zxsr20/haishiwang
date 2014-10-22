
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0037)http://www.xueersi.com/open/6836.html -->
<HTML>
<HEAD>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/view/resource1.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<META charset="utf-8">
<META content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<META name="keywords" content="">
<META name="description" content="海事公开课">
<TITLE>海事公开课</TITLE>
<LINK rel="stylesheet" type="text/css" href="<%=basePath%>/css/page_index.css">
<LINK rel="stylesheet" type="text/css" href="<%=basePath%>/css/page_listen.css">
<LINK rel="stylesheet" type="text/css" href="<%=basePath%>/css/page_home.css">
<LINK rel="shortcut icon" href="http://img04.xesimg.com/favicon.ico">
<script src="<%=basePath%>/js/html5media.min.js"></script>
<SCRIPT src="<%=basePath%>/js/xue.js"></SCRIPT>
<SCRIPT src="<%=basePath%>/js/xes_stat.js"></SCRIPT>
<!--[if lt IE 9]> 
	<link href="http://css04.xesimg.com/ie_project.css?1407139873" type="text/css" rel="stylesheet" />	
	<link href="http://css04.xesimg.com/ie_header.css?1407139873" type="text/css" rel="stylesheet" />	
	<![endif]-->
<META name="GENERATOR" content="MSHTML 9.00.8112.16441">
</HEAD>
<BODY>
	<!--头部  start-->
	<DIV id="header" class="index_header">
		<input id="userid" type="hidden" value="${userid}"> <input id="username" type="hidden" value="${username}"> <input id="courseid" type="hidden" value="${course.sxCourse.id}">
		<input id="programid" type="hidden" value="${course.programid}">
		<!--头部  start id#header 登录后有广告高度为144-->
		<jsp:include page="head_share.jsp" />
		<DIV id="headnav">
			<UL>
				<c:forEach items="${coursetype}" var="user" varStatus="status">
					<c:if test="${status.index == 0}">
						<LI class="firstClass "><A href="newlist.do?type_code=${user.type_code}" xes_id="gradenav_xiaoyi"><c:out value="${user.name}" /></A></LI>
					</c:if>
					<c:if test="${status.index > 0}">
						<LI><A href="newlist.do?type_code=${user.type_code}" xes_id="gradenav_xiaoyi"><c:out value="${user.name}" /></A></LI>
					</c:if>
				</c:forEach>
			</UL>
		</DIV>
		<!-- 内容 start-->
		<DIV id="container">
			<LINK rel="stylesheet" type="text/css" href="" media="all">
			<SCRIPT src=""></SCRIPT>
			<SCRIPT type="text/javascript" src=""></SCRIPT>
			<SCRIPT type="text/javascript" src=""></SCRIPT>
			<DIV id="container">
				<DIV class="coures_content">
					<H2>${course.sxCourse.name}
						<STRONG></STRONG>
					</H2>
					<DIV class="content_player">
						<DIV class="player_list">
							<DIV class="list_title">
								<SPAN style="padding-left: 20px;">课程内容</SPAN>
							</DIV>
							<!-- 课程目录列表-->
							<DIV class="ui_scrolls scrolls_free">
								<DIV style="display: block;" id="outline1" class="scrolls_item">
									<DIV class="scrolls_con">
										<UL class="select_list">
											<LI class="scrolls_title" title="${course.sxCourse.name}">${course.sxCourse.name}</LI>
											<c:forEach items="${course.sxPrograms}" var="user" varStatus="status">
												<c:if test="${user.id eq course.programid}">
													<LI class="current">
														<P>
															<EM class="icon icon_live_gary">节</EM><A title="影响学习效果的三大要素" href="newdetail.do?course_id=${user.course_id}&id=${user.id}"><c:out value="${fn:substring(user.name, 0, 10)}" /></A>
														</P>
													</LI>
												</c:if>
												<c:if test="${user.id ne course.programid}">
													<LI>
														<P>
															<EM class="icon icon_live_gary">节</EM><A title="影响学习效果的三大要素" href="newdetail.do?course_id=${user.course_id}&id=${user.id}"><c:out value="${fn:substring(user.name, 0, 10)}" /></A>
														</P>
													</LI>
												</c:if>
											</c:forEach>
										</UL>
									</DIV>
								</DIV>
							</DIV>
							<A class="document_download gray" disabled="">下载本课程讲义</A>
							<SCRIPT>
								function ajaxCourseInformation(urlStr, urlKey) {
									if (urlKey == '' || urlStr == '') {
										alert('参数不合法');
										return false;
									}
									var params = "urlStr=" + urlStr
											+ "&amp;urlKey=" + urlKey;
									var url = "/Courses/ajaxCourseInformation/";
									$.ajax({
										url : url,
										type : 'post',
										dataType : 'html',
										data : {
											courseId : urlStr,
											urlKey : urlKey
										},
										success : function(data) {
											//							alert(data);return false;
											var resData = xue.ajaxCheck
													.HTML(data);
											if (resData) {
												xue.win({
													id : 'dlClass', // 多个弹窗需要设置id
													title : false, // 弹窗标题
													content : resData, // 弹窗里面的内容
													lock : true, // 背景遮罩
													width : 780,
													height : 400,
													submit : false,
													cancel : false, // 取消按钮的事件，如果true则直接关闭，如果false则不显示
													close : true
												// 点击关闭时的事件
												});
											}
										},
										error : function() {
											alert('数据读取错误..');
										}
									});
								}
							</SCRIPT>
						</DIV>
						<DIV class="player_live">
							<video src="${course.play_url}" width="745" height="465" controls autobuffer></video>
						</DIV>
						<DIV class="player_info">
							<DL>
								<DT>授课老师：</DT>
								<DD>
									<DIV class="ui_avatar_con">
										<DIV class="ui_avatar">
											<UL class="avatar_items">
												<LI class="ui_userinfo" data-params="userId=559" data-id="559">${course.sxCourse.teacher_name}</LI>
											</UL>
										</DIV>
									</DIV>
								</DD>
							</DL>
							<DIV class="listen_num">
								<STRONG>196889</STRONG><SPAN>播放</SPAN>
							</DIV>
							<DIV class="collect">
								<A id="collectId" onclick="collect(6836)" href="javascript:void(0);">收藏课程</A>
							</DIV>
						</DIV>
					</DIV>
				</DIV>
				<SCRIPT>
					function collect(id) {
						var userid = $("#userid").val();
						var courseid = $("#courseid").val();

						if (userid == null || userid == "") {
							alert("请先登录！");
							return;
						}

						if (courseid == null || courseid == "") {
							alert("课程不存在！");
							return;
						}

						$.ajax({
							url : 'sx_collect_course.do',
							type : 'get',
							data : "userid=" + userid + "&" + "courseid="
									+ courseid,
							success : function(msg) {//alert(data);return false;
								if (msg.success) {
									$('#collectId').addClass('collect_current')
											.attr('onclick', '');
								} else {
									alert(msg.msg);
								}
							},
							error : function() {
								alert('数据读取错误..');
							}
						});

					}
				</SCRIPT>
				<!-- 听课页上半部份 end-->
				<!-- 听课页下半部份  -->
				<DIV class="layout">
					<DIV class="layout_body left w_730 mtop_20">
						<DIV class="panel_listen">
							<DIV id="nav_module" class="main_header">
								<UL id="course_tab" class="nav_links">
									<LI class="current" data-params="" data-url=""><A href="javascript:void(0);" data-params="" data-url="">课程详情</A></LI>
									<LI class=" last" data-params="" data-url=""><A href="javascript:void(0);" data-params="" data-url="">课程评价<STRONG>(2721)</STRONG></A></LI>
								</UL>
							</DIV>
							<DIV id="course_info_box">
								<!--课程详情-->
								<DIV style="display: block;" id="course_content" class="course_detail">
									<!--课程详情-->
									<DL>
										<DT>课程更新时间</DT>
										<DD>
											本课程更新于 <FONT color="red">${course.sxCourse.update_date}</FONT>。
										</DD>
									</DL>
									<DL>
										<DL>
											<DT class="ui_infor_title_1">详情</DT>
											<DD class="agg"></DD>
											<DD class="agg">${course.sxCourse.description}</DD>
										</DL>
									</DL>
									<!-- 课程详情 end-->
								</DIV>
								<!-- 课程详情 end-->
								<!-- 课程评价 start-->
								<DIV id="comment" class="course_detail" name="comment">
									<DIV class="detail_login">
										登录后才可以发表评价哦！<A href="javascript:alert('还未开发完成')">立即登录</A>
									</DIV>
									<div class="ui_comment">
										<form action="javascript:void(0);" class="comment_form" id="course_comm_form">
											<div class="comment_textarea">
												<textarea name="" id="comm_content" cols="30" rows="10"></textarea>
											</div>
											<div class="comment_func">
												<div class="comment_tips" id="course_comm_tips">请填写内容，长度在1~140之间</div>
												<input id="course_comm_courseID" name="comm_courseid" type="hidden" value="16094" />
												<div class="comment_button">
													<button style="width: 50px" class="btn btn_submit btn_sky" type="submit" name="comm-submit">评价</button>
												</div>
											</div>
										</form>
									</div>
									<P>&nbsp;</P>
									<DIV id="comm_page_list" class="ui_course_consult"></DIV>
									<DIV id="comm_pages" class="comm_pages" data-url="ajaxPagesUrl" data-pages="0"></DIV>
								</DIV>
								<!-- 课程评价 end -->
							</DIV>
						</DIV>
					</DIV>
					<DIV class="layout_side right w_240 mtop_20">
						<!-- 相关课程-->
						<!-- 浏览过的记录-->
						<DIV class="panel_listen">
							<DIV class="side_header">
								<SPAN>浏览过的课程</SPAN>
							</DIV>
							<DIV class="listen_conten">
								<DIV class="listen_cou">
									<DIV class="ui_avatar">
										<UL class="avatar_items">
											<LI class="ui_userinfo" data-params="userId=559" data-id="559">${course.sxCourse.teacher_name}</LI>
										</UL>
									</DIV>
									<DIV class="cou_detail">
										<DIV class="cou_text">
											<A href="javascript:void(0)" target="_blank">${course.sxCourse.name}</A>
										</DIV>
										<DIV class="cou_info">
											<SPAN><EM class="icon icon_gray_user"></EM>9721 </SPAN><SPAN><EM class="icon icon_thumbs_up"></EM> 9 </SPAN>
										</DIV>
									</DIV>
								</DIV>
								<DIV class="listen_cou border_none">
									<DIV class="ui_avatar">
										<UL class="avatar_items">
											<LI class="ui_userinfo" data-params="userId=757" data-id="757"><A class="userpic" href="javascript:void(0)" target="_blank"><IMG alt="" src=""></A></LI>
										</UL>
									</DIV>
									<DIV class="cou_detail">
										<DIV class="cou_text">
											<A href="javascript:void(0)" target="_blank">四升五年级“畅享语文”成长计划年卡（17-20级）</A>
										</DIV>
										<DIV class="cou_info">
											<SPAN><EM class="icon icon_gray_user"></EM>146 </SPAN><SPAN><EM class="icon icon_thumbs_up"></EM> 32 </SPAN>
										</DIV>
									</DIV>
								</DIV>
								<!-- repeat -->
							</DIV>
						</DIV>
					</DIV>
				</DIV>
				<!-- 听课页下半部份 end -->
			</DIV>
			<!--内容 end-->
			<!-- 引入交互功能切换js -->
			<SCRIPT src="<%=basePath%>/js/xue.page.course.js"></SCRIPT>
			<SCRIPT type="text/javascript">
				xue.use('pages');

				$(document).ready(function() {
					var comUrl = '/web/sxCourseComments/dataList.do';
					var params = 6836;
					createCommList(comUrl, params);
					$('#comm_content').trigger('focus');
				});

				function createCommList(url, params) {
					$
							.ajax({
								url : url,
								type : 'POST',
								dataType : 'json',
								data : {
									courseId : params
								},
								success : function(result) {
									var box = $('#comm_page_list');
									if (result.sign == 1) {
										var tpl = '<div class="cou_com_detail">';
										$('#comm_pages').data({
											'pages' : result.total,
											'url' : url
										});
										$
												.each(
														result.rows,
														function(k, v) {
															tpl += '<div class="comment_detail_list">';
															tpl += '<div class="user_pic">';
															if (v.user_id >= 100000) {
																tpl += '<p class="pic ui_userinfo" data-id="'+v.user_id+'" class="" data-params="userId='+v.user_id+'" ><img width="60" height="70" src="'+v.user.picture+'"></p>';
																tpl += '<p class="name ui_userinfo" data-id="'+v.user_id+'" class="" data-params="userId='+v.user_id+'" title="'+v.user.nick_name+'">'
																		+ v.user.nick_name
																		+ '</p>';
															} else {
																tpl += '<p class="pic"><img width="60" height="70" src="'+v.user.picture+'"></p>';
																tpl += '<p class="name" title="'+v.user.name+'">'
																		+ v.user.nick_name
																		+ '</p>';
															}
															tpl += '<p class="site" title="'+v.user.phone+'">'
																	+ v.user.phone
																	+ '</p>';
															tpl += '</div>';
															tpl += "<div class='user_text_box'>";
															tpl += '<p class="text"> '
																	+ v.content
																	+ '</p>';
															tpl += '<p class="time">'
																	+ v.create_date
																	+ '</p>';
															tpl += '<span class="corner_bg"></span>';
															tpl += '</div>';
															tpl += '</div>';
														});
										tpl += '</div>';
										box.html(tpl);
										xue
												.pages('comm_pages')
												.config(
														{
															pages : result.total,
															current : 1,
															pageNum : 2,
															gotop : false,
															callback : function(
																	current) {
																xue
																		.pages(
																				'comm_pages')
																		.go(
																				current);
																ajaxCommPages(
																		url,
																		params,
																		current);
																$(
																		'#comm_pages li')
																		.off(
																				'click');
															}
														});
									} else {
										//					alert(result.sign);
									}
								}
							});
				}
				//截取中文字符
				function SetString(str, len) {
					var strlen = 0;
					var s = "";
					for (var i = 0; i < str.length; i++) {
						if (str.charCodeAt(i) > 128) {
							strlen += 2;
						} else {
							strlen++;
						}
						s += str.charAt(i);
						if (strlen >= len) {
							return s;
						}
					}
					return s;
				}
				function ajaxCommPages(url, course_id, page) {
					$
							.ajax({
								url : url,
								type : 'POST',
								data : {
									courseId : course_id,
									curpage : page
								},
								dataType : 'json',
								success : function(result) {
									var box = $('#comm_page_list');
									if (result.sign == 1) {
										var tpl = '<div class="cou_com_detail">';
										$
												.each(
														result.rows,
														function(k, v) {
															tpl += '<div class="comment_detail_list">';
															tpl += '<div class="user_pic">';
															if (v.user_id >= 100000) {
																tpl += '<p class="pic ui_userinfo" data-id="'+v.user_id+'" class="" data-params="userId='+v.user_id+'" ><img width="60" height="70" src="'+v.user.picture+'"></p>';
																tpl += '<p class="name ui_userinfo" data-id="'+v.user_id+'" class="" data-params="userId='+v.user_id+'" title="'+v.user.nick_name+'">'
																		+ v.user.nick_name
																		+ '</p>';
															} else {
																tpl += '<p class="pic"><img width="60" height="70" src="'+v.user.picture+'"></p>';
																tpl += '<p class="name" title="'+v.user.name+'">'
																		+ v.user.nick_name
																		+ '</p>';
															}
															//var province = SetString(v[0]['provincename'],6);
															tpl += '<p class="site" title="'+v.user.phone+'">'
																	+ v.user.phone
																	+ '</p>';
															tpl += '</div>';
															tpl += "<div class='user_text_box'>";
															tpl += '<p class="text"> '
																	+ v.content
																	+ '</p>';
															tpl += '<p class="time">'
																	+ v.create_date
																	+ '</p>';
															tpl += '<span class="corner_bg"></span>';
															tpl += '</div>';
															tpl += '</div>';
														});
										tpl += '</div>';
										box.html(tpl);
									} else {
										alert(result.sign);
									}
								}
							});
				}

				$(function() {
					$('#course_comm_form').submit(function() {
						addCourseComm();
					});
				});
				/*
				 * 课程评价
				 */
				function addCourseComm() {

					var content = $.trim($('#comm_content').val());
					var courseId = $.trim($('#course_comm_courseID').val());

					var length = content.length;
					if (length < 1) {
						commError('请填写评价内容，长度在1-140字符之间');
						return false;
					}
					if (length > 140) {
						commError('评价内容长度只能在1-140字符之间');
						return false;
					}
					if (courseId == '') {
						commError('提交失败，请刷新页面后重试');
						return false;
					}
					var _params = "content=" + content + "&courseId="
							+ courseId + '&type=3';
					$
							.ajax({
								type : "post",
								url : '/web/sxCourseComments/save.do',
								dataType : "json",
								timeout : 7000,
								data : _params,
								success : function(data) {
									if (data.stat == 3) {
										window.location.href = 'http://login.xueersi.com/user/login/aHR0cDovL3d3dy54dWVlcnNpLmNvbS9vcGVuLzY4MzYuaHRtbA==';
									} else if (data.stat == 1) {
										$('#comm_content').val('');
										commError(data.msg);
										var comUrl = '/courses/ajaxCommList/';
										var params = 6836;
										createCommList(comUrl, params);

									} else {
										commError(data.msg);
									}
								},
								error : function() {
									alert('数据读取错误..');
								}
							});
				}
				function commError(msg) {
					var _errorBox = $('#course_comm_tips');
					_errorBox.text(msg);
					setTimeout(function() {
						$('#course_comm_tips').text('请填写内容，长度在1~140之间');
					}, 3000);
				}
				/*
				 $(function(){
				 $('#outline1').jScrollPane();
				 $('#outline2').jScrollPane();
				 });
				 */
			</SCRIPT>
			<SCRIPT type="text/javascript">
				$('body').off('click', '.ui_follow').on('click', '.ui_follow',
						function() {
							if ($(this).hasClass('add')) {
								follow(this);
							}
						});
				$('body').off('click', '.ui_follow.follow_cancel a').on(
						'click', '.ui_follow.follow_cancel a', function() {
							var that = $(this).parent();
							follow(that);
						});
				function follow(e) {
					var _url = $(e).data().url;
					var _type = $(e).data().type;
					var _params = $(e).data().params + '&type=' + _type;
					$
							.ajax({
								type : "post",
								url : _url,
								timeout : 7000,
								dataType : 'json',
								data : _params,
								success : function(msg) {
									if (msg.sign == 2) {
										window.location.href = 'http://login.xueersi.com/user/login/aHR0cDovL3d3dy54dWVlcnNpLmNvbS9vcGVuLzY4MzYuaHRtbA==';
									} else if (msg.sign == 1) {
										switch (_type) {
										case 1:
											$(e).removeClass('add');
											$(e).addClass('follow_hidden');
											$(e).html('已关注');
											break;
										case 2:
											$(e).html('<em>+</em>关注');
											$(e).removeClass('follow_cancel');
											$(e).addClass('add');
											$(e).data({
												type : 3
											});
											break;
										case 3:
											$(e)
													.html(
															'<em class="addsucess"></em> 已关注 <i class="line">|</i> <a class="" href="javascript:void(0);">取消</a>');
											$(e).removeClass('add');
											$(e).addClass('follow_cancel');
											$(e).data({
												type : 2
											});
											break;
										}
									} else {
										alert(msg.msg);
									}
								},
								error : function() {
									alert('数据读取错误..');
								}
							});
				}
			</SCRIPT>
		</DIV>
		<!--内容 end-->
		<SCRIPT src=""></SCRIPT>
		<!--底部 start -->
		<jsp:include page="footer_share.jsp" /><!--底部 end-->
</BODY>
</HTML>

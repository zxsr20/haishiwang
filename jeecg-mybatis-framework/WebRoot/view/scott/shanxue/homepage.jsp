<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0023)http://www.xueersi.com/ --><HTML><HEAD>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/view/resource1.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<META content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<META name="keywords" content="名师课堂,网校,课外辅导,网络教育,远程教育">
<META name="description" content="海事公开课"><TITLE>海事公开课</TITLE><LINK 
rel="stylesheet" type="text/css" href="<%=basePath%>/css/page_index.css"><LINK 
rel="shortcut icon" href="http://img04.xesimg.com/favicon.ico">
<SCRIPT src="<%=basePath%>/js/commons/jquery.min.js"></SCRIPT>
<SCRIPT src="<%=basePath%>/js/xue.js"></SCRIPT>

<SCRIPT type="text/javascript">var FD_NAME='xesindex';</SCRIPT>

<SCRIPT src="<%=basePath%>/js/xes_stat.js"></SCRIPT>
<!--[if lt IE 9]> 
	<link href="http://css04.xesimg.com/ie_project.css?1406189952" type="text/css" rel="stylesheet" />	
	<link href="http://css04.xesimg.com/ie_header.css?1406189952" type="text/css" rel="stylesheet" />	
	<![endif]-->
<META name="GENERATOR" content="MSHTML 9.00.8112.16441"></HEAD>
<BODY><!--头部  start-->
<DIV id="header" class="index_header">
<SCRIPT>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?132892c1e29576ee62b12b0f551e37ce";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</SCRIPT>

<input name="userid" type="hidden" value="${userid}" >
<input name="username" type="hidden" value="${username}" >
<!--头部  start id#header 登录后有广告高度为144-->
<jsp:include page="head_share.jsp"/>
<DIV id="headnav">
<UL>

<c:forEach items="${coursetype}" var="user"
								varStatus="status">
								
								<c:if test="${status.index == 0}">
									<LI  class="firstClass "><A href="newlist.do?type_code=${user.type_code}" xes_id="gradenav_xiaoyi"><c:out value="${user.name}" /></A></LI>
								</c:if>
								
								<c:if test="${status.index > 0}">
									<LI><A href="newlist.do?type_code=${user.type_code}" xes_id="gradenav_xiaoyi"><c:out value="${user.name}" /></A></LI>
								</c:if>
								
								
								
							</c:forEach>


  </UL></DIV><!-- 内容 start-->
<DIV id="container"><!-- 登录部分 -->
<DIV class="index_login">

<c:if test="${empty userid}">
  <FORM id="form_indexlogin" class="login_from" method="POST" action="../sxUserInfo/sx_login_webpage.do" 
autocomplete="off">
<DIV class="login_input">
<P><INPUT id="username" class="input_text" name="username" size="20" type="text" 
placeholder="用户名/邮箱" autocomplete="off" disableautocomplete=""></P>
<P><INPUT id="password" class="input_text " name="password" size="20" type="password" 
placeholder="密码"></P>
<P><LABEL><INPUT id="savename" name="savename" CHECKED="checked" 
type="checkbox">记住用户名			</LABEL><SPAN class="pass"><A href="javascript:void(0)" 
xes_id="_findPassword">忘记密码？</A></SPAN><SPAN><A href="javascript:void(0)" 
xes_id="_register">立即注册！</A></SPAN></P>
<P class="btn_func"><SPAN class="btn_wrap btn_wrap_orange"><BUTTON id="loginsubmit" 
class="btn btn_submit" name="submit" type="submit" xes_id="_login">登 
录</BUTTON></SPAN></P></DIV>
<DIV class="login_infor">
<P class="infor_app"><A class="app_qq" href="#" 
xes_id="_qqLogin">QQ账号登录</A><A class="app_weibo" href="#" 
xes_id="_sinaLogin">新浪微博登录</A><A class="app_ed" href="#" 
xes_id="_eduuLogin">e度网登录</A></P>
<P 
class="infor_text"><STRONG>1059899</STRONG>个家庭选择网校<STRONG>　176727</STRONG>节视频课程
		</P>
<P 
class="infor_text"><STRONG>免费</STRONG>学习课程<STRONG>第一讲</STRONG>&nbsp;&nbsp;&nbsp;&nbsp;<STRONG>7天</STRONG>学习2讲内<STRONG>无理由退课</STRONG></P></DIV>
</FORM>
<SCRIPT type="text/javascript">
$(function(){
	if (!xue.isIE) {
		$("#password").attr("type" , "text");
		$("#password").focus(function(){
		  $(this).attr("type" , "password");
		});
	};
	
});
</SCRIPT>

<SCRIPT type="text/javascript">
   function toLeningCenter(){
    	alert(1);
    window.location.href = "mycollect.do";
    }
</SCRIPT>
</c:if>

<c:if test="${not empty userid}">
  <div class="login_finish">
				<div class="finish_user_info">
					<div class="avatar_item">
						<span class="avatar_pic" xes_id="_myHeadImg">
							<a title="点击更换头像" href="/MyHeadImg/show/">
								<img alt="" src="http://img04.xesimg.com/avatar/user_0.png"></a>
						</span>
						<span class="avatar_info">
							<p><a xes_id="_learningCenter1" href="/LearningCenter/">${username}</a></p>
							<p class="user_level">
								<span title="学习课程获得学力值，学力值越高，等级越高。">学力等级</span>
								<span class="icon_level" title="等级:1,距离下次升级还需1000学力">
									<img src="http://img04.xesimg.com/level/lv_1.png" alt=""></span>
							</p>
						</span>
					</div>
					<ul class="user_count">
						<li>
                            <a href="/LearningCenter/" xes_id="_learningCenter2">
									<span>0</span>
									<p>我的课程</p>
							</a>
							 
						</li>
						<li>
							<a href="/LearningCenter/follow" xes_id="_myFollow">
									<span>9</span>
									<p>关注的人</p>
							</a>
							
						</li>
						<li class="last">
							<a href="/MyPayCenters/goldLog/" xes_id="_myGold">
									<span>20</span>
									<p>我的金币</p>
							</a>
							
						</li>
					</ul>
					<div class="btn_func">
						<span class="btn_wrap btn_wrap_orange">
							<button xes_id="_learningCenter3" class="btn btn_submit" name="submit" id="loginsubmit" onclick="window.location.href = 'mycollect.do';">进入我的网校</button>
						</span>
					</div>
				</div>
				<div class="finish_user_task">
					<h3>学习任务</h3>
					<ul>
                                                    <li xes_id="_mySign"><a href="javascript:void(0)" class="task_1 classcard" data-day="0" data-gold="0"><span class="serialday"></span></a></li>
                        						
						<li xes_id="_myFiveQue" class="task_five" data-right_num="0" data-status="0">
															<!--答对题数小于5-->
								<div class="task_con ">
									<span class="task_days">5</span>
									<p>每日五题</p>
								</div>
													</li>
						<li><span class="task_3"></span></li>
					</ul>
				</div>
			</div>
</c:if>


</DIV><!-- 登录部分  --><!-- 首页轮播广告图 -->
<DIV id="index_focus" xes_id="_topPic">
<UL class="focus_list">
  <LI style='z-index: 3; opacity: 1; background-image: url("http://s04.xesimg.com/web/2014/07/22/14060203939061.jpg");'><A 
  href="#" 
  target="_blank">直播辅导</A></LI>
  <LI style='background-image: url("http://x03.xesimg.com/web/2014/07/23/14060785564339.jpg");'><A 
  href="#" 
  target="_blank">集思堂读书笔记活动</A></LI>
  <LI style='background-image: url("http://r04.xesimg.com/web/2014/07/17/14055815778211.jpg");'><A 
  href="#" 
  target="_blank">截图大赛首页大图</A></LI>
  <LI style='background-image: url("http://r01.xesimg.com/web/2014/07/13/14052187815609.jpg");'><A 
  href="#" 
  target="_blank">初一汇总</A></LI>
  <LI style='background-image: url("http://s03.xesimg.com/web/2014/07/24/14061687464037.jpg");'><A 
  href="#" 
  target="_blank">201140724欢乐暑假首页大图</A></LI>
  <LI style='background-image: url("http://s03.xesimg.com/web/2014/07/25/14062810265499.jpg");'><A 
  href="#" 
target="_blank">头条</A></LI></UL>
<DIV class="focus_num_wrap">
<OL class="focus_num">
  <LI class="current">1</LI>
  <LI>2</LI>
  <LI>3</LI>
  <LI>4</LI>
  <LI>5</LI>
  <LI>6</LI></OL></DIV></DIV><!-- 首页轮播广告图  end-->
<DIV class="layout">
<DIV class="layout_body left w_655"><!--		<div class="main_header border_blue w_645">
			
		</div>-->
<DIV id="index_dyn" class="content_box w_645">
<DIV class="index_new_title"><SPAN>热门课程</SPAN></DIV>

<!-- 最新学习小组 --><!-- 最新课程 -->
<div class="index_new_content" xes_id="_hotCourse">
															<div class="course_item_repeat" style="display: block;">
															
															<c:forEach items="${recommandcourse}" var="recommand"
																varStatus="status">
								
																
								
								<div class="course_item">
																					<div class="ui_avatar">
												<ul class="avatar_items">
																																										<li data-id="349" class="ui_userinfo" data-params="userId=349">
																<a href="newdetail.do?course_id=${recommand.id}" class="userpic" target="_blank">
																	<img src="${recommand.picture}" alt="">
																</a>
																<a href="#" class="username" target="_blank">
																	${recommand.teacher_name}														</a>
															</li>
																																							</ul>
																							</div>
																				<div class="course_detail">
											<p class="course_title">
												<em>海事</em>
												<a href="newdetail.do?course_id=${recommand.id}" target="_blank" title="2014新一年级奥数年卡（竞赛班）">
													<c:out value="${recommand.name}" /><strong></strong>
												</a>
											</p>
											<p class="course_info">
												<span>
																																																授课老师：
																																										<a href="javascript:void(0)" target="_blank">史乐</a>
																																							</span>
												<span class="num_videos"> 试听：<strong>56901</strong>
												</span>	
											</p>
										</div> 
									</div>
								
															</c:forEach>
															
															
																								
																<div class="indexMore"><a href="newlist.do">更多&gt;&gt;</a></div>
													</div>
											
																
													</div>
												</div><!--最新免费课  -->
<DIV class="index_new_title"><SPAN>推荐老师</SPAN></DIV>
<!-- 最新学习小组 --><!-- 最新课程 -->
<div class="index_new_content" xes_id="_hotCourse">
															<div class="course_item_repeat" style="display: block;">
															
															<c:forEach items="${recommandcourse}" var="recommand"
																varStatus="status">
								
																
								
								<div class="course_item">
																					<div class="ui_avatar">
												<ul class="avatar_items">
																																										<li data-id="349" class="ui_userinfo" data-params="userId=349">
																<a href="newdetail.do?course_id=${recommand.id}" class="userpic" target="_blank">
																	<img src="${recommand.picture}" alt="">
																</a>
																<a href="#" class="username" target="_blank">
																	${recommand.teacher_name}														</a>
															</li>
																																							</ul>
																							</div>
																				<div class="course_detail">
											<p class="course_title">
												<em>海事</em>
												<a href="newdetail.do?course_id=${recommand.id}" target="_blank" title="2014新一年级奥数年卡（竞赛班）">
													<c:out value="${recommand.name}" /><strong></strong>
												</a>
											</p>
											<p class="course_info">
												<span>
																																																授课老师：
																																										<a href="javascript:void(0)" target="_blank">史乐</a>
																																							</span>
												<span class="num_videos"> 试听：<strong>56901</strong>
												</span>	
											</p>
										</div> 
									</div>
								
															</c:forEach>
															
															
																								
																<div class="indexMore"><a href="newlist.do">更多&gt;&gt;</a></div>
													</div>
											
																
													</div>
												</div><!--最新免费课  -->
<!-- 推荐老师 --></DIV><!--		<div id="index_dyn" class="content_box w_645">
		</div>--></DIV>
		
<DIV class="layout_side right w_310">
<DIV class="side_tabs_handle" xes_id="_youzhong">
<UL class="tabs_trends">
  <LI>						07月推荐课程					</LI>
  <LI class="current">						活动资讯					</LI></UL>
<DIV class="side_tab_body">
<UL class="ui_list index_notice">
  <LI><I></I><A href=javascript:void(0) 
  target="_blank">【必修1】预习领先班助你争当王牌！</A></LI>
  <LI><I></I><A href=javascript:void(0) 
  target="_blank"><FONT color="#ff0000">【小学】8月18日止老学员续报秋季班8.1折优惠</FONT></A></LI>
  <LI><I></I><A href="javascript:void(0)" 
  target="_blank"><FONT color="#ff0000">【初中】《中国成语大会》—成语课程</FONT></A></LI>
  <LI><I></I><A href=javascript:void(0) 
  target="_blank">【热点推荐】北京重点中学新初一分班考冲刺课程</A></LI>
  <LI><I></I><A href=javascript:void(0) 
  target="_blank">【热点推荐】人教/北师大/苏教版课内数学满分班</A></LI>
  <LI><I></I><A href=javascript:void(0) 
  target="_blank">【决战高三】高考一轮总复习，助你决战高三巅</A></LI></UL>
<UL style="display: block;" class="ui_list index_notice">
  <LI><I></I><A href=javascript:void(0) target="_blank">【三年级必看】计算不枯燥 
  每天一练最重要<FONT color="#ff0000"></FONT></A></LI>
  <LI><I></I><A href=javascript:void(0) target="_blank"><FONT 
  color="#ff0000">【新初一】这个暑假怎么过？假期热门活动汇总</FONT></A></LI>
  <LI><I></I><A href=javascript:void(0) target="_blank">【灰灰最强大脑】排列组合终结者今晚19点开始</A></LI>
  <LI><I></I><A href=javascript:void(0) 
  target="_blank"><FONT color="#ff0000"> 
【小学】2014年1-6年级语数英新学年学习规划</FONT></A></LI>
  <LI><I></I><A href=javascript:void(0) target="_blank">【每周四报名】女神顾斐带你刷高考英语题</A></LI>
  <LI><I></I><A href=javascript:void(0) target="_blank"><FONT 
  color="#ff0000">【小学】2014年1-6年级暑假班入学测试题</FONT></A></LI></UL></DIV></DIV>
<DIV class="panel" xes_id="_youtu">
<DIV class="side_body">
<DIV class="advert img_310_110" title="2014年小学秋季班上线"><A href=javascript:void(0) 
target="_blank"><IMG 
src=""></A></DIV></DIV>
<DIV class="side_body">
<DIV class="advert img_310_110" title="初中秋季班"><A href=javascript:void(0) 
target="_blank"><IMG 
src=""></A></DIV></DIV>
<DIV class="side_body">
<DIV class="advert img_310_110" title="自招课程上线【首页右侧小图】"><A href=javascript:void(0) 
target="_blank"><IMG 
src=""></A></DIV></DIV>
<DIV class="side_body">
<DIV class="advert img_310_110" title="20140421上海新课程上线310X84 (2)"><A href=javascript:void(0) 
target="_blank"><IMG 
src=""></A></DIV></DIV></DIV>
</DIV>
</DIV>
<SCRIPT type="text/javascript">
	function getStyle(obj, attr){
		return obj.currentStyle?obj.currentStyle[attr]:getComputedStyle(obj, false)[attr];
	}

	function startMove(obj, json, fn){
		clearInterval(obj.timer);
		obj.timer=setInterval(function (){
			doMove(obj, json, fn);
		}, 30);
	}

	function doMove(obj, json, fn){
		var attr='';
		var iCur=0;
		var iStop=0;
	
		for(attr in json){
			if(attr=='opacity'){
				iCur=parseInt(parseFloat(getStyle(obj, attr))*100);
			}else{
				iCur=parseInt(getStyle(obj, attr));
			}
			var iSpeed=(json[attr]-iCur)/8;
			iSpeed=iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);
			if(iCur!=json[attr]){
				iStop++;
				if(attr=='opacity'){
					obj.style.filter='alpha(opacity:'+(iCur+iSpeed)+')';
					obj.style.opacity=(iCur+iSpeed)/100;
				}else{
					obj.style[attr]=iCur+iSpeed+'px';
				}
			}
		}
		if(iStop==0) {
			clearInterval(obj.timer);
			if(fn) {
				fn();
			}
		}
	}

	function play() {
		var oDiv=document.getElementById('index_focus');
		var oOl=oDiv.getElementsByTagName('ol')[0];
		var oUl=oDiv.getElementsByTagName('ul')[0];
		var aLiBtn=oOl.getElementsByTagName('li');
		var aLiAds=oUl.getElementsByTagName('li');
		var iNow=0;
		var timer=null;
		var i=0;
	
		for(i=0;i<aLiBtn.length;i++) {
			aLiBtn[i].index=i;
			aLiBtn[i].onmouseover=function(){
				iNow=this.index;
				tab();
			};
		}
	
		function tab(){
			for(i=0;i<aLiBtn.length;i++){
				aLiBtn[i].className='';
				startMove(aLiAds[i], {opacity:0});
				aLiAds[i].style.zIndex=2;//层级加在这里
			}
			aLiAds[iNow].style.zIndex++;//和这里
			aLiBtn[iNow].className='current';
			startMove(aLiAds[iNow], {opacity:100});
		}
		oDiv.onmouseover=function (){
			clearInterval(timer);
		};
	
		oDiv.onmouseout=function ()	{
			timer=setInterval(function (){
				iNow=(iNow+1)%aLiBtn.length;
				tab();
			}, 4000);
		};
		oDiv.onmouseout();
	}
	play();
</SCRIPT>

<SCRIPT type="text/javascript">			$('body').off('click', '.ui_follow').on('click', '.ui_follow', function(){
			    if($(this).hasClass('add')){
					follow(this);
				}
			});
			$('body').off('click', '.ui_follow.follow_cancel a').on('click', '.ui_follow.follow_cancel a', function(){
			    var that = $(this).parent();
				follow(that);		
			});
			function follow(e){
				var _url = $(e).data().url;
				var _type = $(e).data().type;
				var _params = $(e).data().params + '&type=' + _type;
				$.ajax({
					type: "post",
						url: _url,
						timeout: 7000,
						dataType: 'json',
						data: _params,
						success: function(msg) {
							if (msg.sign == 2) {
								window.location.href='http://login.xueersi.com/user/login/aHR0cDovL3d3dy54dWVlcnNpLmNvbS8=';
							}else if(msg.sign == 1) {
								switch(_type){
									case 1:
										$(e).removeClass('add');
										$(e).addClass('follow_hidden');
										$(e).html('已关注');
										break;
									case 2:
										$(e).html('<em>+</em>关注');
										$(e).removeClass('follow_cancel');
										$(e).addClass('add');
										$(e).data({type:3});
										break;
									case 3:
										$(e).html('<em class="addsucess"></em> 已关注 <i class="line">|</i> <a class="" href="javascript:void(0);">取消</a>');
										$(e).removeClass('add');
										$(e).addClass('follow_cancel');
										$(e).data({type:2});
										break;
								}
							}else{
								alert(msg.msg);
							}
						},
						error: function() {
							alert('数据读取错误..');
						}
				});
			}</SCRIPT>
	</DIV><!--内容 end-->
<SCRIPT src=""></SCRIPT>
<!--底部 start -->
<jsp:include page="footer_share.jsp"/></BODY></HTML>

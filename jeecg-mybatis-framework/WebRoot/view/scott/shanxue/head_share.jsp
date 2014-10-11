<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<DIV class="header_menu">
<DIV class="xrs"><A href="#" 
target="_black">国内最大的海事学习平台</A></DIV>
<DIV class="phone_400">
<DIV class="white_cover"></DIV>
<DIV class="layer_head"></DIV></DIV>
<UL class="loginbar topbar">

  <c:if test="${empty userid}">
  <LI class="login"><SPAN><A href="../sxUserInfo/newlogin.do" 
  xes_id="top_login">登录</A></SPAN></LI>
  <LI class="register"><SPAN><A href="../sxUserInfo/newregister.do" 
  xes_id="top_register">注册</A></SPAN></LI>
  <LI><SPAN><A href="#" target="_blank" 
  xes_id="myCart">购物车</A></SPAN></LI>
  <LI class="settsings"><SPAN><A href="#" 
  target="_blank" xes_id="recharge">充值</A></SPAN></LI>
 
  
  <LI xes_id="yidongban"><SPAN><A href="http://bcs.duapp.com/lvyou02/android-haishi.apk" target="_black">移动版</A></SPAN></LI>
  <DIV class="layer_head">
  </c:if>
  <c:if test="${not empty userid}">
     
  <LI class="register"><SPAN><A href="mycollect.do" 
  xes_id="top_register"><c:out value="${username}"/></A></SPAN></LI>
  <LI><SPAN><A href="#" target="_blank" 
  xes_id="myCart">购物车</A></SPAN></LI>
  <LI class="settsings"><SPAN><A href="#" 
  target="_blank" xes_id="recharge">充值</A></SPAN></LI>
  
  
  <LI xes_id="yidongban"><SPAN><A href="http://pan.baidu.com/s/1c04EemW" target="_black">移动版</A></SPAN></LI>
  <LI class="settsings" xes_id="mianshou">
  
  <DIV class="layer_head">
  </c:if>

  
 </DIV></LI></UL></DIV><!-- ad start -->
<DIV class="header_picture"><IMG border="0" src="" 
useMap="#Map2"><MAP id="Map2" name="Map2"><AREA href="http://zt.xueersi.com/2014xiaoxueshuqibanhuizongye/" 
  shape="rect" target="_blank" coords="770,15,830,45" xes_id="_ad1"><AREA href="http://zt.xueersi.com/2014chuzhongshuqibanhuizongye/" 
  shape="rect" target="_blank" coords="835,15,895,45" xes_id="_ad2"><AREA href="http://zt.xueersi.com/2014gaozhongqiujibanhuizongye/" 
  shape="rect" target="_blank" coords="900,15,960,45" xes_id="_ad3"></MAP><A 
class="close" href="javascript:void(0);">关闭</A>
<SCRIPT type="text/javascript">//此处必须要，请勿删除
				if(xue.isIE && !xue.isIE9 && !xue.isIE10){
					$('body').css('padding-top', 144);
					$('#header').css('height',162);
				}else{
					$('#header').css('height',144);
				}
				$(function(){

				       	$('.header_picture a.close').click(function() {
				       		$('#header').removeAttr('style');
				       		$('body').removeAttr('style');
				       		$(this).parent().hide();//隐藏广告图
				       		xue.clearEndTime();
				       	});
				       	xue.updateEndTime('.settime');//执行倒计时函数
				  });

			</SCRIPT>
</DIV><!-- ad end -->
<DIV class="header_box">
<H1 class="logo"><A href="newhome.do">学而思网校</A></H1>
<UL class="navs">
  <LI class="homes" xes_id="nav_index"><A id="index" class="current" href="newhome.do">首页</A></LI><!--				<li class="course" xes_id="nav_findCourse">
					<a href="javascript:void(0);" >选课程</a>
					<div class="layer_head_menu">
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">一年级</a>
							</span>							
						</div>
						<div class="GradeMenu ">
							<span class="GradTitle">
								<a href="javascript:void(0)">二年级</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">三年级</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">四年级</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">五年级</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">六年级</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">初一</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">初二</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">初三</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">高一</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">高二</a>
							</span>
						</div>
						<div class="GradeMenu">
							<span class="GradTitle">
								<a href="javascript:void(0)">高三</a>
							</span>
						</div>

					</div>
				</li>-->
  <LI xes_id="nav_openCourse"><A 
  href="#">公开课</A></LI>
  <LI xes_id="nav_findTeacher"><A 
  href="#">找老师</A></LI>
 
  <LI><A href="#" target="_blank">逛论坛</A></LI></UL>
<DIV class="search">
<FORM method="GET" name="search" action="newlist.do"><INPUT 
accessKey="s" id="mq" class="head_top_search" tabIndex="9" name="name" type="text"  value="${name}"
placeholder="搜索：课程/老师" autocomplete="off"><BUTTON class="head_btn_search" type="submit" 
xes_id="search">搜索</BUTTON></FORM></DIV></DIV><!-- 头部 end-->	</DIV><!-- 头部 end-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<TITLE>${course.sxCourse.name}</TITLE>
<%@include file="/view/resource.jsp"%>
<SCRIPT src="<%=basePath%>/js/jquery-1.7.2.min.js"
	type="text/javascript" charset="UTF-8"></SCRIPT>
<SCRIPT src="<%=basePath%>/js/ajaxUtils.js" type="text/javascript"
	charset="UTF-8"></SCRIPT>
<SCRIPT src="<%=basePath%>/js/interact.js" type="text/javascript"
	charset="UTF-8"></SCRIPT>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/public.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/wasu_mobile.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/mheader.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/grid_phone.css">
</HEAD>

<BODY onload="initInteract();">
	<DIV class="header-lock">
		<INPUT id="root" type="hidden"
			value="http://test.tv2.wasu.cn:8080/templates/freewap/runtime/wasutvh5">

		<INPUT id="isLogin" type="hidden"> <INPUT
			id="interact_user_id" type="hidden"> <INPUT
			id="system_user_id" type="hidden"
			value="RDWS_3GZX_IPS_C01_2139763080687826"> <INPUT
			id="success" type="hidden"
			value="http://test.tv2.wasu.cn:8080/folder,freewap,RDWS_3GZX_IPS_C01_2139763080687826,42702.page">

	</DIV>
	<INPUT id="currentAssetId" type="hidden" value="12753389">
	<INPUT id="resname" type="hidden" value="阳光橱窗">

	<INPUT id="backToIndexUrl" type="hidden"
		value="http://test.tv2.wasu.cn:8080/folder,freewap,RDWS_3GZX_IPS_C01_2139763080687826,42702.page">

	<INPUT id="assetUrl" type="hidden"
		value="http://test.tv2.wasu.cn:8080/a?t=37&amp;u=RDWS_3GZX_IPS_C01_2139763080687826&amp;f=42702&amp;a=12753389&amp;profile=wasutvh5">

	<INPUT id="currentAssetName" type="hidden"
		value="%E9%98%B3%E5%85%89%E6%A9%B1%E7%AA%97">

	<DIV class="TVplayDetail_videoBox wasu-m">

		<DIV id="videoTabnav">

			<TABLE id="v_tabNav" border="0" cellspacing="0" cellpadding="0">

				<TBODY>

					<TR>

						<TD id="v_tabNav_1" onclick="switchv_tabNav(1)">简介</TD>

						<TD class="on" id="v_tabNav_2" onclick="switchv_tabNav(2)">剧集</TD>

						<TD  style="display:none"><A
							href="http://124.160.28.38:90/province/dingzhi/videostore.apk"><IMG
								class="downloadIcon"
								src="<%=basePath%>/images/v_tabNav_downIcon.gif">下载</A></TD>

						<TD class="share_More"><IMG
							src="<%=basePath%>/images/v_tabNav_moreIcon.gif"></TD>
					</TR>
				</TBODY>
			</TABLE>

			<DIV class="share_Hidden">
				<SPAN class="share01"><A id="ding"></A></SPAN>
				<!--
		<span class="share02"><a id="favorite"></a></span>
	-->

				<SPAN class="share03"><A class="on" id="share"
					onclick="actInteract('share')"></A></SPAN>

			</DIV>

			<DIV id="v_tabCon">

				<DIV id="v_tabCon_1" style="display: none;">

					<H3>${course.sxCourse.name}</H3>


					<P>
						<SPAN>老师：</SPAN> <SPAN>${course.sxCourse.teacher_name}</SPAN>
					</P>

					<P>
						<SPAN>顶：</SPAN><SPAN>${course.sxCourse.peak}</SPAN>
					</P>

					<P>
						<SPAN>踩：</SPAN><SPAN>${course.sxCourse.tread} </SPAN>
					</P>

					<P>
						<SPAN>简介：</SPAN> <SPAN>${course.sxCourse.description} </SPAN>
					</P>
				</DIV>

				<DIV id="v_tabCon_2" style="display: block;">

					<DIV class="nav_select clear" style="display: block;">

						<DIV class="select_box" style="display: block;">
							<SPAN class="select_txt">1-<c:out
									value="${fn:length(course.sxPrograms)}"></c:out></SPAN><A
								class="selet_open"><IMG
								src="<%=basePath%>/images/select_txt.gif"></A>



							<DIV class="option">
								<A>1-<c:out value="${fn:length(course.sxPrograms)}"></c:out>
								</A>
							</DIV>
						</DIV>
						<INPUT id="select_value" type="hidden"> <INPUT
							id="pageSize" type="hidden" value="50"> <INPUT
							id="videoAssetId" type="hidden" value="12746673">

					</DIV>

					<TABLE>

						<TBODY>
							<c:forEach items="${course.sxPrograms}" var="user"
								varStatus="status">
								<c:if test="${(status.index+1) % 1 == 1}">
									<tr>
								</c:if>
								<TD>
								
								<a href="<%=basePath%>/sxCourse/course_detail.do?courseid=${user.course_id}&programid=${user.id}"  <c:if test="${(course.programid == null&&status.index == 0) || user.id == course.programid}">class="tabCon_cur"</c:if>>
								   <c:out value="${user.name}" />
								</a>
								
								
								</TD>
								<c:if test="${(status.index+1) % 1 == 0}">
									</tr>
								</c:if>
							</c:forEach>



						</TBODY>
					</TABLE>
					
					<input id="next" name="next_url" type ="hidden" value="${course.next_url}">
				</DIV>
			</DIV>
		</DIV>

		<SCRIPT type="text/javascript" charset="UTF-8">
			

			/**
			 *客户端调用，获取当前内容的播地址
			 */
			function geturl() {
				var url = "http://bcs.duapp.com/lvyou02/%E7%88%B1%E5%9C%A8%E6%97%A5%E8%90%BD%E9%BB%84%E6%98%8F%E6%97%B6.mp4?sign=MBO:dwwUAlsAtKVdt9a9xdpYTG6f:QOiFkbzz3yFXjHSwnDJHs80Jc68%3D";

				var course_name = "${course.sxCourse.name}";
				//获取当前播放的集数
				var select = "${course.programid}";
				
				var play_url = "${course.play_url}";
				//alert(select);
				//alert(url);
				//返回当前播放集数、及本集播放地址
				window.demo.getfirstplayurl(course_name,select, play_url);
			}
			
			//$(document).ready(function(){
			//	alert(11111);
			//	geturl();
			//	});
		</SCRIPT>

	</DIV>

	<SCRIPT src="<%=basePath%>/js/iscroll.js" type="text/javascript"
		charset="UTF-8"></SCRIPT>



	<SCRIPT src="<%=basePath%>/js/mnav.js" type="text/javascript"
		charset="UTF-8"></SCRIPT>

	<FOOTER></FOOTER>

	<SCRIPT src="<%=basePath%>/js/fixbar.js" type="text/javascript"
		charset="UTF-8"></SCRIPT>



	<SCRIPT src="<%=basePath%>/js/public.js" type="text/javascript"
		charset="UTF-8"></SCRIPT>



	<SCRIPT type="text/javascript">
		$(function() {
			$(".backToTop").goToTop();
			$(window).bind('scroll resize', function() {
				$(".backToTop").goToTop({
					pageWidth : 520,//页面宽度
					pageWidthJg : 0,//按钮和页面的间隔距离,默认为0
					pageHeightJg : 0,//按钮和页面底部的间隔距离，默认为100
					startline : 400,//出现回到顶部按钮的滚动条scrollTop距离，默认为400
					duration : 200,//回到顶部的速度时间，默认为200ms
				});
			});
		});
	</SCRIPT>

</BODY>
</HTML>


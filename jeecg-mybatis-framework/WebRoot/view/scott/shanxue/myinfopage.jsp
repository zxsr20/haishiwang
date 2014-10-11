<!DOCTYPE html>
<!-- saved from url=(0038)http://www.xueersi.com/LearningCenter/ -->
<html><head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/view/resource1.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
<!--	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
	<title>我的首页-我的网校</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<link href="<%=basePath%>/css/page_home.css" type="text/css" rel="stylesheet">
	<link href="<%=basePath%>/css/style.css" type="text/css" rel="stylesheet">
	<link href="http://img04.xesimg.com/favicon.ico" rel="shortcut icon">
	<script type="text/javascript" async="" src="<%=basePath%>/js/ga.js"></script><script src="./我的首页-我的网校_files/hm.js"></script><script src="./我的首页-我的网校_files/xue.jquery.min.js"></script>
	<script src="<%=basePath%>/js/xue.js"></script>
	<!--[if lt IE 9]> 
	<link href="http://css04.xesimg.com/ie_project.css?1409224270" type="text/css" rel="stylesheet" />	
	<link href="http://css04.xesimg.com/ie_header.css?1409224270" type="text/css" rel="stylesheet" />
	<![endif]-->
<script async="" type="text/javascript" src="<%=basePath%>/js/xue.feedback.min.js"></script></head>

<body>
	<!--头部  start-->
	<div id="header">
		<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?132892c1e29576ee62b12b0f551e37ce";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

<!--头部  start id#header 登录后有广告高度为144-->
		<div class="header_menu">
			<div class="xrs"><a href="http://www.100tal.com/gywm/aboutus/" target="_black">美国纽交所上市教育公司：XRS</a></div>
			<div class="phone_400">
				<div class="white_cover"></div>
				<div class="layer_head"></div>
			</div>
                        			<ul class="loginbar">
				<li class="homes" xes_id="learningCenter"><span><a href="./我的首页-我的网校_files/我的首页-我的网校.htm">我的网校</a></span></li>
				<li>
					<span>
						<a target="_blank" xes_id="myCart" href="javascript:void(0)">购物车</a>
						  					</span>
				</li>
				<li class="settsings">
					<span>
						<a href="javascript:void(0)" xes_id="recharge" target="_blank">充值</a>
					</span>
				</li>
                <li xes_id="cardActivation">
					<p>卡激活</p>
					<div class="layer_head">
						<ul>
							<li>
								<a href="javascript:void(0)">代金卡</a>
							</li>
							<li>
								<a href="javascript:void(0)">听课证</a>
							</li>
							<li>
								<a href="javascript:void(0)">课程绑定卡</a>
							</li>
						</ul>
					</div>
				</li>
				<li class="tips" xes_id="systemTips">
					<p>
                        通知
                                                <em class="icon icon_new">新消息</em>
                                            </p>

					<div class="layer_head ui_topbar_pop">
						<ul class="msg_tips">
							<li data-type="1">
								<a href="javascript:void(0)">网校通知<strong>(2)</strong></a>
							</li>
							<li data-type="4">
								<a href="javascript:void(0)">教师留言</a>
							</li>
							<li data-type="3">
								<a href="javascript:void(0)">直播提醒</a>
							</li>
							<li data-type="5">
								<a href="javascript:void(0)">考试提醒</a>
							</li>
							<li data-type="2">
								<a href="javascript:void(0)">资料提醒</a>
							</li>
						</ul>
					</div>

				</li>
				<li class="settsings" xes_id="mySettsings">
					<p>设置</p>
					<div class="layer_head">
						<ul>
							<li>
								<a href="javascript:void(0)">个人设置</a>
							</li>							
							<li class="exit">
								<a href="javascript:void(0)">退出</a>
							</li>
						</ul>
					</div>
				</li>
					<li class="jiazhanghui">
                                    <p class="mobile_nav">
                                            <a>手机版</a>
                                            <span class="new_icon">new</span>
                                    </p>
                                    <div class="layer_head">
                                            <div class="first_down_title"></div>
                                            <div class="download_mod top">
                                                    <div class="down_qcode j_down"></div>
                                                    <div class="down_btn">
                                                            <p class="download_title style1">
                                                                    家长会
                                                            </p>
                                                            <a href="https://itunes.apple.com/us/app/jia-zhang-hui-xue-er-si-wang/id896405406?l=zh&ls=1&mt=8" target="_blank">
                                                                    <img src="./我的首页-我的网校_files/iphone_download.png" alt="iphone家长会">
                                                            </a>
                                                            <a href="http://jzh.xueersi.com/QrcodeJump/getJumpLink/">
                                                                    <img src="./我的首页-我的网校_files/and_download.png" alt="安卓家长会">
                                                            </a>
                                                    </div>
                                            </div>
                                            <div class="download_mod down">
                                            <div class="down_qcode a_down"></div>
                                                    <div class="down_btn">
                                                            <p class="download_title style2">
                                                                爱学会
                                                            </p>
                                                            <a href="https://itunes.apple.com/cn/app/ai-xue-hui/id908913029?mt=8" target="_blank">
                                                                <img src="./我的首页-我的网校_files/iphone_download.png" alt="iphone爱学会">
                                                            </a>
                                                            <a href="http://axh.xueersi.com/QrcodeJump/getJumpLink/">
                                                                <img src="./我的首页-我的网校_files/and_download.png" alt="安卓爱学会">
                                                            </a>
                                                    </div>
                                            </div>
                                    </div>
				</li>
							
				<li xes_id="yidongban"><span><a href="http://zt.xueersi.com/ipad/" target="_black">iPad版</a></span></li>
                                <li class="settsings" xes_id="mianshou">
					<p>面授</p>
					<div class="layer_head">
						<ul>
							<li>
								<a href="http://www.speiyou.com/" target="_black">小班</a>
							</li>
							<li>
								<a href="http://www.jiajiaoban.com/" target="_black">1对1</a>
							</li>
						</ul>
					</div>
				</li>
			</ul>
            <!--	有数据则输出 start-->
		 
					</div>
		<!-- ad start -->
        


        <!-- ad end -->
		<div class="header_box">
			<h1 class="logo">
                <a href="javascript:void(0)">学而思网校</a>
			</h1>
			<ul class="navs">
				<li class="homes" xes_id="nav_index">
					<a href="javascript:void(0)" id="index">首页</a>
				</li>
<!--				<li class="course" xes_id="nav_findCourse">
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
				<li xes_id="nav_openCourse">
					<a href="javascript:void(0)">公开课</a>
				</li>
				<li xes_id="nav_findTeacher">
					<a href="javascript:void(0)">找老师</a>
				</li>
				<li class="news" xes_id="nav_glory">
					<a href="javascript:void(0)">学霸榜</a>
				</li>
				<li>
					<a target="_blank" href="http://bbs.xueersi.com/">逛论坛</a>
				</li>
			</ul>
			<div class="search">
				<form name="search" action="javascript:void(0)" method="GET">
					<input type="text" name="keyword" id="mq" accesskey="s" tabindex="9" autocomplete="off" placeholder="搜索：课程/老师" class="head_top_search">
					<button class="head_btn_search" xes_id="search" type="submit">搜索</button>
				</form>
			</div>

		</div>
	<!-- 头部 end-->	</div>
	<!-- 头部 end-->
	<div id="headnav">
		<ul>
			<li class="firstClass "><a href="javascript:void(0)">一年级</a></li>
			<li><a href="javascript:void(0)">二年级</a></li>
			<li><a href="javascript:void(0)">三年级</a></li>
			<li><a href="javascript:void(0)">四年级</a></li>
			<li><a href="javascript:void(0)">五年级</a></li>
			<li><a href="javascript:void(0)">六年级</a></li>
			<li><a href="javascript:void(0)">初一</a></li>
			<li><a href="javascript:void(0)">初二</a></li>
			<li><a href="javascript:void(0)">初三</a></li>
			<li><a href="javascript:void(0)">高一</a></li>
			<li><a href="javascript:void(0)">高二</a></li>
			<li><a href="javascript:void(0)">高三</a></li>
		</ul>
	</div>
	<!-- 内容 start-->
	<div id="container">
		<!-- 个人形象 -->
		<div class="user_student">
			<!--勋章相关隐藏div开始-->
<!-- 网校学生证-->

<!--学习达人-->

<!--做题达人-->

<!--直播达人勋章-->
<!--勋章相关隐藏div结束-->

<div class="task_five home_task" data-right_num="0" data-status="0">
			<!--答对题数小于5-->
		<div class="task_con">
			<span class="task_days">5</span>
			<p>每日五题</p>
		</div>
	</div>

<div class="user_pic">
	<a href="javascript:void(0)" title="点击更换头像"><img src="./我的首页-我的网校_files/user_0.png"></a>
</div>

<div class="user_name">
	<span class="gender_0">听听123456</span>
</div>

<!-- 个人信息 -->
<div class="user_detail">
	<div class="user_profile">
		<span class="user_address">浙江省杭州市下城区  一年级</span>
	</div>	
	<div class="user_level">
		<span title="学习课程获得学力值，学力值越高，等级越高。"><a href="javascript:void(0)" target="_blank">学力等级</a></span>
		<span class="icon_level">
			<a href="javascript:void(0)" target="_blank"><img alt="" title="等级:1,距离下次升级还需1000学力" src="./我的首页-我的网校_files/lv_1.png"></a>
		</span>
	</div>
	<ul class="studentMedal">
	    <li>
	    	<a href="javascript:void(0)" target="_blank">
		    					<img alt="" title="学习课程即可获得网校学生证" src="./我的首页-我的网校_files/s_0.png">
		        			</a>
		</li>
		<li>
			<a href="javascript:void(0)" target="_blank">
						     	<img alt="" title="学习课程超过10节即可激活勋章" src="./我的首页-我的网校_files/s_0(1).png">
		        	   		</a>
		</li>
		<li>
	   		<a href="javascript:void(0)" target="_blank">
	    			        	<img alt="" title="做10道课程测试题即可激活勋章" src="./我的首页-我的网校_files/s_0(2).png">
	            	      	</a>
		</li>
        <li>
	   		<a href="javascript:void(0)" target="_blank">
	    			        	<img alt="" title="参与1次直播即可激活勋章" src="./我的首页-我的网校_files/s_0(3).png">
	            	      	</a>
		</li>
	</ul>
	<div class="user_order">
		<span>
			<a href="javascript:void(0)" title="金币"><em>金币</em> 20</a>
		</span>
		<span>
			<a href="javascript:void(0)" title="订单"><em>订单</em> 0</a>
		</span>
		<span>
			<a href="javascript:void(0)" title="听课证"><em>听课证</em> 0</a>
		</span>
	</div>
</div>

<!-- 轮播 -->
<div id="play" class="adv_live_picture">
	<ul>
						<li style="z-index: 13; opacity: 0.94;">
								<a href="http://zt.xueersi.com/2014xiaoxue1qiujiban/" target="_blank">
				<img src="./我的首页-我的网校_files/14079328292053.jpg" alt="一年级个人中心">
			</a>
					</li>
						<li style="z-index: 12; opacity: 0;">	
								<a href="http://bbs.xueersi.com/thread-347556-1-1.html" target="_blank">
				<img src="./我的首页-我的网校_files/14090547787020.jpg" alt="网校杯获奖名单个人中心">
			</a>
					</li>
						<li style="z-index: 12; opacity: 0;">	
								<a href="javascript:void(0)" target="_blank">
				<img src="./我的首页-我的网校_files/14060189978879.jpg" alt="学习中心设置手机号绑定">
			</a>
					</li>
						<li style="z-index: 12; opacity: 0;">	
								<a href="javascript:void(0)" target="_blank">
				<img src="./我的首页-我的网校_files/14071210124300.jpg" alt="师资老杜">
			</a>
					</li>
			</ul>
	<ol class="focus_num">
				<li class="active">1</li>
						<li class="">2</li>
				<li class="">3</li>
				<li class="">4</li>
					</ol>
</div>

<link type="text/css" href="./我的首页-我的网校_files/page_jscrollpane.css" rel="stylesheet" media="all">
<script type="text/javascript" src="./我的首页-我的网校_files/xue.mousewheel.js"></script>
<script type="text/javascript" src="./我的首页-我的网校_files/xue.jscrollpane.min.js"></script>
<script type="text/javascript">
	//更多条件
	function getStyle(obj, attr)
	{
		return obj.currentStyle?obj.currentStyle[attr]:getComputedStyle(obj, false)[attr];
	}

	function startMove(obj, json, fn)
	{
		clearInterval(obj.timer);
		obj.timer=setInterval(function (){
			doMove(obj, json, fn);
		}, 30);
	}

	function doMove(obj, json, fn)
	{
		var attr='';
		var iCur=0;

		var iStop=0;
		
		for(attr in json)
		{
			if(attr=='opacity')
			{
				iCur=parseInt(parseFloat(getStyle(obj, attr))*100);
			}
			else
			{
				iCur=parseInt(getStyle(obj, attr));
			}
			
			var iSpeed=(json[attr]-iCur)/8;
			iSpeed=iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);
			
			if(iCur!=json[attr])
			{
				iStop++;
				if(attr=='opacity')
				{
					obj.style.filter='alpha(opacity:'+(iCur+iSpeed)+')';
					obj.style.opacity=(iCur+iSpeed)/100;
				}
				else
				{
					obj.style[attr]=iCur+iSpeed+'px';
				}
			}
		}
		
		if(iStop==0)
		{
			clearInterval(obj.timer);
			if(fn)
			{
				fn();
			}
		}
	}

	function play()
	{
		var oDiv = $('#play');
		var oOl = oDiv.find('ol');
		var oUl = oDiv.find('ul');
		if(oDiv.length == 0 || oOl.length == 0 || oUl.length == 0){
			return;
		}
		oOl = oOl[0];
		oUl = oUl[0];
		var aLiBtn=oOl.getElementsByTagName('li');
		var aLiAds=oUl.getElementsByTagName('li');
		var iNow=0;
		var timer=null;
		var i=0;
		
		for(i=0;i<aLiBtn.length;i++)
		{
			aLiBtn[i].index=i;
			aLiBtn[i].onmouseover=function ()
			{
				iNow=this.index;
				
				tab();
			};
		}
		
		function tab()
		{
			for(i=0;i<aLiBtn.length;i++)
			{
				aLiBtn[i].className='';
				startMove(aLiAds[i], {opacity:0});
				aLiAds[i].style.zIndex=12;//层级加在这里
			}
			aLiAds[iNow].style.zIndex++;//和这里
			aLiBtn[iNow].className='active';
			startMove(aLiAds[iNow], {opacity:100});
		}
		
		oDiv.on('mouseover', function (){
			clearInterval(timer);
		});
		
		oDiv.on('mouseout', function (){
			timer=setInterval(function (){
				iNow=(iNow+1)%aLiBtn.length;
				tab();
			}, 4000);
		});
		
		oDiv.mouseout();
	}
	play();
</script>		
		</div>
		<!--  个人形象 end-->
		
		<div class="layout layout_home">
			<div class="layout_body right w_740">
				<div class="tips_box">
									</div>
				<div class="main_box"><div id="nav_module" class="main_header">
	<ul class="nav_links">
		<li data-url="" data-params="" class="last current">
			我的课程
		</li>
                <div class="live_coach_info">
                    <a onclick="liveVideoPlay()" href="javascript:void(0);">直播辅导介绍</a>
                    <script src="./我的首页-我的网校_files/swfobject.js"></script>
                </div>
	</ul>
</div>
<!-- main_header  -->
<!-- tabs -->
<div class="main_tabs_con">
	<p class="current_class">
					<a href="javascript:void(0)" class="current">在学<b></b></a>
			<a href="javascript:void(0)" onclick="toggle(2)">过期<b></b></a>
			</p> 
	</div>

<div class="main_body">
						<!-- 没有课程 -->
			<div class="notCourse">真忧伤，一个课程都没有。<a href="javascript:void(0)" target="_blank">立即去选课！</a></div>
			<!-- 没有课程 -->		
			</div>
<div id="ui_pages" class="ui_pages"></div>
	<div class="leave-box hidden">
		<div class="leave-title">
			您还可以请假
			<em id="redTime" class="red">2</em>
			次，每次最多请假7天
		</div>
		<div class="leave-calendar">
			<p class="leave-calendar-title">请选择您的假期日期</p>
			<div class="leave-calendar-box"></div>
		</div>
		<div class="leave-form">
			<form method="post" action="javascript:void(0);" name="leave_form">
				<input type="text" class="leave_form_date leave_form_start" readonly="readonly"> 
				<label>至</label>
				<input type="text" class="leave_form_date leave_form_end" readonly="readonly"> 
				<p class="leave-btn">
					<button class="leave-form-submit btn btn_submit btn_red" type="submit" onclick="leaveSubmit();">确定</button>
					<button class="leave-form-cancle btn btn_gray" type="reset">清空</button>
				</p>
			</form>
			<p>
				课程有效期至：
				<em class="red leave_enddate">2013-08-02</em>
			</p>
			<dl class="leave-tips">
				<dt>友情提示：</dt>
				<dd>请假期间无法听课</dd>
				<dd>点击销假可正常听课</dd>
			</dl>
			<input type="hidden" value="2011226" class="leaveCourseId"></div>
	</div>
<script>
	//请假弹窗展示
	function leaveShow(stuCourseId,lastTime,lockNum){
		xue.use('leave', function(){
			leaveWin(stuCourseId, lastTime, lockNum);
		});
	}
	
	xue.tabs('nav_tab', function(d){
		var item = $(d),
		data = item.data(),
		url = data.url,
		param = data.params+'&curpage=1';
		$.ajax({
			url : url,
			data : param,
			type: "POST",
			dataType: 'html',
			success: function(d){
				var resData = xue.ajaxCheck.HTML(d);
				if(resData){				
					$('.main_body').html(resData);
					page(url,data.params);
				}
			}
		});	
	});
	
	xue.tabs('nav_module', function(d){
		var item = $(d),
		data = item.data(),
		url = data.url,
		param = data.params;
		if(url){
			$.ajax({
				url : url,
				data : param,
				type: "POST",
				dataType: 'html',
				success: function(d){
					var resData = xue.ajaxCheck.HTML(d);
					if(resData){						
						$('.main_box').html(resData);
					}
				}
			});		
		}
	});
	$('#nav_tab li:first').click();
	function toggle(status){
		var param = 'studyStatus='+status;
		var url = '/MyCourses/ajaxStuCourseSubject';
		$.ajax({
			url : url,
			data : param,
			type: "POST",
			dataType: 'html',
			success: function(d){
				var resData = xue.ajaxCheck.HTML(d);
				if(resData){				
					$('.main_box').html(resData);
				}
			}
		});	
	}
	
	function page(url,param){
		var pages = $('#class').val();
		xue.pages('ui_pages').config({
			pages:pages,
			current:1,
			pageNum:5,
			callback:function(current){
				$.ajax({
					url : url,
					data : param+'&curpage='+current,
					type: "POST",
					dataType: 'html',
					success: function(d){
					var resData = xue.ajaxCheck.HTML(d);
					if(resData){							
					$('.main_body').html(resData);
					xue.pages('ui_pages').go(current);
				}
			}
				});
			}
		});
	}
</script>
<script type="text/javascript">			$('body').off('click', '.ui_follow').on('click', '.ui_follow', function(){
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
			}</script></div>
			</div>
			
			<div class="layout_side left w_240">
				<div class="side_nav_box">
					<ul class="home_side_nav">
	<li class="current">
		<a href="./我的首页-我的网校_files/我的首页-我的网校.htm" class="icon_video">我的课程<strong></strong></a>
	</li>
	<li>
		<a href="javascript:void(0)" class="icon_exam">试卷集<strong></strong></a>
	</li>
	<li>
		<a href="javascript:void(0)" class="icon_th">错题本<strong></strong></a>
	</li>
	<li class="nav_header">
		<span>我的应用</span>
	</li>
	<li>
		<a href="javascript:void(0)" class="icon_note">新鲜事</a><em class="icon icon_new"></em>	</li>
	<li>
		<a href="javascript:void(0)" class="icon_star">我的收藏 <strong></strong></a>
	</li>
	<li>
		<a href="javascript:void(0)" class="icon_heart">关注的人 <strong>(9)</strong></a>
	</li>
	<li>
		<a href="javascript:void(0)" class="icon_mention">提到我的</a>	</li>
	<li>
		<a href="javascript:void(0)" class="icon_diamond">
			学习目标 
									(<strong class="red">未设定</strong>)
						</a>
	</li>
</ul>				</div>
			</div>
		</div>
	</div>
	<!--内容 end-->
	
	<script src="./我的首页-我的网校_files/xue.page.home.js"></script>

	<!--底部 start -->
	<div id="footer">
		<div class="foot_service">
    <a href="javascript:void(0)" class="service_share" target="_blank">
        <span>有趣的互动视频</span>
        <p>课程中的互动选择题，参与互动的同时，还有奖励哦</p>
    </a>
    <a href="javascript:void(0)" class="service_live" target="_blank">
        <span>直播学习指导</span>
        <p>与录播课程匹配的直播辅导，老师带着你做练习</p>
    </a>
    <a href="javascript:void(0)" class="service_system" target="_blank">
        <span>定期的学习诊断</span>
        <p>课后练习，期中期末考试，与全国学员一争高下</p>
    </a>
    <a href="http://zt.xueersi.com/2012-niuhaijingyan/" class="service_interaction" target="_blank">
        <span>学习经验分享</span>
        <p>学霸分享，告诉你老师不能告诉你的学习秘诀</p>
    </a>
</div>

<div class="foot_area">
    <p>

        <a href="javascript:void(0)">网校首页</a>
		|
        <a href="javascript:void(0)">关于我们</a>
		|
        <a href="javascript:void(0)">合作专区</a>
		|
        <a href="javascript:void(0)">联系我们</a>
		|
        <a href="javascript:void(0)" style="color:#cc0000;">版权声明</a>
        |
        <a href="javascript:void(0)">帮助中心</a>
    </p>
    <p>
		客服电话：<strong>18888959960</strong>（免长途话费） Copyright © 2009-2014 www.xueersi.com All Rights Reserved    
    </p>
    <p>北京学而思教育科技有限公司  京ICP备09032638号     京公网安备:1101082103</p>
    <p class="link">
        <a id="___szfw_logo___" href="https://search.szfw.org/cert/l/CX20120925001738002003" target="_blank">
            <img src="./我的首页-我的网校_files/13487953879693.png">
        </a>
    </p>
</div>

<script src="./我的首页-我的网校_files/xue.footer.js"></script>
<!-- 收录统计的加载元素-->
<script src="./我的首页-我的网校_files/xue.ga.min.js"></script>

<script>
    jQuery(function(){
     var href='/app';
        jQuery('.qrcode').append('<div class="hit_qrcode"><a href="javascript:void(0)" target="_blank" style="width:100px;height:100px;position:absolute;left:16px;top:9px;"></a><a href="'+href+'" class="qrcode_url" target="_blank">更多下载方式</a></div>');
        $('.qrcode').on('mouseenter',function(){
   $(this).children('.hit_qrcode').fadeIn();
  });
  $('.qrcode').on('mouseleave',function(){
   $(this).children('.hit_qrcode').fadeOut();
  });
    })
</script>

<!-- Google Code for &#20877;&#33829;&#38144;&#20195;&#30721; -->
<!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->
<script type="text/javascript">
$(function(){

/* <![CDATA[ */
var google_conversion_id = 1003613128;
var google_conversion_label = "t5nuCJCZtAQQyNfH3gM";
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
xue.loader('//www.googleadservices.com/pagead/conversion.js',null,true);
});
</script>
<!--<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">-->

<!--<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1003613128/?value=0&amp;label=t5nuCJCZtAQQyNfH3gM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>-->
<div class="qrcode qrcode1"><div class="hit_qrcode"><a href="javascript:void(0)" target="_blank" style="width:100px;height:100px;position:absolute;left:16px;top:9px;"></a><a href="javascript:void(0)" class="qrcode_url" target="_blank">更多下载方式</a></div></div>
<!--<div class="hitballs">
<param name="wmode" value="transparent" />
<embed src="http://img04.xesimg.com/swf/newyearGold.swf"wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashp
layer" type="application/x-shockwave-flash" width="200" height="350" />
</div>-->
<!--<div class="hitballs">
<param name="wmode" value="transparent" />
<embed src="http://img04.xesimg.com/swf/newyearLater.swf"wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashp
layer" type="application/x-shockwave-flash" width="200" height="350" />
</div>-->
	</div>
	<!--底部 end-->
	<div class="minions"></div>
    



<script async="" type="text/javascript" src="./我的首页-我的网校_files/conversion.js"></script><div class="rightResearch" id="FeedBack">		<ul>			<li><a id="r_copyright" href="http://bbs.xueersi.com/thread-280270-1-1.html" target="_blank"></a></li>			<li><a id="r_feedBack" target="_blank" href="http://bbs.xueersi.com/thread-313629-1-1.html"></a></li>			<li><a id="r_toTop" href="javascript:scroll(0,0);" style="display: none;"></a></li>			<li id="copy_notice">			</li>		</ul>	</div></body></html>

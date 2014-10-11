<!DOCTYPE html>
<!-- saved from url=(0068)http://login.xueersi.com/user/login/aHR0cDovL3d3dy54dWVlcnNpLmNvbS8= -->
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/view/resource1.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>登录-海事公开课</title>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <link href="<%=basePath%>/css/page_login.css" type="text/css" rel="stylesheet">
        <script src="<%=basePath%>/js/xue.js"></script>
        <!--[if lt IE 9]> 
        <link href="http://css04.xesimg.com/ie_project.css" type="text/css" rel="stylesheet" /> 
    <![endif]-->
        <!--[if IE 6]>  
            <script src="http://js04.xesimg.com/xue.png.js"></script>
            <script type="text/javascript">DD_belatedPNG.fix('#header,.icon,button,i,a,a:hover,img'); </script>
        <![endif]-->
   </head>
    <body><h1 id="xue_logo">
        <a href="javascript:void(0)" class="logo_passport"></a>
        <span class="logo_tips login_font">欢迎登录</span>
    </h1>
    <!--header结束-->

    <!--content开始-->
    <div class="passport_wrap">
        <div id="passport_login" class="passport_box">
            <div id="login_ad">
                <img src="" alt="">
            </div>
            <form id="entry" action="sx_login_webpage.do" method="POST">
                <p class="entry_item entry_inputs">
                    <label for="">用户名</label><input class="input_text" type="text" index="1" name="username" value="">
                </p>
                <p class="entry_item entry_inputs">
                    <label for="">密　码</label><input class="input_text" type="password" index="2" name="password">
                </p>
                <p class="entry_item padding">
                    <input id="save_pass" type="checkbox" name="savename" checked="checked">记住用户名
                    <a href="javascript:void(0)" id="forget_password">忘记密码？</a>
                </p>
                <p class="entry_item padding entry_submit">
                    <button id="login_submit" type="submit" class="btn_login">登录</button>
                </p>
                <p class="entry_item apilogin_tips">
                    您也可以用以下方式登录
                </p>
                <p class="entry_item apilogin_btns">
                    <a id="apilogin_qq" href=javascript:void(0)>QQ</a>
                    <a id="apilogin_weibo" href=javascript:void(0)>新浪微博</a>
                    <a id="apilogin_eduu" href=javascript:void(0)>E度</a>
                </p>
            </form>
        </div>
        <p id="regist_btns"><a href="newregister.do" class="regist_button">免费注册</a></p>
            </div>

    <!--content结束-->
    <script src=""></script>

    <!--footer开始-->
    <div id="footer" style="border:none;">
        <div class="foot_area">
            <p>
               海事公开课
                <a href="../sxCourse/newhome.do">网校首页</a>
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
                Copyright © 2009-2014  All Rights Reserved
            </p>
            <p class="link">
                <a id="___szfw_logo___" href="" target="_blank">
                    <img src=""></a>
            </p>
        </div>
    </div>
    <!--footer开始-->
<div class="rightResearch" id="FeedBack">		<ul>			<li><a id="r_copyright" href=javascript:void(0) target="_blank"></a></li>			<li><a id="r_feedBack" target="_blank" href=javascript:void(0)></a></li>			<li><a id="r_toTop" href="javascript:scroll(0,0);" style="display:none;"></a></li>			<li id="copy_notice">			</li>		</ul>	</div></body></html>

<!DOCTYPE html>
<!-- saved from url=(0037)http://www.xueersi.com/user/register/ -->
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/view/resource1.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>注册-欢迎来到学而思网校</title>
		<meta name="description" content="">
		<meta name="keywords" content="">
		<link href="<%=basePath%>/css/page_login.css" type="text/css" rel="stylesheet">
		<script src="<%=basePath%>/js/xue.js"></script>
		<!--[if lt IE 9]> ·
		<link href="http://css04.xesimg.com/ie_project.css?1408695598" type="text/css" rel="stylesheet" /> 
		<![endif]-->
		<style>
			/*			.getCode {
				background-color: #F6F6F6;
				border: 2px solid #ECECEC;
				border-width:2px 0;
			}*/
			#verificationCode {
				width:49px;
			}
			#verificationImg {
				height:28px;
				cursor:pointer;
			}
			.imgCodeWrap {
				float: left;
			}
			#phonecode {
				width:231px;
			}
		</style>
	</head>
	<body>
		<h1 id="xue_logo">
			<a href="javascript:void(0)" class="logo_passport"></a>
			<span class="logo_tips regist_font">欢迎注册</span>
		</h1>
		<!--header结束-->
		<!--content开始-->
		<div class="wrapper_body">
			<div class="log">
				<p class="log_title">用户注册<span>我已经注册，现在去<a href="newlogin.do">登录</a></span></p>
<!--				<div class="log_left register" style="height:480px;">-->
				<div class="log_left register" style="height:360px;">
					<form class="form_check" id="form_register" action="sx_save_webpage.do"  method="POST">
						<p>
							<label for="username"><i>*</i>电子邮箱</label>
							<input id="name" name="email" type="text" placeholder="请输入用户名">
							<span id="tips_username" class="tips"></span>
						</p>
						<p>
							<label for="password"><i>*</i>设定密码</label>
							<input id="password" name="password" type="password" placeholder="请输入密码">
							<span id="tips_password" class="tips"></span>
							<span class="form_tips tips_strength hidden" style="display:none;">
								<i class="strength_text">密码强度：</i>
								<strong class="strength_1"></strong>

							</span>
						</p>
						<p>
							<label for="password"><i>*</i>确认密码</label>
							<input id="repassword" name="confirm_password" type="password">
							<span id="tips_repassword" class="tips"></span>
						</p>
						
						<!--**************************wf xg 08.12 取消验证码 start***********************-->
<!--						<p>
							<label for="phone" placeholder="手机号"><i>*</i>手机号</label>
							<input id="phone" name="phone" type="text" />
							<span id="tips_phone" class="tips"></span>
						</p>
						<p class="getCode">
                            <label><i>*</i>校验码</label>
                            <input type="hidden" id="strength" name="strength" value="" />
                            <input type="text" maxlength="4" id="verificationCode" class="yzm_kuang"  name="verificationCode" />
                            <span class="imgCodeWrap"><img height="20" width="60" id="verificationImg" alt="验证码" src=""  onClick="changeVerificationImg('verificationImg'); return false;" title="(看不清，换一张)"></span>
                            <span class="vcode" id="vcode">获取短信验证码</span>
							<span id="tips_verificationCode" class="tips"></span>
							<span id="tips_phonecode" class="tips"></span>
                        </p>
						<p class="get_phonecode">
							<label for="phonecode" placeholder="密码"><i>*</i>短信验证码</label>
							<input id="phonecode" name="code" type="text" readonly="true" />
							<span class="vcode" id="vcode">获取短信验证码</span>
														<span id="tips_phonecode" class="tips"></span>

						</p>
						<p class="msg_tip" style="display: none;height:20px;color:#999;"><label for=""></label>目前获取验证码用户较多，您的验证码已经在路上，请耐心等待。</p>-->
						<!--**************************wf xg 08.12 取消验证码 start***********************-->
<!--						<p>-->
						<p style="margin-top:30px;">
							<label for=""></label>
							<span class="btn_wrap btn_wrap_orange">
								<button id="form_submit" class="login_btn btn_submit" name="submit" type="submit" value="">同意以下协议，注册</button>
							</span>
							<br>

						</p>
						<p class="reg_agreement"> 
							<label for=""></label>
							<a href="#">用户注册协议</a></p>
											</form>
				</div>
<!--				<div class="log_right enwidth" style="height:480px;">-->
				<div class="log_right enwidth" style="height:360px;">
					<div class="what_from">

						<img class="" alt="">
						
						
					</div>
				</div>
			</div>
		</div>
		<!--content结束-->


		<!--footer开始-->
		<div id="footer" style="border:none;">
			<div class="foot_area">
    <p>
        <a href="../sxCourse/newhome.do">网校首页</a>
		|
        <a href="javascript:void(0)">关于我们</a>
		|
        <a href="javascript:void(0)">合作专区</a>
		|
		<a href="javascript:void(0)">联系我们</a>
		|
        <a href="javascript:void(0)">帮助中心</a>
    </p>
    <p>
		客服电话：<strong>18888959960</strong>（免长途话费） Copyright © 2009-2014 www.xueersi.com All Rights Reserved    
    </p>
    <p>海事公开课</p>
    <p class="link">
        <a id="___szfw_logo___" href="https://search.szfw.org/cert/l/CX20120925001738002003" target="_blank">
            <img src="">
        </a>
    </p>
</div>

<script src=""></script>
<!-- 收录统计的加载元素-->
<script src=""></script>

		</div>
		<script type="text/javascript">
			// 更新验证码图片
			function changeVerificationImg(imgId) {
				var newVerificationImg = '/verifications/show?' + generateMixed(12);
				$('img[id="' + imgId + '"]').attr('src', newVerificationImg);
			}

			// 生成随机字符串
			function generateMixed(n) {
				var chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
				var res = "";
				for(var i = 0; i < n ; i ++) {
					var id = Math.ceil(Math.random() * 35);
					res += chars[id];
				}
				return res;
			}
			function checkImgCode(){
				var v = $('#verificationCode').val();
				if(v == ''){
					xue.formCheck.setTips('verificationCode', '请输入校验码');
					return false;
				}
				// if(!/^[1-9]\d*|0$/.test(v)){
				if(!/^[a-zA-Z0-9]{4,4}$/.test(v)){
					xue.formCheck.setTips('verificationCode', '验证码错误，请重新输入');
					return false;
				}
				xue.formCheck.clearTips('verificationCode');

				var url = '/MyInfos/getVerificationCode/';
				$.ajax(url, {
					type : 'POST',
					data : {verifyCode: v},
					dataType : 'json',
					success  : function(result){
                
						if(result.sign == 1){
							xue.formCheck.clearTips('verificationCode');
						}else{
							xue.formCheck.setTips('verificationCode', result.msg);
						}
					}
				});
				return true;
			}
	
			/* 获取验证码部分 */
			var fromCode = fromCode || {};
			(function(){
				var f = fromCode;

				f.time = 90;

				f.interval = null;

				f.box = '#vcode';

				f.cls = { btn : 'vcode', count : 'vcode_countdown' };

				f.count = function(){
					var that = this, box = $(that.box);
					//        f.box.form = box.parents('form');
					if(box.length == 0){ return; }
					that.clear();
					box.addClass(that.cls.count).text('90秒后重新获取');
					//        $(f.box.phone).prop('readonly', true);
					$('#phonecode').focus();
					// $('#vcode_mask').remove();
					if($('#vcode_mask').length == 0){
						$('body').prepend('<div id="vcode_mask"></div>');
					}
					$('#vcode_mask').css({
						position : 'absolute',
						left : box.offset().left,
						top : box.offset().top,
						width : box.width(),
						height : box.height(),
						background : '#fff',
						opacity : 0.3,
						// overflow : 'hidden',
						filter : 'alpha(opacity=30)',
						zIndex : 100
					});
					that.interval = setInterval(function(){
						if(that.time > 0){
							that.time--;
							box.text(that.time + '秒后重新获取');
							$('.msg_tip').show();
							$('.get_phonecode').css('height','30px');
						}else{
							that.clear();
							box.removeClass('vcode_countdown');
							changeVerificationImg('verificationImg');
							$('#verificationCode').val('');
							$('.msg_tip').hide();
							$('.get_phonecode').css('height','50px');
						}
					}, 1000);
				};

				f.clear = function(){
					var that = this, box = $(that.box);
					if(box.length == 0){ return; }

					that.time = 90;
					clearInterval(that.interval);
					//        $(f.box.phone).prop('readonly', false);
					box.removeClass().addClass(that.cls.btn).text('获取短信验证码');
					$('#vcode_mask').remove();
				};
	
			})()

			$(function(){
				changeVerificationImg('verificationImg');
				//				$('#username, #password, #repassword, #phone, #grade, #phonecode').off('blur').on('blur', function(){
				$('#username, #password, #repassword, #grade').off('blur').on('blur', function(){
					var that = $(this), id = this.id;
					var check = xue.formCheck;
					check.box[id] = that;
					check[id]();
      
					if(id == 'username'){
						check.username( that.val(), function(){
							$.ajax({
								type: "POST",
								url: "/user/aCheckEmail",
								data: 'email=' + $('#username').val(),
								dataType: "json",
								timeout: 7000,
								success: function(result) {
									if (result.sign == false) 
									{
										check.setTips('username', result.msg, 'error');
									}       
									else
									{
										check.setTips('username', result.msg, 'success');
									}
								},
								error: function() {
									alert('数据读取错误,请重试..');
									return false;
								}
							});
						});
					}
					check.isError();
				});

				$('.getCode').on('click', '.vcode', function(){
					
					var check = xue.formCheck;
					var vcode = xue.formCheck.vcode;
					fromCode.clear();
					check.box.phone = $('#phone');
					if(check.phone() && checkImgCode()){
						fromCode.box = $(this);
						//						$(this).text('发送中……');
						var url = '/user/getPassCode';
						$.ajax(url, {
							type : 'POST',
							dataType : 'json',
							data : {phone: $('#phone').val(),code:$('#verificationCode').val()},
							error : function( a, b, c, d ){
								xue.alert(d);
							},
							success : function( result ){
								
								var msg = xue.ajaxCheck.JSON(result);
								if(msg){
									$('.get_phonecode').show();
									fromCode.count();
									$('#phonecode').prop('readonly',false);
								}else{
									changeVerificationImg('verificationImg');
									$('#verificationCode').val('').focus();
								}
							}
						});
            
            
					}
				});


				$('#form_register').off('click', '.btn_submit:not(.btn_disable)').on('click', '.btn_submit:not(.btn_disable)', function(){
					var that = $(this);
        
					var check = xue.formCheck;
					check.box.form = $('#form_register');
//					var list = $('#username, #password, #repassword, #phone, #grade, #phonecode');
					var list = $('#username, #password, #repassword, #grade');
					list.each(function(){
						var that = $(this), id = this.id;
						if(that.length > 0){
							check.box[id] = that;
							check[id]();                
						}
					});
					if(check.isError()){
						return false;
					}else{
						return true;
					}
  
				});

			}); 

			$("#username").blur(function () {   
				$.ajax({
					type: "POST",
					url: "/user/aCheckEmail",
					data: 'email=' + $('#email').val(),
					dataType: "json",
					timeout: 7000,
					success: function(result) {
						if (result.sign == false) 
						{
							var tmp_str = '<span id="selectFindMode" class="errTips">';
							tmp_str += result.msg;
							tmp_str += '</span>';
							$("#selectFindMode").remove();
							$("#email").after(tmp_str);
						}       
						else
						{
							$("#selectFindMode").remove();  
						}
					},
					error: function() {
						alert('数据读取错误,请重试..');
						return false;
					}
				});
			});


			$('#password').off('keyup').on('keyup', function(){
				xue.formCheck.checkStrength(this);
			});
			
			//验证验证码是否正确
			$('#verificationCode').on('blur',function(){
				checkImgCode();
			});
		</script>
		<!-- Google Code for &#27880;&#20876;&#25104;&#21151; Conversion Page -->
		<script type="text/javascript">
			/* <![CDATA[ */
			var google_conversion_id = 1003613128;
			var google_conversion_language = "en";
			var google_conversion_format = "3";
			var google_conversion_color = "ffffff";
			var google_conversion_label = "Xxx4CLDlvwcQyNfH3gM";
			var google_conversion_value = 0;
			var google_remarketing_only = false;
			/* ]]> */
		</script>
		<script type="">
		</script><img height="">
		<noscript>
		&lt;div style="display:inline;"&gt;
			&lt;img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/1003613128/?value=0&amp;amp;label=Xxx4CLDlvwcQyNfH3gM&amp;amp;guid=ON&amp;amp;script=0"/&gt;
		&lt;/div&gt;
		</noscript>
	


<div class="rightResearch" id="FeedBack">		<ul>			<li><a id="r_copyright" href=javascript:void(0) target="_blank"></a></li>			<li><a id="r_feedBack" target="_blank" href=javascript:void(0)></a></li>			<li><a id="r_toTop" href="javascript:scroll(0,0);" style="display:none;"></a></li>			<li id="copy_notice">			</li>		</ul>	</div></body></html>

<!DOCTYPE html>
<!-- saved from url=(0048)http://www.xueersi.com/LearningCenter/collection -->
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/view/resource1.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
	<link href="<%=basePath%>/css/page_home.css" type="text/css" rel="stylesheet">
	<link href="<%=basePath%>/css/style.css" type="text/css" rel="stylesheet">
	<link href="http://img04.xesimg.com/favicon.ico" rel="shortcut icon">
	<script src="<%=basePath%>/js/xue.js"></script>
	<!--[if lt IE 9]> 
	<link href="http://css04.xesimg.com/ie_project.css?1411032752" type="text/css" rel="stylesheet" />	
	<link href="http://css04.xesimg.com/ie_header.css?1411032752" type="text/css" rel="stylesheet" />
	<![endif]--></head>

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


function pageAjax(){
	var searchtext = $("#mq").attr("value");
	var url = "";
	
	url="<%=basePath%>/sxMyFavorite/sx_dataList.do?userid="+$("#userid").val();
	
    $.pageAjax(url,"msgContent","showList");
}


$(function () {
	pageAjax();
})

String.prototype.format = function(args) {
    var result = this;
    if (arguments.length > 0) {    
        if (arguments.length == 1 && typeof (args) == "object") {
            for (var key in args) {
                if(args[key]!=undefined){
                    var reg = new RegExp("({" + key + "})", "g");
                    result = result.replace(reg, args[key]);
                }
            }
        }
        else {
            for (var i = 0; i < arguments.length; i++) {
                if (arguments[i] != undefined) {
                    var reg= new RegExp("({)" + i + "(})", "g");
                    result = result.replace(reg, arguments[i]);
                }
            }
        }
    }
    return result;
}


function showList(data){
	var list =  data["rows"];
	//alert(data);
	//var obj = JSON.parse(data); 
	//alert(obj);
	//var list1=obj.rows;
	//alert(list1);
	//var list=list1.rows;
	//alert(list);
	  var str="";
	  if(list==""||list==null){
		str="<tr><td colspan=\"9\"><span class=\"tip\">系统无纪录!</span></td></tr>";				  
	  }else{
		  var mstr = $("#listitem").html();
		  var mstr_after = "";
		  for(var i=0;i<list.length;i++){
			  var item = list[i];
			  //alert(item.name);
			  //alert(item);
			  //alert(item.name);
			  mstr_after = mstr.format(item.coursename,"newdetail.do?course_id="+item.id); 
			  //alert(mstr);
			  str = str+mstr_after;
			  
			  
		  	//str=str+" <tr id=\"contentTr"+i+"\"><td><input name=\"selectIds\" type=\"checkbox\" value=\""+list[i].id+"\"/></td><td>"+list[i].id+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td></tr>";
		  }
	  }
	  if($('#key').val()==""||$('#key').val()==null)$('#key').append("<option value='productName'>产品名称</option><option value='productCode'>产品编号</option>");
	  $("#msgContent").empty();
	  $("#msgContent").append(str);
	  window.document.body.scrollTop=100;
}
</script>

<input id="userid" type="hidden" value="${userid}" >
<input id="username" type="hidden" value="${username}" >
<!--头部  start id#header 登录后有广告高度为144-->
		<jsp:include page="head_share.jsp"/>
	<!-- 头部 end-->
	<div id="headnav">
		<ul>
			<c:forEach items="${coursetype}" var="user"
								varStatus="status">
								
								<c:if test="${status.index == 0}">
									<LI  class="firstClass "><A href="newlist.do?type_code=${user.type_code}" xes_id="gradenav_xiaoyi"><c:out value="${user.name}" /></A></LI>
								</c:if>
								
								<c:if test="${status.index > 0}">
									<LI><A href="newlist.do?type_code=${user.type_code}" xes_id="gradenav_xiaoyi"><c:out value="${user.name}" /></A></LI>
								</c:if>
								
								
								
							</c:forEach>
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
	<a href="javascript:void(0)" title="点击更换头像"><img src="./我的首页-我的收藏_files/user_0.png"></a>
</div>

<div class="user_name">
	<span class="gender_0">${username}</span>
</div>

<!-- 个人信息 -->
<div class="user_detail">
	<div class="user_profile">
		<span class="user_address">浙江省杭州市下城区  一年级</span>
	</div>	
	<div class="user_level">
		<span title="学习课程获得学力值，学力值越高，等级越高。"><a href="javascript:void(0)" target="_blank">学力等级</a></span>
		<span class="icon_level">
			<a href="javascript:void(0)" target="_blank"><img alt="" title="等级:1,距离下次升级还需1000学力" src="./我的首页-我的收藏_files/lv_1.png"></a>
		</span>
	</div>
	
	<ul class="home_side_nav">
	
	<li>
		<a href="mystudyway.do" class="icon_note">我看过的课程</a><em class="icon icon_new"></em>	</li>
	<li class="current">
		<a href="mycollect.do" class="icon_star">我的收藏 <strong></strong></a>
	</li>
	
<!--	<li >
		<a href="/LearningCenter/setTarget" class="icon_diamond">
			学习目标 
									(<strong class='red'>未设定</strong>)
						</a>
	</li>-->
</ul>				
	
	
	<ul class="studentMedal">
	    <li>
	    	<a href="javascript:void(0)" target="_blank">
		    					<img alt="" title="学习课程即可获得网校学生证" src="./我的首页-我的收藏_files/s_0.png">
		        			</a>
		</li>
		<li>
			<a href="javascript:void(0)" target="_blank">
						     	<img alt="" title="学习课程超过10节即可激活勋章" src="./我的首页-我的收藏_files/s_0(1).png">
		        	   		</a>
		</li>
		<li>
	   		<a href="javascript:void(0)" target="_blank">
	    			        	<img alt="" title="做10道课程测试题即可激活勋章" src="./我的首页-我的收藏_files/s_0(2).png">
	            	      	</a>
		</li>
        <li>
	   		<a href="javascript:void(0)" target="_blank">
	    			        	<img alt="" title="参与1次直播即可激活勋章" src="./我的首页-我的收藏_files/s_0(3).png">
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
						<li style="z-index: 12; opacity: 0;">
								<a href="javascript:void(0)" target="_blank">
				<img src="./我的首页-我的收藏_files/14108330014157.jpg" alt="小学一年级9折1">
			</a>
					</li>
						<li style="z-index: 13; opacity: 0.94;">	
								<a href="javascript:void(0)" target="_blank">
				<img src="./我的首页-我的收藏_files/14098197129514.jpg" alt="网校杯视频讲解个人中心">
			</a>
					</li>
						<li style="z-index: 12; opacity: 0;">	
								<a href="javascript:void(0)" target="_blank">
				<img src="./我的首页-我的收藏_files/14060189978879.jpg" alt="学习中心设置手机号绑定">
			</a>
					</li>
			</ul>
	<ol class="focus_num">
				<li class="">1</li>
						<li class="active">2</li>
				<li class="">3</li>
					</ol>
</div>

<link type="text/css" href="./我的首页-我的收藏_files/page_jscrollpane.css" rel="stylesheet" media="all">
<script type="text/javascript" src="./我的首页-我的收藏_files/xue.mousewheel.js"></script>
<script type="text/javascript" src="./我的首页-我的收藏_files/xue.jscrollpane.min.js"></script>
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
				<div class="main_box">
					<div class="main_header">
	<ul class="nav_links">	
		<li class="last current">
			我的收藏
		</li>
	</ul>
</div>

<div class="content_box"><!-- 收藏的课程（公开课）列表 -->
	<div class="ui_courses">
	<div id="listitem" style="display:none">
<div class="course_detail">
					<p class="course_title">
						<em>海事</em>
						<a href="{1}" target="_blank">
							{0}							<strong></strong>
						</a>
					</p>
					<p class="course_info">
						<span title="四年级学生">
							本课程需在<strong>28</strong>天内学完　适用于：*****					</span>
						<a href="{1}" target="_blank">详情</a>
					</p>
					<p class="course_btnc">
						<a href="{1}" class="btn_audition" target="_blank">
							免费试听
						</a>
						
					</p>
				</div>
			</div>
			</div>
	
				<div  id="msgContent" class="ui_courses">
						
					</div>
					<div class="page" id="page">
				        	<jsp:include page="page_ajax.jsp"/>
				        </div>
		<script>
		var pages = 17;
		var type = 1;
		var d = $('#nav_tab li:eq(' + type + ')').data();
		xue.pages('ui_pages').config({
			pages:pages,
			current:1,
			pageNum:10,
			callback:function(current){
				$.ajax({
					url : d.url,
					data : 'curpage='+current+'&type='+type,
					type: "POST",
					dataType: 'html',
					success: function(result){
						var res = xue.ajaxCheck.HTML(result);
						if(res){
							$('.content_box').html(res);
						}
						xue.pages('ui_pages').go(current);
					}
				});
			}
		});
		
		//取消收藏课程
		function delcolCou(id,ins){
			$.ajax({
				url : '/Dynamics/delColCourse',
				data : 'courseId='+id+'&type='+type,
				type: "POST",
				dataType: 'json',
				success: function(d){
			        if(d.sign==1){
			              // 这里写返回成功的回调内容
			             $(ins).addClass('fav_end').attr('onclick','');
						 xue.alert(d.msg);return false;
			        }else if(d.sign==2){
						window.location.href = 'http://login.xueersi.com/user/login/';
					}else{
						xue.alert(d.msg);return false;
					}
				}
			});
		}
		</script>
		</div>
<!--内容 end--></div>

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
								window.location.href='http://login.xueersi.com/user/login/aHR0cDovL3d3dy54dWVlcnNpLmNvbS9MZWFybmluZ0NlbnRlci9jb2xsZWN0aW9u';
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
			}</script><script type="text/javascript">
xue.tabs('nav_tab', function(d){
	var item = $(d),
	data = item.data(),
	url = data.url,
	param = data.params;
	$.ajax({
		url : url,
		data : param,
		type: "POST",
		dataType: 'html',
		success: function(res){
			var resData = xue.ajaxCheck.HTML(res);
			if(resData){
				var resData = xue.ajaxCheck.HTML(res);
				if(resData){
					$('.content_box').html(resData);
				}
			}
			
		}
	});	
});
$('#nav_tab li:first').click();
</script>
	
				</div>
			</div>
			
			
		</div>
	</div>
	<!--内容 end-->
	
	<script src="./我的首页-我的收藏_files/xue.page.home.js"></script>

	<jsp:include page="footer_share.jsp"/>

<script src="./我的首页-我的收藏_files/xue.footer.js"></script>
<!-- 收录统计的加载元素-->
<script src="./我的首页-我的收藏_files/xue.ga.min.js"></script>

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
	/* <![CDATA[ */
	var google_conversion_id = 1003613128;
	var google_conversion_label = "t5nuCJCZtAQQyNfH3gM";
	var google_custom_params = window.google_tag_params;
	var google_remarketing_only = true;
	/* ]]> */
	$(function(){
		xue.loader('http://www.googleadservices.com/pagead/conversion.js',null,true);
	});
</script>
<!--<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">-->
<!--</script>-->
<noscript>
&lt;div style="display:inline;"&gt;
&lt;img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1003613128/?value=0&amp;amp;label=t5nuCJCZtAQQyNfH3gM&amp;amp;guid=ON&amp;amp;script=0"/&gt;
&lt;/div&gt;
</noscript>
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
    <script>
  	 $(document).ready(function(){   
        setTimeout(function(){
        	$(".minions").fadeOut(300);
        },5000);
	 }) 
   </script>



<script async="" type="text/javascript" src="./我的首页-我的收藏_files/conversion.js"></script><div class="rightResearch" id="FeedBack">		<ul>			<li><a id="r_copyright" href=javascript:void(0) target="_blank"></a></li>			<li><a id="r_feedBack" target="_blank" href=javascript:void(0)></a></li>			<li><a id="r_toTop" href="javascript:scroll(0,0);" style="display: none;"></a></li>			<li id="copy_notice">			</li>		</ul>	</div></body></html>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0034)http://www.xueersi.com/openCourse/ -->
<HTML><HEAD>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/view/resource1.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<TITLE>海事公开课</TITLE>
<LINK 
rel="stylesheet" type="text/css" href="<%=basePath%>/css/page_index.css"><LINK 
rel="shortcut icon" href="http://img04.xesimg.com/favicon.ico">

<SCRIPT src="<%=basePath%>/js/xue.js"></SCRIPT>

<SCRIPT src="<%=basePath%>/js/xes_stat.js"></SCRIPT>

  <script type="text/javascript">
function pageAjax(){
	var searchtext = $("#mq").attr("value");
	var url = "";
	
	var type_code = $("#type_code").val();
	
	if(type_code != null && type_code.length > 0)
	{
		url="<%=basePath%>/sxCourse/dataList.do?type_code="+type_code;
	}else{
		url="<%=basePath%>/sxCourse/dataList.do";
	}
	
	if(searchtext != null && searchtext.length > 0)
	{
	   if(url.indexOf("?") != -1){
		   url=url+"&name="+searchtext;
	   }else{
		   url=url+"?name="+searchtext;
	   }
		   
		
	}
	
	
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
	var list=data.rows;
	  var str="";
	  if(list==""||list==null){
		str="<tr><td colspan=\"9\"><span class=\"tip\">系统无纪录!</span></td></tr>";				  
	  }else{
		  var mstr = $("#listitem").html();
		  var mstr_after = "";
		  for(var i=0;i<list.length;i++){
			  var item = list[i];
			  //alert(item);
			  //alert(item.name);
			  mstr_after = mstr.format(item.name,"newdetail.do?course_id="+item.id,item.teacher_name); 
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


<script>
  /* when document is ready */
 
  </script>

  <style type="text/css">
  .holder {
    margin: 15px 0;
  }

  .holder a {
    font-size: 12px;
    cursor: pointer;
    margin: 0 5px;
    color: #333;
  }

  .holder a:hover {
    background-color: #222;
    color: #fff;
  }

  .holder a.jp-previous { margin-right: 15px; }
  .holder a.jp-next { margin-left: 15px; }

  .holder a.jp-current, a.jp-current:hover {
    color: #FF4242;
    font-weight: bold;
  }

  .holder a.jp-disabled, a.jp-disabled:hover {
    color: #bbb;
  }

  .holder a.jp-current, a.jp-current:hover,
  .holder a.jp-disabled, a.jp-disabled:hover {
    cursor: default;
    background: none;
  }

  .holder span { margin: 0 5px; }
  </style>
<!--[if lt IE 9]> 
	<link href="http://css04.xesimg.com/ie_project.css?1407139873" type="text/css" rel="stylesheet" />	
	<link href="http://css04.xesimg.com/ie_header.css?1407139873" type="text/css" rel="stylesheet" />	
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
<!--头部  start id#header 登录后有广告高度为144-->
<input name="userid" type="hidden" value="${userid}" >
<input name="username" type="hidden" value="${username}" >
<input id = "type_code" type="hidden" value="${type_code}"  />
<input id = "name" type="hidden" value="${name}"  />
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
<DIV id="container">
<DIV id="container">
<DIV class="layout">
<DIV class="layout_body left w_730 pubcourse">
<DIV style="margin-top: 20px;" id="play" class="grid_c3_c1"><!-- 公开也广告位轮播 -->
<DIV class="ui_module_video">
<UL>
  <LI style="z-index: 12; opacity: 1;"><A href="javascript:void(0)" 
  target="_blank"><IMG alt="小学2014年1-6年级语数英新学年学习规划年级频道页" src="公开课-学而思网校_files/14050835909013.jpg"></A></LI>
  <LI style="z-index: 12; opacity: 0;"><A href="javascript:void(0)" 
  target="_blank"><IMG alt="14高考试卷独家评析与解读" src="公开课-学而思网校_files/14029692681954.jpg"></A></LI>
  <LI style="z-index: 12; opacity: 0;"><A href="javascript:void(0)" 
  target="_blank"><IMG alt="2015天津小升初政策解读公开课2" src="公开课-学而思网校_files/14044456759017.jpg"></A></LI>
  <LI style="z-index: 12; opacity: 0;"><A href="javascript:void(0)" 
  target="_blank"><IMG alt="化学魔术师的奇幻世界" 
  src="公开课-学而思网校_files/14008379793765.jpg"></A></LI>
  <LI style="z-index: 12; opacity: 0;"><A href="javascript:void(0)" 
  target="_blank"><IMG alt="盘点2013十大语文错误－频道页" src="公开课-学而思网校_files/13891637855218.jpg"></A></LI></UL>
<OL class="focus_num">
  <LI class="active">1</LI>
  <LI>2</LI>
  <LI>3</LI>
  <LI>4</LI>
  <LI>5</LI></OL></DIV></DIV><!--公开也广告位轮播 End --><!--课程筛选 -->
  <!--课程筛选 end-->
  <!-- 课程列表 -->
  <div id="listitem" style="display:none">
  	<div  class="course_item">
																					<div class="ui_avatar">
												<ul class="avatar_items">
																																										<li data-id="735" class="ui_userinfo" data-params="userId=735">
																<a href="javascript:void(0)" class="userpic" target="_blank">
																	<img src="./学而思网校-中小学网络远程教育_files/13949223111838.jpg" alt="">
																</a>
																<a href="{1}" class="username" target="_blank">
																	{0}																</a>
															</li>
																																							</ul>
																							</div>
																				<div class="course_detail">
											<p class="course_title">
												<em>海事</em>
												
											</p>
											<p class="course_info">
												<span>
																																																授课老师：
																																										<a href="javascript:void(0)" target="_blank">{2}</a>
																																							</span>
												<span class="num_videos"> 试听：<strong>14351</strong>
												</span>	
											</p>
										</div> 
									</div>
									</div>
  
  
<DIV  id="msgContent" name = "anchor">


</DIV>
<div class="page" id="page">
				        	<jsp:include page="page_ajax.jsp"/>
				        </div>
<!-- 课程列表 end --></DIV><!--layout_body end -->
<DIV class="layout_side right w_235">
<DIV class="panel">
<DIV class="side_header new_list"><SPAN>最新发布</SPAN></DIV>
<UL class="notice_list">
  <LI><A title="【飞遍化学】化学魔术师的奇幻世界(第四季)——荧光化学" href="javascript:void(0)" 
  target="_blank">【飞遍化学】化学魔术师的奇...</A><SPAN>4,351						</SPAN></LI>
  <LI><A title="【飞遍化学】化学魔术师的奇幻世界(第四季)——蓝瓶子" href="javascript:void(0)" 
  target="_blank">【飞遍化学】化学魔术师的奇...</A><SPAN>5,141						</SPAN></LI>
  <LI><A title="【欣哥心灵驿站】如何领跑新高一" href="javascript:void(0)" 
  target="_blank">【欣哥心灵驿站】如何领跑新...</A><SPAN>3,901						</SPAN></LI>
  <LI><A title="【飞遍化学】化学魔术师的奇幻世界(第四季)——魔棒点灯" href="javascript:void(0)" 
  target="_blank">【飞遍化学】化学魔术师的奇...</A><SPAN>11,878						</SPAN></LI>
  <LI><A title="依心依意学语文之“一山一水一佳人”" href="javascript:void(0)" 
  target="_blank">依心依意学语文之“一山一水...</A><SPAN>6,692						</SPAN></LI>
  <LI><A title="新三年级语文全年学习规划" href="javascript:void(0)" 
  target="_blank">新三年级语文全年学习规划</A><SPAN>3,827						</SPAN></LI></UL></DIV><!-- ad -->
<DIV class="advert"><A onClick="videoPlay('javascript:void(0)','http://www.xueersi.com/flash/xueersiPlayer.swf?1401182702')" 
href="javascript:void(0);"><IMG src="公开课-学而思网校_files/14044526436453.jpg" width="235"></A></DIV>
<DIV class="advert img_235_83 advert_first"><A href="javascript:void(0)" 
target="_blank"><IMG src="公开课-学而思网校_files/14029693541262.jpg" 
width="235"></A></DIV>
<DIV class="advert img_235_83"><A href="javascript:void(0)" 
target="_blank"><IMG src="公开课-学而思网校_files/13838051928172.jpg" 
width="235"></A></DIV></DIV></DIV></DIV><!-- layout end--></DIV><!--内容 end-->
<SCRIPT src="公开课-学而思网校_files/swfobject.js"></SCRIPT>

<SCRIPT>

$(function(){

	  $("div.holder").jPages({
	    containerID : "itemContainer",
	    first       : "first",
	      previous    : "previous",
	      next        : "next",
	      last        : "last"
	  });

	});

 
</SCRIPT>

<SCRIPT type="text/javascript">
	//更多条件
//	function getStyle(obj, attr){
//		return obj.currentStyle?obj.currentStyle[attr]:getComputedStyle(obj, false)[attr];
//	}
//
//	function startMove(obj, json, fn){
//		clearInterval(obj.timer);
//		obj.timer=setInterval(function (){
//			doMove(obj, json, fn);
//		}, 30);
//	}
//
//	function doMove(obj, json, fn){
//		var attr='';
//		var iCur=0;
//		var iStop=0;
//		for(attr in json){
//			if(attr=='opacity'){
//				iCur=parseInt(parseFloat(getStyle(obj, attr))*100);
//			}
//			else{
//				iCur=parseInt(getStyle(obj, attr));
//			}
//				
//			var iSpeed=(json[attr]-iCur)/8;
//			iSpeed=iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);
//				
//			if(iCur!=json[attr]){
//				iStop++;
//				if(attr=='opacity'){
//					obj.style.filter='alpha(opacity:'+(iCur+iSpeed)+')';
//					obj.style.opacity=(iCur+iSpeed)/100;
//				}
//				else{
//					obj.style[attr]=iCur+iSpeed+'px';
//				}
//			}
//		}
//			
//		if(iStop==0){
//			clearInterval(obj.timer);
//			if(fn){
//				fn();
//			}
//		}
//	}
//
//	function play(){
//		var oDiv = $('#play');
//		var oOl = oDiv.find('ol');
//		var oUl = oDiv.find('ul');
//		if(oDiv.length == 0 || oOl.length == 0 || oUl.length == 0){
//			return;
//		}
//		oOl = oOl[0];
//		oUl = oUl[0];
//		var aLiBtn=oOl.getElementsByTagName('li');
//		var aLiAds=oUl.getElementsByTagName('li');
//		var iNow=0;
//		var timer=null;
//		var i=0;
//		
//			
//		for(i=0;i<aLiBtn.length;i++){
//			aLiBtn[i].index=i;
//			aLiBtn[i].onmouseover=function (){
//				clearInterval(timer);
//				iNow=this.index;
//				tab();
//			};
//			aLiBtn[i].onmouseout=function (){
//				timer=setInterval(function (){
//					iNow=(iNow+1)%aLiBtn.length;
//					tab();
//				}, 4000);
//			};
//			aLiAds[i].onmouseover=function(){
//				clearInterval(timer);
//			}
//			aLiAds[i].onmouseout=function(){
//					timer=setInterval(function (){
//					iNow=(iNow+1)%aLiBtn.length;
//					tab();
//				}, 4000);
//			}
//		}
//		oDiv.onmouseout=function (){
//			timer=setInterval(function (){
//				iNow=(iNow+1)%aLiBtn.length;
//				tab();
//			}, 4000);
//		};
//		oDiv.onmouseout();
//		function tab(){
//			for(i=0;i<aLiBtn.length;i++){
//				aLiBtn[i].className='';
//				startMove(aLiAds[i], {opacity:0});
//				aLiAds[i].style.zIndex=12;//层级加在这里
//			}
//			aLiAds[iNow].style.zIndex++;//和这里
//			aLiBtn[iNow].className='active';
//			startMove(aLiAds[iNow], {opacity:100});
//		}
//
//		
//	}
//	play();
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
		var oDiv=document.getElementById('play');											
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
			aLiBtn[iNow].className='active';
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
								window.location.href='http://login.xueersi.com/user/login/aHR0cDovL3d3dy54dWVlcnNpLmNvbS9vcGVuQ291cnNlLw==';
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
<!--内容 end-->
<SCRIPT src="公开课-学而思网校_files/xue.page.index.js"></SCRIPT>
<!--底部 start -->
<jsp:include page="footer_share.jsp"/><!--底部 end--></BODY></HTML>

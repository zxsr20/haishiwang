// JavaScript Document
var logger = window.console;
var videoPop = document.getElementById("videoPop");
function show(){
	videoPop.style.display = "block";
	setTimeout(function(){
		videoPop.style.display = "none";
	},2000)
}
//videoPop
(function($){
	var goToTopTime;
	$.fn.goToTop=function(options){
		var opts = $.extend({},$.fn.goToTop.def,options);
		var $window=$(window);
		$body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body'); // opera fix
		//$(this).hide();
		var $this=$(this);
		clearTimeout(goToTopTime);
		goToTopTime=setTimeout(function(){
			var controlLeft;
			if ($window.width() > opts.pageHeightJg * 2 + opts.pageWidth) {
				controlLeft = ($window.width() - opts.pageWidth) / 2 + opts.pageWidth + opts.pageWidthJg;
			}else{
				controlLeft = $window.width()- opts.pageWidthJg-$this.width();
			}
			var cssfixedsupport=$.browser.msie && parseFloat($.browser.version) < 7;//判断是否ie6
			var controlTop=$window.height() - $this.height()-opts.pageHeightJg;
			controlTop=cssfixedsupport ? $window.scrollTop() + controlTop : controlTop;
			var shouldvisible=( $window.scrollTop() >= opts.startline )? true : false;
			
			if (shouldvisible){
				$this.stop().show();
			}else{
				$this.stop().hide();
			}
			
			$this.css({
				position: cssfixedsupport ? 'absolute' : 'fixed',
				top: controlTop,
				left: controlLeft-4,
			});
		},30);
		
		$(this).click(function(event){
			$body.stop().animate( { scrollTop: $(opts.targetObg).offset().top}, opts.duration);
			$(this).blur();
			event.preventDefault();
			event.stopPropagation();
		});
	};
	
	$.fn.goToTop.def={
		pageWidth:0,//页面宽度
		pageWidthJg:0,//按钮和页面的间隔距离
		pageHeightJg:100,//按钮和页面底部的间隔距离
		startline:400,//出现回到顶部按钮的滚动条scrollTop距离
		duration:200,//回到顶部的速度时间
		targetObg:"body"//目标位置
	};
})(jQuery);
$(function(){
	$('<div href="javascript:;" class="backToTop" title="返回顶部">返回顶部</div>').appendTo("body");
});
//Go to Top
function switchv_tabNav(n){
	for(var i = 1; i <= 3; i++){
		var v_tabNav_i = document.getElementById("v_tabNav_" + i);
		var v_tabCon_i = document.getElementById("v_tabCon_" + i);
		if((null != v_tabNav_i) && (null != v_tabCon_i)){
			v_tabNav_i.className = "";
			v_tabCon_i.setAttribute("hide","0");
			v_tabCon_i.style.display = "none";
		}
	}

	var v_tabNav_n = document.getElementById("v_tabNav_" + n);
	var v_tabCon_n = document.getElementById("v_tabCon_" + n);
	if((null != v_tabNav_n) && (null != v_tabCon_n)){
		v_tabNav_n.className = "on";
		v_tabCon_n.setAttribute("hide","1");
		v_tabCon_n.style.display = "block";
	}
}
// Tab 切换
function switchl_tabNav(n){
	for(var i = 1; i <= 7; i++){
		document.getElementById("l_tabNav_" + i).className = "";
		document.getElementById("l_tabCon_" + i).style.display = "none";
	}
	document.getElementById("l_tabNav_" + n).className = "current";
	document.getElementById("l_tabCon_" + n).style.display = "block";
}
// 直播Tab 切换 
$(document).ready(function(){
	$(".select_box").click(function(event){   
		event.stopPropagation();
		$(this).find(".option").toggle();
		$(this).parent().siblings().find(".option").hide();
	});
	$(document).click(function(event){
		var eo=$(event.target);
		if($(".select_box").is(":visible") && eo.attr("class")!="option" && !eo.parent(".option").length)
		$('.option').hide();									  
	});
	/*赋值给文本框*/
	$(".option a").click(function(){
		var value=$(this).text();
		$(this).parent().siblings(".select_txt").text(value);
		$("#select_value").val(value);
		chgPage();
	});
})
//选集
var pop1;
$(document).ready(function(){
	$(".share_More").click(function(){
		var pop1 = $(".share_Hidden").is(":hidden");
		var root = getInputValue("root", "");
		if(!pop1){
			$(".share_More").css("background-color","#f6f6f6")
			$(".share_More").html("<img src=\"" + root + "/images/v_tabNav_moreIcon.gif\" />");
		}else{
			$(".share_More").css("background-color","#ff4e00")
			$(".share_More").html("<img src=\"" + root + "/images/v_tabNav_moreIcon_on.gif\" />");
			}
	$(".share_Hidden").slideToggle("fast");
	});
});
//share
var pop2;
$(document).ready(function(){
	$(".ucLogin").click(function(){
		var pop2 = $(".popLogin").is(":hidden");
		if(!pop2){
			$(".ucLogin").css("background-position","-18px 4px");
			$(".ucLogin a").css("color","#555")
		}else{
			$(".ucLogin").css("background-position","-89px 4px");
			$(".ucLogin a").css("color","#ff4e00")
			}
	$(".popLogin").slideToggle("fast");
	});
});
//index.popLogin
//搜索修改
var pop3;
$(document).ready(function(){
	$(".ucSearch").click(function(){
		var keyword = getInputValue("header_keyword", "");
		if((null != keyword) && ("" != keyword)){
			submitSearch("header_keyword");
		}else{
			var pop2 = $(".popSearch").is(":hidden");
			if(!pop2){
				$(".ucSearch").css("background-position","-55px 4px");
				$(".ucSearch a").css("color","#555")
			}else{
				$(".ucSearch").css("background-position","-126px 4px");
				$(".ucSearch a").css("color","#ff4e00")
			}
			$(".popSearch").slideToggle("fast");
		}
	});
});
//index.popSearch



function sr_tabNav(n){
for(var i = 1; i <= 3; i++){
    document.getElementById("sr_tabNav_" + i).className = "";
    document.getElementById("sr_tabCon_" + i).style.display = "none";
}
document.getElementById("sr_tabNav_" + n).className = "searchResultNav_cur";
document.getElementById("sr_tabCon_" + n).style.display = "block";
}
//searchResult Tab

//翻页
function chgPage(){
	var select_value = $("#select_value").val();
	var pageSize = Number($("#pageSize").val());
	var selectPage = Number(select_value.substring(select_value.indexOf('-') + 1, select_value.length));
	var pageNum = parseInt(selectPage / pageSize);
	pageNum = ((selectPage % pageSize) == 0) ? pageNum : pageNum + 1;
	var currentPageUrl = window.location.href;
	var newPageUrl = null;
	var pageNoIndex = currentPageUrl.indexOf("pagenum=");
	if (pageNoIndex > -1) {
		var pageUrlPrefix = currentPageUrl.substring(0, pageNoIndex + "pagenum=".length);
		var nextAndCharIndex = currentPageUrl.indexOf('&', pageNoIndex);
		if (nextAndCharIndex > -1) {
			var pageUrlSuffix = currentPageUrl.substring(nextAndCharIndex);
			newPageUrl = pageUrlPrefix + pageNum + pageUrlSuffix;
		} else {
			newPageUrl = pageUrlPrefix + pageNum;
		}
	} else {
		if (currentPageUrl.indexOf('?') > -1) {
			newPageUrl = currentPageUrl + "&pagenum=" + pageNum;
		} else {
			newPageUrl = currentPageUrl + "?pagenum=" + pageNum;
		}
	}
	window.location.href = newPageUrl;
}

function submitSearch(keywordid){
	var root = getInputValue("root", "");
	var userId = getInputValue("system_user_id", "");
	var keyword = getInputValue(keywordid, "");
	if((null != keyword) && ("" != keyword)){
		keyword = encodeURIComponent(keyword);
		logger.log("keyword is : " + keyword);
		window.location.href= root + "/common/searchResults_ShortVideo.jsp?u=" + userId + "&kw=" + keyword;
	}else{
		event.preventDefault();
		var searchContainer = document.getElementById("popSearch");
		if(null != searchContainer){
			searchContainer.style.display = "none";
		}
		logger.log("search keyword is empty!");
	}
}

function getInputValue(id, defVal){
	if((null == id) || ("" == id)){
		return defVal;
	}

	var value = "";
	var inputEle = document.getElementById(id);
	if((null == inputEle) || (null == inputEle.value)){
		value = defVal;
	}else{
		value = inputEle.value;
		if("" == value){
			value = defVal;
		}
	}

	return value;
}

function goBack(){
	window.history.go(-1);
}
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script type="text/javascript">
var ajaxUrl;
var showDivName;
var ajaxFunctionName;
jQuery.extend({
	pageAjax: function(url,div,functionName){
		ajaxUrl=url;
		showDivName=div;
		ajaxFunctionName=functionName;
		$.ajax({
			url:url,
			data:{"page":$('#pagePage').val(),"rows":$('#pageRows').val()},
			dataType: "json",
			success: function(data){
				eval(functionName+"(data)"); 
				$.changePageAjax(data);
			    showWin(div);
			}
		});
	},
	pageAjaxOfParam: function(url,div,functionName,key,value){
		$.ajax({
			url:url,
			data:{"pageRequest.page":$('#pagePage').val(),"pageRequest.rows":$('#pageRows').val(),"key":key,"value":value},
			dataType: "json",
			success: function(data){
				eval(functionName+"(data)"); 
				$.changePageAjax(data);
			    showWin(div);
			}
		});
	}
	,
	changePageAjax: function(data) {
		var totalCount = data.total; 
		changeDefaultRows(data);
		var pageCount = totalCount % parseInt($("#pageRows").val())== 0 ? 
					parseInt(totalCount/parseInt($("#pageRows").val())):
					parseInt(totalCount/parseInt($("#pageRows").val()))+1;
		$("#totalPage").html(pageCount+''); 
		$("#totalCount").html(totalCount+'');
		changeButton(pageCount); 
	}
});

function changePage(pageTitle) {
	if(pageTitle == "previous"){
		$('#pagePage').val(parseInt($('#pagePage').val()) - 1);
	}else if(pageTitle == "next"){
		$('#pagePage').val(parseInt($('#pagePage').val()) + 1);
	}else if(pageTitle == "first"){
		$('#pagePage').val(1);
	}else if(pageTitle == "last"){
		var totalCount = parseInt($('#totalCount').html());
		$('#pagePage').val(parseInt((totalCount - 1) / parseInt($('#pageRows').val()) + '') + 1);
	}
	go();
}

function goToPointedPage(){
	var pointedPageNum = $('#forwardPageNum').val();
	var patrn = /^\+?[1-9][0-9]*$/;
	if(!patrn.exec(pointedPageNum)){
		alert('页数请输入正整数');
		return;
	}
	if(parseInt(pointedPageNum) > parseInt($('#totalPage').html())){
		alert('输入页数不得超过最大页数');
		return;
	}
	$('#pagePage').val(parseInt(pointedPageNum));
	go();
}

function changeButton(pageCount){
	$('#forwardPageNum').val($('#pagePage').val());
	if(pageCount == 1){
		$("#beforePage").attr("disabled","disabled");  
		$("#firstPage").attr("disabled","disabled");  
		$("#nextPage").attr("disabled","disabled");   
		$("#lastPage").attr("disabled","disabled"); 
	}else if($("#forwardPageNum").val() < pageCount){  //如果页数比总页数小，则下一页和末页能用
		$("#nextPage").removeAttr("disabled");
		$("#lastPage").removeAttr("disabled");
		if($("#forwardPageNum").val() >1){     //如果页数大于1，说明 页数小于总页数说明全部都可用  
			$("#firstPage").removeAttr("disabled");
			$("#beforePage").removeAttr("disabled");
		}else{										//在页数比总页数小的其他情况下，就只存在一种就是等于1 
			$("#firstPage").attr("disabled","disabled");  //当等于1 的时候，首页和上一页不可用
			$("#beforePage").attr("disabled","disabled");
		}
	} else{
		$("#beforePage").removeAttr("disabled");  
		$("#firstPage").removeAttr("disabled"); 
		$("#nextPage").attr("disabled","disabled");
		$("#lastPage").attr("disabled","disabled");
	}
}

function changeDefaultRows(data){
	if($("#pageRows").val()==null||$("#pageRows").val()==""){
		$("#pageRows").empty();
		$("#pageRows").append("<option value='"+data.pAGESIZES[0]+"'>默认条数</option><option value='"+data.pAGESIZES[1]+"'>"+data.pAGESIZES[1]+"</option><option value='"+data.pAGESIZES[2]+"'>"+data.pAGESIZES[2]+"</option>");
   }
}

function changeRows(){
	$('#pagePage').val(1);
	go();
}
function go(){
	$.pageAjax(ajaxUrl,showDivName,ajaxFunctionName);
}

function clearPageInfo(){
	$("#pagePage").val('1');
}

$(function(){
	$("body").keydown(function(event){
    	 if(event.keyCode == 13){
    		 goToPointedPage();
     	}
  	}); 
});

</script>
<div class="toolbarScroll">
	<input  type="hidden" name="pageRequest.page" id="pagePage"  value="1"/>
	<input id="firstPage" value=" 首页 " type="button" onclick="changePage('first')"  />
	<input id="beforePage" value=" 上一页 " type="button" onclick="changePage('previous')"/>
	<input size="6" maxlength="3" id="forwardPageNum" class="formStylePage" onblur="goToPointedPage()" value="" type="text" style="text-align: center;"/>/
	<span class="currentPage" id="totalPage">
	</span>
	<input id="nextPage" value=" 下一页 " type="button"  onclick="changePage('next')"/>
	<input id="lastPage" value=" 末页 " type="button" onclick="changePage('last')"/>
	共<span id="totalCount"></span>条
	<span>
	     <input  type="hidden" name="pageRequest.page" id="pageRows"  value="10" />
	</span>
</div>
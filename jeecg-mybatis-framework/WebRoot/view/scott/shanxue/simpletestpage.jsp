
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/view/resource1.jsp"%>


<TITLE></TITLE>


<script type="text/javascript">
function pageAjax(){
    var url="<%=basePath%>/sxCourse/dataList.do";
    $.pageAjax(url,"productMessageDiv","showList");
}

function selectProduct(){
	pageAjax();
}

function showList(data){
	var list=data.rows;
	  var str;
	  if(list==""||list==null){
		str="<tr><td colspan=\"9\"><span class=\"tip\">系统无纪录!</span></td></tr>";				  
	  }else{
		  for(var i=0;i<list.length;i++){
		  	str=str+" <tr id=\"contentTr"+i+"\"><td><input name=\"selectIds\" type=\"checkbox\" value=\""+list[i].id+"\"/></td><td>"+list[i].id+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td><td>"+list[i].name+"</td></tr>";
		  }
	  }
	  if($('#key').val()==""||$('#key').val()==null)$('#key').append("<option value='productName'>产品名称</option><option value='productCode'>产品编号</option>");
	  $("#msgContent").empty();
	  $("#msgContent").append(str);
}
</script>



</head>
<body>
<div >
	<div id="productMessageDiv" class="showParentDiv" style="width:950px;height:400px">
                <div id="showProductListMsg">
			         <div class="grayBg">
			             <div id="toolbarScroll">
							 <span>
						         <input type="button" value=" 确定 " onclick="submitProductMessage();"/>
			             		 <input type="button" value=" 取消 " onclick="closeProduct();"/> 
						         <input type="button"   value=" 查询 " onclick="selectProduct();" />
						      	 <input id="value" name="value" type="text" class="width_132"/>
								 <select id="key" name="key" class="width_115">
								 </select>
			        		 </span>
			             </div>
				    	<div class="page" id="page">
				        	<jsp:include page="page_ajax.jsp"/>
				        </div>
				        <div class="clearFloat"></div>
				    </div>
		      	<div class="scrollInfo">
			        <div class="tableInfo"  style="overflow-y:scroll; height:365px;">
				        	<table id="dragTable" border="0" cellpadding="0" cellspacing="0" id="listTable">
					            <thead>
					                <tr>
					                    <td width="4%">
					                    	<input type="checkbox" id="selectallCheckBox"  onclick="selectListall();"/>
					                    </td>
										<td width="%">产品编码</td>
										<td width="%">产品名称</td>
										<td width="%">产品型号</td>
										<td width="%">产品品牌</td>
										<td width="%">产品分类</td>
										<td width="%">供应商</td>
										<td width="%">产品规格</td>
					                </tr>
					            </thead>
					            <tbody id="msgContent">	
					            	
					        	</tbody>
				        	</table> 
			        </div>
			    </div>
  
</body>
</html>

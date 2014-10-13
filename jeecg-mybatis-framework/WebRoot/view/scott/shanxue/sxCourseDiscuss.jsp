<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%@include file="/view/resource.jsp" %>
  </head>
  <body class="easyui-layout">
 	 <!-- Search panel start -->
 	 <div class="ui-search-panel" region="north" style="height: 80px;" title="过滤条件" data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false" >  
 	 <form id="searchForm">
        <p class="ui-fields">
			<label class="ui-label">:</label><input name="toid" class="easyui-box ui-text" style="width:100px;">
			<label class="ui-label">用户id:</label><input name="userid" class="easyui-box ui-text" style="width:100px;">
	    </p>
	    <a href="#" id="btn-search" class="easyui-linkbutton" iconCls="icon-search">查询</a>
      </form>  
     </div> 
     <!--  Search panel end -->

     <!-- Data List -->
     <div region="center" border="false" >
     <table id="data-list"></table>
	 </div>
	 
     <!-- Edit Win&Form -->
     <div id="edit-win" class="easyui-dialog" title="Basic window" data-options="closed:true,iconCls:'icon-save',modal:true" style="width:400px;height:380px;">  
     	<form id="editForm" class="ui-form" method="post">  
     		 <input class="hidden" name="id">
     		 <div class="ui-edit">
		     	   <div class="ftitle">课程讨论表</div>
					<div class="fitem">
						<label></label>
						<input name="toid" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写">
					</div>
					<div class="fitem">
						<label>用户id</label>
						<input name="userid" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写用户id">
					</div>
					<div class="fitem">
						<label></label>
						<input name="username" type="text" maxlength="50" class="easyui-validatebox" data-options="" missingMessage="请填写">
					</div>
					<div class="fitem">
						<label>课程id</label>
						<input name="courseid" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写课程id">
					</div>
					<div class="fitem">
						<label>节目id</label>
						<input name="programid" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写节目id">
					</div>
					<div class="fitem">
						<label>什么时候看的</label>
						<input name="content" type="text" maxlength="2000" class="easyui-validatebox" data-options="" missingMessage="请填写什么时候看的">
					</div>
					<div class="fitem">
						<label>CREATE_BY</label>
						<input name="create_by" type="text" maxlength="36" class="easyui-validatebox" data-options="" missingMessage="请填写CREATE_BY">
					</div>
					<div class="fitem">
						<label>CREATE_DATE</label>
						<input name="create_date" type="text" maxlength="" class="easyui-datetimebox" data-options="" missingMessage="请填写CREATE_DATE">
					</div>
					<div class="fitem">
						<label>UPDATE_BY</label>
						<input name="update_by" type="text" maxlength="36" class="easyui-validatebox" data-options="" missingMessage="请填写UPDATE_BY">
					</div>
					<div class="fitem">
						<label>UPDATE_DATE</label>
						<input name="update_date" type="text" maxlength="" class="easyui-datetimebox" data-options="" missingMessage="请填写UPDATE_DATE">
					</div>
					<div class="fitem">
						<label>DELFLAG</label>
						<input name="delflag" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写DELFLAG">
					</div>
					<div class="fitem">
						<label>DEL_DATE</label>
						<input name="del_date" type="text" maxlength="" class="easyui-datetimebox" data-options="" missingMessage="请填写DEL_DATE">
					</div>
  			</div>
     	</form>
  	 </div>
  	 <script type="text/javascript" src="<%=basePath%>/view/scott/shanxue/page-sxCourseDiscuss.js"></script>
  </body>
</html>

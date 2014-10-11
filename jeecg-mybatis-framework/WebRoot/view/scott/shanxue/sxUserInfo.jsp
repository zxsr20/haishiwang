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
			<label class="ui-label">名称:</label><input name="name" class="easyui-box ui-text" style="width:100px;">
			<label class="ui-label">昵称:</label><input name="nick_name" class="easyui-box ui-text" style="width:100px;">
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
		     	   <div class="ftitle">用户表</div>
					<div class="fitem">
						<label>名称</label>
						<input name="name" type="text" maxlength="50" class="easyui-validatebox" data-options="" missingMessage="请填写名称">
					</div>
					<div class="fitem">
						<label>昵称</label>
						<input name="nick_name" type="text" maxlength="50" class="easyui-validatebox" data-options="" missingMessage="请填写昵称">
					</div>
					<div class="fitem">
						<label>用户类型</label>
						<input name="user_type" type="text" maxlength="1" class="easyui-validatebox" data-options="" missingMessage="请填写用户类型">
					</div>
					<div class="fitem">
						<label>email</label>
						<input name="email" type="text" maxlength="30" class="easyui-validatebox" data-options="" missingMessage="请填写email">
					</div>
					<div class="fitem">
						<label>手机</label>
						<input name="phone" type="text" maxlength="15" class="easyui-validatebox" data-options="" missingMessage="请填写手机">
					</div>
					<div class="fitem">
						<label>qq</label>
						<input name="qq" type="text" maxlength="15" class="easyui-validatebox" data-options="" missingMessage="请填写qq">
					</div>
					<div class="fitem">
						<label>地址</label>
						<input name="address" type="text" maxlength="100" class="easyui-validatebox" data-options="" missingMessage="请填写地址">
					</div>
					<div class="fitem">
						<label>图片地址</label>
						<input name="picture" type="text" maxlength="300" class="easyui-validatebox" data-options="" missingMessage="请填写图片地址">
					</div>
					<div class="fitem">
						<label>描述</label>
						<input name="description" type="text" maxlength="1000" class="easyui-validatebox" data-options="" missingMessage="请填写描述">
					</div>
					<div class="fitem">
						<label>是否激活</label>
						<input name="activated" type="text" maxlength="1" class="easyui-validatebox" data-options="" missingMessage="请填写是否激活">
					</div>
					<div class="fitem">
						<label>密码</label>
						<input name="password" type="text" maxlength="50" class="easyui-validatebox" data-options="" missingMessage="请填写密码">
					</div>
					<div class="fitem">
						<label>支付宝账号</label>
						<input name="alipay_account" type="text" maxlength="30" class="easyui-validatebox" data-options="" missingMessage="请填写支付宝账号">
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
  	 <script type="text/javascript" src="<%=basePath%>/view/scott/shanxue/page-sxUserInfo.js"></script>
  </body>
</html>

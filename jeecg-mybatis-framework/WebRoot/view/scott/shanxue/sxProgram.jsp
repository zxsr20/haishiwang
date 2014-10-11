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
			<label class="ui-label">文件地址或者url:</label><input name="file_url" class="easyui-box ui-text" style="width:100px;">
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
		     	   <div class="ftitle">节目表</div>
					<div class="fitem">
						<label>名称</label>
						<input name="name" type="text" maxlength="100" class="easyui-validatebox" data-options="" missingMessage="请填写名称">
					</div>
					<div class="fitem">
						<label>文件地址或者url</label>
						<input name="file_url" type="text" maxlength="300" class="easyui-validatebox" data-options="" missingMessage="请填写文件地址或者url">
					</div>
					<div class="fitem">
						<label>文件类型</label>
						<input name="file_type" type="text" maxlength="20" class="easyui-validatebox" data-options="" missingMessage="请填写文件类型">
					</div>
					<div class="fitem">
						<label>文件播放时长</label>
						<input name="play_length" type="text" maxlength="10" class="easyui-validatebox" data-options="" missingMessage="请填写文件播放时长">
					</div>
					<div class="fitem">
						<label>课程id</label>
						<input name="course_id" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写课程id">
					</div>
					<div class="fitem">
						<label>顶</label>
						<input name="peak" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写顶">
					</div>
					<div class="fitem">
						<label>踩</label>
						<input name="tread" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写踩">
					</div>
					<div class="fitem">
						<label>评论次数</label>
						<input name="comment_time" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写评论次数">
					</div>
					<div class="fitem">
						<label>用户id</label>
						<input name="userid" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写用户id">
					</div>
					<div class="fitem">
						<label>描述</label>
						<input name="description" type="text" maxlength="1000" class="easyui-validatebox" data-options="" missingMessage="请填写描述">
					</div>
					<div class="fitem">
						<label>花费金额</label>
						<input name="cost" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写花费金额">
					</div>
					<div class="fitem">
						<label>图片地址</label>
						<input name="picture" type="text" maxlength="300" class="easyui-validatebox" data-options="" missingMessage="请填写图片地址">
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
					
					<div class="fitem">
						<label>文件上传</label>
						<td><input type="file" name="uploadify" id="file_upload" /><hr>
    <a class="easyui-linkbutton" onclick="startUpload('personnel');" href="javascript:void(0);">开始上传</a>   
    <a href="javascript:$('#file_upload').uploadify('cancel', '*')" class="easyui-linkbutton">取消所有上传</a>   
    
     
    </td>
					</div>
  			</div>
     	</form>
  	 </div>
  	 <script type="text/javascript" src="<%=basePath%>/view/scott/shanxue/page-sxProgram.js"></script>
  	 <script type="text/javascript">
  	 
  	
  	 $(function(){
	
    uploadify();
});
var idName="";

function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    projectName = "/";
    return(localhostPaht+projectName);
};



function uploadify(){


    $("#file_upload").uploadify({  
        'height'        : 27,   
        'width'         : 80,    
        'buttonText'    : '添加附件',  
        'swf'           : getRootPath()+'/js/uploadify/uploadify.swf?ver=' + Math.random(),  
        'uploader'      : 'http://bcs.duapp.com/lvyou02/111',  
        'auto'          : false, 
        'fileSizeLimit' : '2048576KB', 
        'fileTypeExts'  : '*.doc;*.mp4;*.flv; *.jpg; *.rar', 
        'cancelImg' :  getRootPath()+'/js/uploadify/uploadify-cancel.png',
        'uploadLimit' : 3, 
       // 'formData'      : {'userName':'','content':''},  
        'onUploadStart' : function(file) {
        },  
        'onUploadSuccess':function(file, data, response){  
            //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
             alert('成功');
        },  
        'onUploadComplete':function(){  
           // $('#importLispDialog').window('close');  
        }  
    });  
}
  	 
var idName="";




function startUpload(name){  
	
	//name = $(".filename").text();
	//int i = name.indexOf("(");
	//name = name.substr(0,i);
            idName=name;    
         $('#file_upload').uploadify('upload','*');  
} 
  	 </script>
  </body>
</html>

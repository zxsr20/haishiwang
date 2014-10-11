/*
	author:wubin
	date  :2013.7.16
	description:ajax工具类
*/
var ajaxUtils = {
	//是否异步
	_async:true,
	//创建xhr对象，兼容ie5、6及主流浏览器
	_createXMLHttpRequest:function(){
		var xhr;
		//ie 5.6
		if (window.ActiveXObject){
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		} 
		//其他浏览器
		else if (window.XMLHttpRequest){
			xhr = new XMLHttpRequest();
		}
		return xhr;
	},
	//格式化请求数据
	_fomartParam:function(data){
		var dataStr="";
		if(typeof(data)=='object'){
			for(var key in data){
				dataStr += key+"="+data[key]+"&";
			}
			if(dataStr.length>2){
				dataStr = dataStr.substring(0, dataStr.length-1);
			}
		}else if(typeof(data)=='string') {
			dataStr = data;
		}
		return dataStr;
	},
	
	//发起Ajax请求
	_startAjaxRequest:function(method,isPost,url,data,callBack,type,async){
		var xhr = this._createXMLHttpRequest();
		if(async!=null){
			this._async = async;
		}
		xhr.open(method, url, this._async);
		if(isPost){
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		}
		xhr.send(data);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				if('xml'==type){
					callBack(xhr.responseXML);
				}else{
					callBack(xhr.responseText);
				}
			}
		}     
	},
	/*ajax post方法
		url      必须    请求链接
		data     必须    数据      可以为js对象、name=jake&sex=man 键值对形式
		callBack 必须    回调函数  传入方法句柄
		type     非必须  返回类型  xml  为xml  否则为text
		async    非必填  是否异步  true（异步）或 false（同步）
	*/
	doPost:function(url,data,callBack,type,async){
		var data = this._fomartParam(data);
		this._startAjaxRequest("POST",true,url,data,callBack,type,async);
	},
	/*ajax get方法
		参数同post
	*/
	doGet:function(url,data,callBack,type,async){
		var param = this._fomartParam(data);
		url = url+"?"+param;
		data = null;
		this._startAjaxRequest("GET",false,url,data,callBack,type,async);
	}

}
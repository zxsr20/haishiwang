/**
 *@description:互动管理功能js
 *主要包含顶踩数查询、是否顶驳查询、是否收藏查询
 *顶踩接口、收藏接口、分享接口
 */

//字符编码转换，gbk转utf-8
var easyUTF8 = function(gbk){
	if(!gbk){return;}  
	var utf8 = [];  
	for(var i=0;i<gbk.length;i++){  
		var s_str = gbk.charAt(i);  
		if(!(/^%u/i.test(escape(s_str)))){utf8.push(s_str);continue;}  
		var s_char = gbk.charCodeAt(i);  
		var b_char = s_char.toString(2).split('');  
		var c_char = (b_char.length==15)?[0].concat(b_char):b_char;  
		var a_b =[];  
		a_b[0] = '1110'+c_char.splice(0,4).join('');  
		a_b[1] = '10'+c_char.splice(0,6).join('');  
		a_b[2] = '10'+c_char.splice(0,6).join('');  
		for(var n=0;n<a_b.length;n++){  
			utf8.push('%'+parseInt(a_b[n],2).toString(16).toUpperCase());  
		}  
	}  
	return utf8.join('');  
}

function doInteract(data,handler){
	var root = $("#root").val();
	var url = root + "/common/interact.jsp";
	url = url.replace(":80","");
	ajaxUtils.doGet(url,data,function(jsonStr){
		// logger.log("response str \n" + jsonStr);
		jsonStr = trim(jsonStr);
		if((null != jsonStr) && ("" != jsonStr)){
			var obj = eval("(" + jsonStr + ")");
			handler(obj);
		}else{
			logger.log("respones json is empty!");
		}
	});
}

function initInteract(){
	queryDingCount();
	queryIsActedDing();
	queryIsActedFavorite();
}

function actInteract(type){
	if( true != isUserLogin()){
		alert("\u60a8\u672a\u767b\u5f55\uff0c\u8bf7\u5148\u767b\u5f55\u540e\u518d\u4f7f\u7528!");
	}else{
		if("ding" == type){
			actDing();
		// }else if("favorite" == type){
			// actFavorite();
		}else if("share" == type){
			actShare();
		}
	}
}
function queryDingCount(){
	var queryDingCountData = {"interfaceNum":1};
	queryDingCountData["userid"] = getInteractUserId();
	queryDingCountData["currentAssetId"] = getInputValue("currentAssetId", "");
	
	var queryDingCountSuccess = function(jsonData){
		if(null != jsonData){
			var dingCount = jsonData.nrjhactcnt.cntlist.cntinfo[0].cnt;
			document.getElementById("ding").innerHTML = dingCount;
		}else{
			logger.log("query ding count error!");
		}
	};
	
	doInteract(queryDingCountData, queryDingCountSuccess);
}

function queryIsActedDing(){
	var queryIsActedDingData = {"interfaceNum":10};
	queryIsActedDingData["userid"] = getInteractUserId();
	queryIsActedDingData["currentAssetId"] = getInputValue("currentAssetId", "");
	
	var queryIsActedDingSuccess = function(jsonData){
		if(null != jsonData){
			var isdone = jsonData.nrjh.isdone;
				if(0 == Number(isdone)){
					document.getElementById("ding").className = "";
					document.getElementById("ding").onclick = function(){
						actInteract("ding");
					};					
				}else{
					document.getElementById("ding").className = "on";
					document.getElementById("ding").onclick = function(){
						logger.log("repeat act ding action fail!");
					};
				}
		}else{
			logger.log("query ding count error!");
		}
	};
	
	doInteract(queryIsActedDingData, queryIsActedDingSuccess);
}

function actDing(){
	var actDingData = {"interfaceNum":2};
	actDingData["userid"] = getInteractUserId();
	actDingData["currentAssetId"] = getInputValue("currentAssetId", "");
	
	var actDingSuccess = function(jsonData){
		if(null != jsonData){
			var status = jsonData.nrjhopt.status;
			logger.log("act ding action result: " + status);
			if(1 == Number(status)){
				document.getElementById("ding").className = "on";
				document.getElementById("ding").onclick = function(){
					logger.log("repeat act ding action fail!");
				};				
				queryDingCount();
			}else{
				logger.log("act ding action fail!");
				document.getElementById("ding").className = "";
				document.getElementById("ding").onclick = function(){
					logger.log("repeat act ding action fail!");
				};
			}
		}else{
			logger.log("act ding action error!");
		}
	};
	
	doInteract(actDingData, actDingSuccess);	
}


function queryIsActedFavorite(){
	var queryDingCountData = {"interfaceNum":8};
	queryDingCountData["userid"] = getInteractUserId();
	queryDingCountData["currentAssetId"] = getInputValue("currentAssetId", "");
	
	var queryIsActedFavoriteSuccess = function(jsonData){
		if(null != jsonData){
			var isdone = jsonData.nrjh.isdone;
				if(0 == Number(isdone)){
					document.getElementById("favorite").className = "";
					document.getElementById("favorite").onclick = function(){
						actInteract("favorite");
					};					
				}else{
					document.getElementById("favorite").className = "on";
					document.getElementById("favorite").onclick = function(){
						logger.log("repeat act favorite action fail!");
					};
				}
		}else{
			logger.log("query favorite count error!");
		}
	};
	
	doInteract(queryDingCountData, queryIsActedFavoriteSuccess);
}

function actFavorite(){
	var actFavoriteData = {"interfaceNum":5};
	actFavoriteData["userid"] = getInteractUserId();
	actFavoriteData["currentAssetId"] = getInputValue("currentAssetId", "");
	actFavoriteData["resname"] = getInputValue("resname", "");
	actFavoriteData["backaddr"] = getInputValue("backaddr", "");
	actFavoriteData["resaddr"] = getInputValue("resaddr", "");
	
	var actFavoriteSuccess =function (jsonData){
		if(null != jsonData){
			logger.log(jsonData);
			var status = jsonData.nrjhopt.status;
			if(1 == Number(status)){
				logger.log("act favorite action success!");
				document.getElementById("favorite").className = "on";
				document.getElementById("favorite").onclick = function(){
					logger.log("repeat act favorite action fail!");
				};
			}else{
				document.getElementById("favorite").className = "";
				document.getElementById("favorite").onclick = function(){
					logger.log("repeat act favorite action fail!");
				};
				logger.log("act favorite fail!");
			}
		}else{
			logger.log("act favorite error!");
		}
	};
	
	doInteract(actFavoriteData, actFavoriteSuccess);	
}

function actShare(){
	if(isUserLogin()){
		var u = getInputValue("u", "");
		var userid =  getInteractUserId();
		var currentAssetId = getInputValue("currentAssetId", "");
		var resname = getInputValue("resname", ""); 
		var resnameUTF8 = getInputValue("currentAssetName", "");
		var assetUrl = encodeURIComponent(getInputValue("assetUrl", ""));
		var backToIndexUrl = encodeURIComponent(getInputValue("backToIndexUrl", ""));
		window.location.href="http://inter.tv2.wasu.cn:3018/nrjh/itf/shareEdit.jsp?userid="+userid
								+"&resid="+currentAssetId
								+"&backaddr="+assetUrl
								+"&resaddr="+assetUrl
								+"&resname="+resnameUTF8
								+"&terminalGenre=1";
	}else{
		logger.log("user not login!");
	}
}

/**
 *此处引用user.js里getLoginStatus()方法，获取互动管理系统用户信息
 */
function getInteractUser(){
	var interactUser = getLoginStatus();
	if(null != interactUser){
		return interactUser;
	}
	
	return null;
}

function isUserLogin(){
	var interactUser = getInteractUser();
	if((null != interactUser) && ("object" == typeof(interactUser))){
		if((null != interactUser.user_id) && (null != interactUser.user_token)){
			return true;
		}
	}
	return false;
}

function getInteractUserId(){
	var interactUser = getInteractUser();
	if(null != interactUser){
		return interactUser.user_id;
	}else{
		return "";
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

/**
 *字符串去空
 */
function trim(str){

	if((null != str) && ("" != str)){
		str = str.replace(/(^\s*)|(\s*$)/g, "");
		str = str.replace(/(\s*)/g, "");
	}

	return str;
}
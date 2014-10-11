(function(o){
if(!o || o.MHeader){ return; }

//define variable
var toDomain = function(s){ s = s.replace('http://', ''); if(s[s.length -1] == '/'){ s = s.substr(0, s.length-1); }; return s; }
var MHeader = {
	ids: {'headerbox': 'mheader_box', 'header': 'mheader'},
	dropmenuGroup: null,
	node: null,
	jsres: typeof(mheaderjs) == 'object' ? mheaderjs : null,
	ready: false,
	status: 'fixed',
	rule: 'fixed',
	init: function(){
		this.header = document.getElementById(this.ids.header);
		this.headerbox = document.getElementById(this.ids.headerbox);
		if(!this.header){ return; }
		this.headercss = document.getElementById('headercss');
		var csslink = document.createElement('link');

		this.bind();
		//优先执行的功能不依赖资源加载
		this.Nav.init();
		
		//运行时检测依赖脚本, 如加载立即运行
		var timer = setInterval(function(){
			if(_this.chkres('relyon')){ 
				canrun = true; 
				clearInterval(timer); 
				if(!runed){ _this.bindfns(); runed = true; }
			}
		}, 10);
		//domready后检测依赖脚本, 添加未包含的脚本, 并加载附加功能
		domReady(function(){
			clearInterval(timer); timer = null;

			var addons = function(){
				_this.chkres('addons');
				_this.loadres('addons');	
			}			
		});
	},
	bind: function(){
		var _this = this;
		domReady(function(){
			var timer = setInterval(function(){
				if(_this.ready){
					var t = null;
					var selector = 'textarea,input[txtfor!=headersearch],select';
					$(document)
					.on('focus', selector, function(){
						t = $(this);	
						_this.unfix();
					})
					.on('blur', selector, function(){
						var n = $(this);//失焦获焦UI处理延时
						setTimeout(function(){
							//不是通过另一域获焦而失焦
							if(n.get(0) == t.get(0)){ _this.dofix(); }
						}, 50)
					});
					clearInterval(timer);	
				}	
			}, 25);	
		});
	},
	bindfns: function(){
		this.ready = true;
		this.dropmenuGroup = new DropmenuGroup();
		this.Search.init();
		this.Userlog.init();
		this.Looking.init();
		this.Channel.init();
	},
	dofix: function(){
		return this.changeRule('fixed');
	},
	unfix: function(){
		return this.changeRule('static');
	},
	changeRule: function(rule){
		if(rule != this.rule){
			this.rule = rule;
			this.changePos('setrule');
		}
		return this;	
	},

}


MHeader.Nav = {
	scroller: null,
	init: function(){
		var nav = document.getElementById('mheader_nav');
		if(!nav){ return; }
		this.bind();	
	},
	bind: function(){
		var _this = this;
		
		this.initScroller();
		var box = document.getElementById('mheader_navbox')
		var cur = this.findCurrent();
		var inview = true;

		if(!inview){
			//居中
			var x = cur.offsetLeft + cur.offsetWidth/2 - box.offsetWidth/2;
			this.scroller.scrollTo(-x, 0, 0);
		}
		
		
		
	},
	initScroller: function(){
		var box = document.getElementById('mheader_navbox')
			,mr = 48
			,ul = box.getElementsByTagName('ul')[0]
			,lis = ul.getElementsByTagName('li'),
			current = 0;
		
		//margin-right 定义不同
		var getWidth = function(){
			var w = 0;
			for(var i=0; i<lis.length; i++){
				w += (lis[i].offsetWidth + parseInt(getStyle(lis[i], 'marginRight')));
			}
			return w;
		}
		
		ul.style.width = getWidth() + 'px';
		
		this.scroller = new iScroll('mheader_navbox', {
			bounce:true,
			vScroll:false,
			hScrollbar:false,
			vScrollbar:false
		});
		var x = this.findCurrent().getAttribute("position");
		var cWidth = this.findCurrent().offsetWidth;
		for(var i=0; i<lis.length; i++){
			if(this.findCurrent()===lis[i]){
				current = i;
			}
		}
		this.scroller.scrollTo(-(current*cWidth)+cWidth, 0, 0);
	},
	findCurrent: function(){
		var box = document.getElementById('mheader_navbox')
			,ul = box.getElementsByTagName('ul')[0]
			,lis = ul.getElementsByTagName('li');
		var li = null;
		for(var i=0; i<lis.length; i++){
			var l = lis[i];
			if(l.className && l.className == 'current'){
				li = l;
				break;
			}
		}
		return li;	
	}
}

/*
var DropmenuGroup = function(){
	this.coll = [];	
	this.bind();
}
DropmenuGroup.prototype = {
	bind: function(){
		var _this = this;
		var y0 = 0, y1 = 0;
		$(document).bind(isTouch ? 'touchstart' : 'click', function(e){ 
			_this.hideAll();	
		});
	},
	getLength: function(){
		return this.coll.length;
	},
	isExist: function(dropmenu){
		var len = this.getLength();
		for(var i=0; i<len; i++){
			if(this.coll[i] == dropmenu){
				return true;
			}
		}
		return false;	
	},
	add: function(dropmenu){
		if(dropmenu instanceof Dropmenu && !this.isExist(dropmenu)){
			this.coll.push(dropmenu);
		}
		return this;
	},
	remove: function(dropmenu){
		var len = this.getLength();
		for(var i=0; i<len; i++){
			if(this.coll[i] == dropmenu){
				this.coll.splice(i, 1);
				break;	
			}
		}
		return true;
	},
	hideAll: function(){
		var len = this.getLength();
		for(var i=0; i<len; i++){
			this.coll[i].hide();
		}
		return this;
	},
	hideOther: function(dropmenu){
		var len = this.getLength();
		for(var i=0; i<len; i++){
			if(this.coll[i] != dropmenu){
				this.coll[i].hide();	
			}
		}
		return this;
	}
}

var Dropmenu = function(params){
	var params = typeof(arguments[0]) == 'object' ? params : {}
	this.group = params.group ? params.group : new DropmenuGroup();
	this.handle = params.handle.length ? params.handle : null;
	this.panel = params.panel.length ? params.panel : null;
	this.callback = params.callback ? params.callback : {};
	this.mask = null;
	this.status = 'hide';
	if(!this.handle || !this.panel){ return; }
	this.classname = {'handle': 'wasu-handle-expand',	'mask': 'wasu-panel-mask'};
	this.callback =  {
		'show': typeof(this.callback.show) == 'function' ? this.callback.show : null,
		'hide':	typeof(this.callback.hide) == 'function' ? this.callback.hide : null
	}
	this.init();
}

Dropmenu.prototype = {
	init: function(){
		this.group.add(this);//向菜单组添加	
		this.bind();
	},
	bind: function(){
		var _this = this;
		if(!isSONY){
			this.handle
			.bind('click', function(e){//ios headerfix !touchstart //widnow scroll 意外触发
				_this.toggle();
				return false;	
			})
			.bind('touchstart', function(e){
				e.stopPropagation();	
			});
		}else{
			this.handle.bind('touchstart', function(e){//sony phone //click 有时不触发
				_this.toggle();
				e.stopPropagation();	
				return false;
			});	
		}
		
		this.panel.bind('touchstart click', function(e){
			e.stopPropagation();
		});
	},
	setCallback: function(type, func){
		if(type == 'show' && typeof(func) == 'function'){ this.callback.show = func; }
		if(type == 'hide' && typeof(func) == 'function'){ this.callback.hide = func; }
		return this;
	},
	update: function(html){
		this.panel.html(html + '<iframe scrolling="0" frameborder="0" class="'+ this.classname.mask +'"></iframe>');
		return this;
	},
	show: function(){
		if(this.status == 'show'){ return this; }
		this.group.hideOther(this);
		this.handle.addClass(this.classname.handle);
		this.panel.show();
		if(!this.panel.find('.' + this.classname.mask).length){
			this.panel.append($('<iframe scrolling="0" frameborder="0" class="'+ this.classname.mask +'"></iframe>'));		
		}
		this.status = 'show';
		if(this.callback.show){ this.callback.show(); }
		return this;
	},
	hide: function(){
		if(this.status == 'hide'){ return this; }		
		this.handle.removeClass(this.classname.handle);
		this.panel.hide();
		this.status = 'hide';
		if(this.callback.hide){ this.callback.hide(); }
		return this;
	},
	toggle: function(){
		var status = this.getStatus();
		if(status == 'hide'){ return this.show();	}
		else{ return this.hide(); }
	},
	getStatus: function(){
		return this.status;	
	}
}


*/

//private method
var domReady = function(callback){
	var timer = null;
	var isready = false;
	var callback = typeof(callback) == 'function' ? callback : function(){};
	if(document.addEventListener){
		document.addEventListener("DOMContentLoaded", function(){ 
			if(!isready){ isready = true; callback(); }
		}, false);
	}else if(document.attachEvent){
		document.attachEvent("onreadystatechange", function(){
			if((/loaded|complete/).test(document.readyState)){
				if(!isready){ isready = true; callback(); }
			}
		});
		if(window == window.top){
			timer = setInterval(function(){
				if(isready){ clearInterval(timer); timer=null; return; }
				try{
					document.documentElement.doScroll('left');	
				}catch(e){
					return;
				}
				if(!isready){ isready = true; callback(); }
			},5);
		}
	}
}

/*var addScript = function(src, callback, isremove){
	if(typeof(arguments[0]) != 'string'){ return; }
	var callback = typeof(arguments[1]) == 'function' ? callback : function(){};
	var isremove = typeof(arguments[2]) == 'boolean' ? isremove : false;
	var head = document.getElementsByTagName('HEAD')[0];
	var script = document.createElement('SCRIPT');
	script.type = 'text/javascript'; 
	script.src = src;
	head.appendChild(script);
	if(!*/ /*@cc_on!@*/ /*0) {
		script.onerror = script.onload = function(){ 
			callback();
			if(isremove){ script.parentNode.removeChild(this); } 
		}
	}else{
		script.onreadystatechange = function () {
			if (this.readyState == 'loaded' || this.readyState == 'complete') { 
				callback();
				if(isremove){ this.parentNode.removeChild(this); } 
			}
		}
	}
}
*/
/*
var addEvent = function(dom, eventname, func){
	if(window.addEventListener){
		if(eventname == 'mouseenter' || eventname == 'mouseleave'){
			function fn(e){
				var a = e.currentTarget, b = e.relatedTarget;
				if(!elContains(a, b) && a!=b){
					func.call(e.currentTarget,e);
				}	
			}
			function elContains(a, b){
				try{ return a.contains ? a != b && a.contains(b) : !!(a.compareDocumentPosition(b) & 16); }catch(e){}
			}
			if(eventname == 'mouseenter'){
				dom.addEventListener('mouseover', fn, false);
			}else{
				dom.addEventListener('mouseout', fn, false);
			}
		}else{
			dom.addEventListener(eventname, func, false);
		}
	}else if(window.attachEvent){
		dom.attachEvent('on' + eventname, func);
	}
}

var cancelBubble = function(evt){
	var evt = window.event || evt;
	if(evt.stopPropagation){      
		evt.stopPropagation();    
	}else{    
		evt.cancelBubble=true;   
	}
	return false;
}

var preventDefault = function(evt){
	var evt = window.event || evt;
	if(evt.preventDefault){
		evt.preventDefault();
	}else{
		event.returnValue = false;
	}
	return false;
}

var getElementPos = function(o){
	var point = {x:0, y:0};
	if (o.getBoundingClientRect) {
		var x=0, y=0;
		try{
			var box = o.getBoundingClientRect();
			var D = document.documentElement;
			x = box.left + Math.max(D.scrollLeft, document.body.scrollLeft) - D.clientLeft;
			y = box.top + Math.max(D.scrollTop, document.body.scrollTop) - D.clientTop;
		}catch(e){}
		point.x = x;
		point.y = y;
	}else{
		function pageX(o){ try {return o.offsetParent ? o.offsetLeft +  pageX(o.offsetParent) : o.offsetLeft; } catch(e){ return 0; } }
		function pageY(o){ try {return o.offsetParent ? o.offsetTop + pageY(o.offsetParent) : o.offsetTop; } catch(e){ return 0; } }
		point.x = pageX(o);
		point.y = pageY(o);
	}
	return point;
}

*/

var getStyle = function(obj, attribute){     
	return obj.currentStyle ? obj.currentStyle[attribute] : document.defaultView.getComputedStyle(obj, false)[attribute];
}


//init
o.MHeader = MHeader;
MHeader.init();

})(window);
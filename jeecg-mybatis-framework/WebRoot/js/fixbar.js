var titleFix = {
    init:function(){
		this.titles = $(".wasu-box .wasu-head .wasu-TitleBar");
		this.len = this.titles.length;
		this.now = -1;
		if(this.len <= 0) return false;
		this.bind();
    },
	bind:function (){
		var _this = this;
	    $(window).on("touchmove scroll resize orientationchange",function(){
			var nowTop = $(window).scrollTop()+88;// 40:height of the header
			var now=-1;
			for(var i=0;i<_this.len;i++){
				var otop = _this.titles[i].parentNode.offsetTop;				
				if(nowTop >= otop){
					now = i;					
				}
			}
			if(_this.now == now) return;			
			if(now != -1){
				_this.titles.eq(now).addClass("fixedBar");
			}
			_this.titles.eq(_this.now).removeClass('fixedBar');
			_this.now = now;		
		});
	}
};


titleFix.init();
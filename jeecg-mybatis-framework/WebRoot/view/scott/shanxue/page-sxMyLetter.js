$package('jeecg.sxMyLetter');
jeecg.sxMyLetter = function(){
	var _box = null;
	var _this = {
		config:{
			event:{
				add:function(){
					$('#typeIds_combobox').combobox('reload');
					_box.handler.add();
				},
				edit:function(){
					$('#typeIds_combobox').combobox('reload');
					_box.handler.edit();
				}
			},
  			dataGrid:{
  				title:'我的私信',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
					{field:'userid',title:'发件人',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.userid;
							}
						},
					{field:'to_userid',title:'收件人',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.to_userid;
							}
						},
					{field:'content',title:'内容',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.content;
							}
						},
					{field:'readed',title:'是否已读',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.readed;
							}
						},
					{field:'create_by',title:'CREATE_BY',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.create_by;
							}
						},
					{field:'create_date',title:'CREATE_DATE',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.create_date;
							}
						},
					{field:'update_by',title:'UPDATE_BY',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.update_by;
							}
						},
					{field:'update_date',title:'UPDATE_DATE',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.update_date;
							}
						},
					{field:'delflag',title:'DELFLAG',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.delflag;
							}
						},
					{field:'del_date',title:'DEL_DATE',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.del_date;
							}
						},
					]]
			}
		},
		init:function(){
			_box = new YDataGrid(_this.config); 
			_box.init();
		}
	}
	return _this;
}();

$(function(){
	jeecg.sxMyLetter.init();
});
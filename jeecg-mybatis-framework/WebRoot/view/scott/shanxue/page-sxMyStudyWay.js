$package('jeecg.sxMyStudyWay');
jeecg.sxMyStudyWay = function(){
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
  				title:'我的学习历程',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
					{field:'userid',title:'用户id',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.userid;
							}
						},
					{field:'courseid',title:'课程id',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.courseid;
							}
						},
					{field:'programid',title:'节目id',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.programid;
							}
						},
					{field:'look_time',title:'什么时候看的',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.look_time;
							}
						},
					{field:'play_time',title:'播放到的时间',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.play_time;
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
	jeecg.sxMyStudyWay.init();
});
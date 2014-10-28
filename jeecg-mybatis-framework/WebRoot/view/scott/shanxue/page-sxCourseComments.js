$package('jeecg.sxCourseComments');
jeecg.sxCourseComments = function(){
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
  				title:'课程评论表',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
					{field:'course_id',title:'???ID',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.course_id;
							}
						},
					{field:'user_id',title:'??????ID',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.user_id;
							}
						},
					{field:'content',title:'??????',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.content;
							}
						},
					{field:'create_date',title:'?????????',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.create_date;
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
	jeecg.sxCourseComments.init();
});
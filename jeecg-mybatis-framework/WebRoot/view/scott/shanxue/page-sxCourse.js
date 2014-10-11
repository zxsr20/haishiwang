$package('jeecg.sxCourse');
jeecg.sxCourse = function(){
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
  				title:'课程表',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
					{field:'id1',title:'课程id',align:'center',sortable:true,
						formatter:function(value,row,index){
							return row.id;
						}
					},
					{field:'name',title:'name',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.name;
							}
						},
					{field:'peak',title:'顶',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.peak;
							}
						},
					{field:'tread',title:'踩',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.tread;
							}
						},
					{field:'userid',title:'用户id',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.userid;
							}
						},
					{field:'teacher_name',title:'老师昵称',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.teacher_name;
							}
						},
					{field:'type_code',title:'课程类型',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.type_code;
							}
						},
					{field:'description',title:'描述',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.description;
							}
						},
					{field:'cost',title:'花费',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.cost;
							}
						},
					{field:'cost_type',title:'花费类型',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.cost_type;
							}
						},
					{field:'picture',title:'图片地址',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.picture;
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
	jeecg.sxCourse.init();
});
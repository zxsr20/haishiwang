$package('jeecg.sxProgram');
jeecg.sxProgram = function(){
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
  				title:'节目表',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
					{field:'name',title:'名称',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.name;
							}
						},
					{field:'file_url',title:'文件地址或者url',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.file_url;
							}
						},
					{field:'file_type',title:'文件类型',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.file_type;
							}
						},
					{field:'play_length',title:'文件播放时长',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.play_length;
							}
						},
					{field:'course_id',title:'课程id',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.course_id;
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
					{field:'comment_time',title:'评论次数',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.comment_time;
							}
						},
					{field:'userid',title:'用户id',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.userid;
							}
						},
					{field:'description',title:'描述',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.description;
							}
						},
					{field:'cost',title:'花费金额',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.cost;
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
	jeecg.sxProgram.init();
});
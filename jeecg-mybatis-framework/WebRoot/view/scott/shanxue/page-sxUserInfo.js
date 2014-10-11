$package('jeecg.sxUserInfo');
jeecg.sxUserInfo = function(){
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
  				title:'用户表',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
					{field:'name',title:'名称',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.name;
							}
						},
					{field:'nick_name',title:'昵称',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.nick_name;
							}
						},
					{field:'user_type',title:'用户类型',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.user_type;
							}
						},
					{field:'email',title:'email',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.email;
							}
						},
					{field:'phone',title:'手机',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.phone;
							}
						},
					{field:'qq',title:'qq',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.qq;
							}
						},
					{field:'address',title:'地址',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.address;
							}
						},
					{field:'picture',title:'图片地址',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.picture;
							}
						},
					{field:'description',title:'描述',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.description;
							}
						},
					{field:'activated',title:'是否激活',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.activated;
							}
						},
					{field:'password',title:'密码',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.password;
							}
						},
					{field:'alipay_account',title:'支付宝账号',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.alipay_account;
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
	jeecg.sxUserInfo.init();
});
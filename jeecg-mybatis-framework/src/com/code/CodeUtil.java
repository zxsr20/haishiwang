package com.code;

import codeGenerate.def.FtlDef;
import codeGenerate.factory.CodeGenerateFactory;


public class CodeUtil {

	public static void main(String[] args) {
		 /** 此处修改成你的 表名 和 中文注释***/
		 String tableName=""; //
		 String codeName ="";//中文注释  当然你用英文也是可以的 
		 String entityPackage ="";//实体包
		 String keyType = FtlDef.KEY_TYPE_02;//主键生成方式 01:UUID  02:自增
		
		/** 此处修改成你的 表名 和 中文注释***/
		tableName="sx_course"; //
		codeName ="课程表";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_course_type"; //
		codeName ="课程类型表";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_my_download"; //
		codeName ="我的下载";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_my_favorite"; //
		codeName ="我的收藏";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_my_letter"; //
		codeName ="我的私信";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_my_payment"; //
		codeName ="我的收费明细";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_my_study_way"; //
		codeName ="我的学习历程";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_play_comment"; //
		codeName ="节目评论";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);

		tableName="sx_program"; //
		codeName ="节目表";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_recommend_course"; //
		codeName ="推荐课程";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_recommend_teacher"; //
		codeName ="推荐老师";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
		
		tableName="sx_user_info"; //
		codeName ="用户表";//中文注释  当然你用英文也是可以的 
		entityPackage ="shanxue";//实体包
		CodeGenerateFactory.codeGenerate(tableName, codeName,entityPackage,keyType);
	}
}

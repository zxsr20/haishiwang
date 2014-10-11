package scott.dao.shanxue;


import java.util.List;
import java.util.Map;

import scott.entity.shanxue.SxUserInfo;
import scott.page.shanxue.SxUserInfoPage;

import com.base.dao.BaseDao;
/**
 * 
 * <br>
 * <b>功能：</b>SxUserInfoDao<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public interface SxUserInfoDao<T> extends BaseDao<T> {

	List<SxUserInfo> sx_recommendteacherList(SxUserInfoPage page);


	SxUserInfo login(Map<String, String> param);
	
	
}

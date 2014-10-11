package scott.dao.shanxue;


import java.util.List;

import scott.entity.shanxue.SxMyStudyWayNew;
import scott.page.shanxue.SxMyStudyWayPage;

import com.base.dao.BaseDao;
/**
 * 
 * <br>
 * <b>功能：</b>SxMyStudyWayDao<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public interface SxMyStudyWayDao<T> extends BaseDao<T> {

	List<SxMyStudyWayNew> queryByListNew(SxMyStudyWayPage page);

	int queryByCountNew(SxMyStudyWayPage page);
	
	
}

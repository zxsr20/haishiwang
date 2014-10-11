package scott.dao.shanxue;


import java.util.HashMap;
import java.util.Map;

import com.base.dao.BaseDao;
/**
 * 
 * <br>
 * <b>功能：</b>SxProgramDao<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public interface SxProgramDao<T> extends BaseDao<T> {

	void sx_peakOrTread(Map<String, Object> param);
	
}

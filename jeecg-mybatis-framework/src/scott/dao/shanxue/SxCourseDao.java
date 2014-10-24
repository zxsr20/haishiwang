package scott.dao.shanxue;


import java.util.List;

import scott.entity.shanxue.SxCourse;
import scott.page.shanxue.SxCoursePage;

import com.base.dao.BaseDao;
/**
 * 
 * <br>
 * <b>功能：</b>SxCourseDao<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public interface SxCourseDao<T> extends BaseDao<T> {

	List<SxCourse> sx_recommendcourseList(SxCoursePage page);
	
	//查询同类型课程
	List<SxCourse> getSameTypeCourses(String value);
}

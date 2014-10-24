package scott.service.shanxue;

import java.util.List;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import scott.dao.shanxue.SxCourseDao;
import scott.entity.shanxue.SxCourse;
import scott.page.shanxue.SxCoursePage;

/**
 * 
 * <br>
 * <b>功能：</b>SxCourseService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sxCourseService")
public class SxCourseService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SxCourseService.class);
	

	

	@Autowired
    private SxCourseDao<T> dao;

		
	public SxCourseDao<T> getDao() {
		return dao;
	}


	public List<SxCourse> sx_recommendcourseList(SxCoursePage page) throws Exception{
		// TODO Auto-generated method stub
//		Integer rowCount = queryByCount(page);
//		page.getPager().setRowCount(rowCount);
		return (List<SxCourse>) getDao().sx_recommendcourseList(page);
	}

	//查询同类型课程
	public List<SxCourse> getSameTypeCourses(String courseType){
		return getDao().getSameTypeCourses(courseType);
	}
}

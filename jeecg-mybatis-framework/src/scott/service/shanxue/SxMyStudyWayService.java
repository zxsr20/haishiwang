package scott.service.shanxue;

import java.util.List;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import scott.dao.shanxue.SxMyStudyWayDao;
import scott.entity.shanxue.SxMyStudyWayNew;
import scott.page.shanxue.SxMyStudyWayPage;

/**
 * 
 * <br>
 * <b>功能：</b>SxMyStudyWayService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sxMyStudyWayService")
public class SxMyStudyWayService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SxMyStudyWayService.class);
	

	

	@Autowired
    private SxMyStudyWayDao<T> dao;

		
	public SxMyStudyWayDao<T> getDao() {
		return dao;
	}


	//添加了多表关联的字段
	public List<SxMyStudyWayNew> queryByListNew(SxMyStudyWayPage page) {
		// TODO Auto-generated method stub
		Integer rowCount = queryByCountNew(page);
		page.getPager().setRowCount(rowCount);
		
		return getDao().queryByListNew(page);
	}


	public int queryByCountNew(SxMyStudyWayPage page) {
		// TODO Auto-generated method stub
		return getDao().queryByCountNew(page);
	}

}

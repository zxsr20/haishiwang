package scott.service.shanxue;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import scott.dao.shanxue.SxMyDownloadDao;

/**
 * 
 * <br>
 * <b>功能：</b>SxMyDownloadService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sxMyDownloadService")
public class SxMyDownloadService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SxMyDownloadService.class);
	

	

	@Autowired
    private SxMyDownloadDao<T> dao;

		
	public SxMyDownloadDao<T> getDao() {
		return dao;
	}

}

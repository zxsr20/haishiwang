package scott.service.shanxue;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import scott.dao.shanxue.SxMyPaymentDao;

/**
 * 
 * <br>
 * <b>功能：</b>SxMyPaymentService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sxMyPaymentService")
public class SxMyPaymentService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SxMyPaymentService.class);
	

	

	@Autowired
    private SxMyPaymentDao<T> dao;

		
	public SxMyPaymentDao<T> getDao() {
		return dao;
	}

}

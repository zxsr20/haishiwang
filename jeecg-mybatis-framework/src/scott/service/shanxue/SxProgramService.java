package scott.service.shanxue;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import scott.dao.shanxue.SxProgramDao;

/**
 * 
 * <br>
 * <b>功能：</b>SxProgramService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sxProgramService")
public class SxProgramService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SxProgramService.class);
	

	

	@Autowired
    private SxProgramDao<T> dao;

		
	public SxProgramDao<T> getDao() {
		return dao;
	}


	public void sx_peakOrTread(int programid, int score) {
		// TODO Auto-generated method stub
		Map<String, Object> param=new HashMap<String, Object>(); 
		 
	      param.put("id", "programid"); 
	 if (score > 0) {
		 param.put("peak", "1");
		 param.put("tread", "0");
	 }
	 else {
		 param.put("peak", "0");
		 param.put("tread", "1");
	 }
		
		getDao().sx_peakOrTread(param);
	}

}

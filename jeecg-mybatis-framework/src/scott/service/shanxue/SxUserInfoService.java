package scott.service.shanxue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import scott.dao.shanxue.SxUserInfoDao;
import scott.entity.shanxue.SxCourse;
import scott.entity.shanxue.SxUserInfo;
import scott.page.shanxue.SxUserInfoPage;

/**
 * 
 * <br>
 * <b>功能：</b>SxUserInfoService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sxUserInfoService")
public class SxUserInfoService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SxUserInfoService.class);
	

	

	@Autowired
    private SxUserInfoDao<T> dao;

		
	public SxUserInfoDao<T> getDao() {
		return dao;
	}


	public List<SxUserInfo> sx_recommendteacherList(SxUserInfoPage page) {
		return (List<SxUserInfo>) getDao().sx_recommendteacherList(page);
	}


	public SxUserInfo login(String username, String password) {
		// TODO Auto-generated method stub
		 Map<String, String> param=new HashMap<String, String>(); 
		 
	     param.put("username", username); 
	 
	     param.put("password", password); 
		return getDao().login(param);
	}

}

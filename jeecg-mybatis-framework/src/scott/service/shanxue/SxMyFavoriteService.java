package scott.service.shanxue;

import java.util.List;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import scott.dao.shanxue.SxMyFavoriteDao;
import scott.entity.shanxue.SxMyFavorite;
import scott.entity.shanxue.SxMyFavoriteNew;
import scott.page.shanxue.SxMyFavoritePage;

/**
 * 
 * <br>
 * <b>功能：</b>SxMyFavoriteService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sxMyFavoriteService")
public class SxMyFavoriteService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SxMyFavoriteService.class);
	

	

	@Autowired
    private SxMyFavoriteDao<T> dao;

		
	public SxMyFavoriteDao<T> getDao() {
		return dao;
	}


	public List<SxMyFavoriteNew> queryByListNew(SxMyFavoritePage page) {
		// TODO Auto-generated method stub
		Integer rowCount = queryByCountNew(page);
		page.getPager().setRowCount(rowCount);
		
		return getDao().queryByListNew(page);
	}


	private Integer queryByCountNew(SxMyFavoritePage page) {
		// TODO Auto-generated method stub
		return getDao().queryByCountNew(page);
	}

}

package scott.dao.shanxue;


import java.util.List;

import scott.entity.shanxue.SxMyFavorite;
import scott.entity.shanxue.SxMyFavoriteNew;
import scott.page.shanxue.SxMyFavoritePage;

import com.base.dao.BaseDao;
/**
 * 
 * <br>
 * <b>功能：</b>SxMyFavoriteDao<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public interface SxMyFavoriteDao<T> extends BaseDao<T> {

	List<SxMyFavoriteNew> queryByListNew(SxMyFavoritePage page);

	Integer queryByCountNew(SxMyFavoritePage page);
	
	
}

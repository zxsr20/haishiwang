package scott.controller.shanxue;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import scott.entity.shanxue.SxCourseComments;
import scott.page.shanxue.SxCourseCommentsPage;
import scott.service.shanxue.SxCourseCommentsService;

import com.base.util.DateUtil;
import com.base.util.HtmlUtil;
import com.base.util.StringUtil;
import com.base.web.BaseAction;
 
/**
 * 
 * <br>
 * <b>功能：</b>SxCourseCommentsController<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */ 
@Controller
@RequestMapping("/sxCourseComments") 
public class SxCourseCommentsController extends BaseAction{
	
	private final static Logger logger = Logger.getLogger(SxCourseCommentsController.class);
	
	// Servrice start
	@Autowired(required=false) //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private SxCourseCommentsService<SxCourseComments> sxCourseCommentsService; 
	
	/**
	 * ilook 查询课程评论列表
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/dataList") 
	public void  datalist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String courseId = request.getParameter("courseId");
		String pageNo = request.getParameter("curpage");

		SxCourseCommentsPage page = new SxCourseCommentsPage();
		page.setRows(2);

		//查询指定课程的评论列表
		if(StringUtil.isNumeric(courseId)){
			page.setCourse_id(Integer.parseInt(courseId));
		}

		//查询指定页的评论列表
		if(StringUtil.isNumeric(pageNo)){
			page.setPage(Integer.parseInt(pageNo));
		}

		if(logger.isDebugEnabled()){
			logger.debug(page);
		}
			
		List<SxCourseComments> dataList = null;

		try {
			dataList = sxCourseCommentsService.queryByList(page);
		} catch (Exception e) {
			logger.error(e);
		}
		
		//设置页面数据
		Map<String,Object> jsonMap = new HashMap<String,Object>();

		//总评论数
		jsonMap.put("total",page.getPager().getRowCount());

		//评论列表
		jsonMap.put("rows", dataList);

		//登录标志
		jsonMap.put("sign", "1");

		HtmlUtil.writerJson(response, jsonMap);
	}
	
	/**
	 *  保存课程评论
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/save")
	public void save(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		SxCourseComments comment = new SxCourseComments();

		String content = request.getParameter("content");
		String courseId = request.getParameter("courseId");
		
		//TODO 替换为登录用户ID
		String userId = "100";
		
		if(StringUtil.isNumeric(courseId)){
			comment.setCourse_id(Integer.parseInt(courseId));
		}
				
		if(StringUtil.isNumeric(userId)){
			comment.setUser_id(Integer.parseInt(userId));
		}

		comment.setContent(content);
		comment.setCreate_date(DateUtil.formatDate(new Date(), "yyyy-MM-dd"));

		//添加调试日志
		if(logger.isDebugEnabled()){
			logger.debug(comment);
		}

		Map<String,Object>  jsonMap = new HashMap<String,Object>();
		try {
			
			sxCourseCommentsService.add(comment);
			jsonMap.put("stat", "1");
			
		//保存失败
		} catch (Exception e) {
			jsonMap.put("stat", "3");
			logger.error(e);
		}

		HtmlUtil.writerJson(response, jsonMap);
	}
}

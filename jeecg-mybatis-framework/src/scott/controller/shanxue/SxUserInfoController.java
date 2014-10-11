package scott.controller.shanxue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.base.web.BaseAction;
import com.base.util.HtmlUtil;
import com.base.entity.BaseEntity.DELETED;
import scott.entity.shanxue.SxUserInfo;
import scott.page.shanxue.SxCoursePage;
import scott.page.shanxue.SxUserInfoPage;
import scott.service.shanxue.SxUserInfoService;
 
/**
 * 
 * <br>
 * <b>功能：</b>SxUserInfoController<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */ 
@Controller
@RequestMapping("/sxUserInfo") 
public class SxUserInfoController extends BaseAction{
	
	private final static Logger log= Logger.getLogger(SxUserInfoController.class);
	
	// Servrice start
	@Autowired(required=false) //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private SxUserInfoService<SxUserInfo> sxUserInfoService; 
	
	
	
	
	@RequestMapping("/newregister") 
	public ModelAndView  registerpage(SxUserInfoPage page,HttpServletRequest request) throws Exception{
		Map<String,Object>  context = getRootMap();
		return forword("scott/shanxue/registerpage",context); 
	}
	
	@RequestMapping("/newlogin") 
	public ModelAndView  loginpage(SxUserInfoPage page,HttpServletRequest request) throws Exception{
		Map<String,Object>  context = getRootMap();
		return forword("scott/shanxue/loginpage",context); 
	}
	/**
	 * 
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/list") 
	public ModelAndView  list(SxUserInfoPage page,HttpServletRequest request) throws Exception{
		Map<String,Object>  context = getRootMap();
		return forword("scott/shanxue/sxUserInfo",context); 
	}
	
	
	/**
	 * ilook 首页
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/dataList") 
	public void  datalist(SxUserInfoPage page,HttpServletResponse response) throws Exception{
		List<SxUserInfo> dataList = sxUserInfoService.queryByList(page);
		//设置页面数据
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		jsonMap.put("total",page.getPager().getRowCount());
		jsonMap.put("rows", dataList);
		HtmlUtil.writerJson(response, jsonMap);
	}
	
	@RequestMapping("/sx_recommendteacherList") 
	public void  sx_recommendteacherList(SxUserInfoPage page,HttpServletResponse response) throws Exception{
		List<SxUserInfo> dataList = sxUserInfoService.sx_recommendteacherList(page);
		//设置页面数据
		Map<String,Object> jsonMap = new HashMap<String,Object>();
//		jsonMap.put("total",page.getPager().getRowCount());
		jsonMap.put("rows", dataList);
		HtmlUtil.writerJson(response, jsonMap);
	}
	/**
	 * 添加或修改数据
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/save")
	public void save(SxUserInfo entity,Integer[] typeIds,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap<String,Object>();
		if(entity.getId()==null||StringUtils.isBlank(entity.getId().toString())){
			sxUserInfoService.add(entity);
		}else{
			sxUserInfoService.update(entity);
		}
		sendSuccessMessage(response, "保存成功~");
	}
	
	@RequestMapping("/sx_save")
	public void sx_save(SxUserInfo entity,Integer[] typeIds,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap<String,Object>();
		if(entity.getId()==null||StringUtils.isBlank(entity.getId().toString())){
			sxUserInfoService.add(entity);
		}else{
			sxUserInfoService.update(entity);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(SUCCESS, true);
		result.put(MSG, "保存成功~");
		result.put("data", entity);
		HtmlUtil.writerJson(response, result);
//		sendSuccessMessage(response, "保存成功~");
	}
	
	
	@RequestMapping("/sx_save_webpage")
	public String sx_save_webpage(SxUserInfo entity,Integer[] typeIds,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap<String,Object>();
		if(entity.getId()==null||StringUtils.isBlank(entity.getId().toString())){
			sxUserInfoService.add(entity);
		}else{
			sxUserInfoService.update(entity);
		}
		return "redirect:/sxCourse/newhome.do";
	}
	
	@RequestMapping("/sx_login_webpage")
	public String sx_login_webpage(String username,String password,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap();
		SxUserInfo entity  = sxUserInfoService.login(username,password);
		if(entity  == null){
//			sendFailureMessage(response, "没有找到对应的记录!");
			return "";
		}
		
		Cookie foo = new Cookie("username", username); //bake cookie
		
		foo.setMaxAge(Integer.MAX_VALUE); //set expire time to 1000 sec
//		foo.setDomain("");
		foo.setPath("/");
		
		Cookie foo1 = new Cookie("userid", entity.getId()+""); //bake cookie
		
		foo1.setMaxAge(Integer.MAX_VALUE); //set expire time to 1000 sec
//		foo.setDomain("");
		foo1.setPath("/");
		response.addCookie(foo);
		response.addCookie(foo1);
		
		return "redirect:/sxCourse/newhome.do";
	}
	
	
	
	
	@RequestMapping("/getId")
	public void getId(String id,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap();
		SxUserInfo entity  = sxUserInfoService.queryById(id);
		if(entity  == null){
			sendFailureMessage(response, "没有找到对应的记录!");
			return;
		}
		context.put(SUCCESS, true);
		context.put("data", entity);
		HtmlUtil.writerJson(response, context);
	}
	
	@RequestMapping("/sx_login")
	public void login(String username,String password,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap();
		SxUserInfo entity  = sxUserInfoService.login(username,password);
		if(entity  == null){
			sendFailureMessage(response, "没有找到对应的记录!");
			return;
		}
		context.put(SUCCESS, true);
		context.put("data", entity);
		HtmlUtil.writerJson(response, context);
	}
	
	@RequestMapping("/sx_getId")
	public void sx_getId(String id,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap();
		SxUserInfo entity  = sxUserInfoService.queryById(id);
		if(entity  == null){
			sendFailureMessage(response, "没有找到对应的记录!");
			return;
		}
		context.put(SUCCESS, true);
		context.put("data", entity);
		HtmlUtil.writerJson(response, context);
	}
	
	
	
	@RequestMapping("/delete")
	public void delete(String[] id,HttpServletResponse response) throws Exception{
		sxUserInfoService.delete(id);
		sendSuccessMessage(response, "删除成功");
	}

}

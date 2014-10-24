package scott.controller.shanxue;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import scott.entity.shanxue.SxCourse;
import scott.entity.shanxue.SxCourseType;
import scott.entity.shanxue.SxCourseWithProgram;
import scott.entity.shanxue.SxMyFavorite;
import scott.entity.shanxue.SxMyStudyWay;
import scott.entity.shanxue.SxProgram;
import scott.entity.shanxue.SxRecommendCourse;
import scott.page.shanxue.SxCoursePage;
import scott.page.shanxue.SxCourseTypePage;
import scott.page.shanxue.SxMyFavoritePage;
import scott.page.shanxue.SxMyStudyWayPage;
import scott.page.shanxue.SxProgramPage;
import scott.service.shanxue.SxCourseService;
import scott.service.shanxue.SxCourseTypeService;
import scott.service.shanxue.SxMyFavoriteService;
import scott.service.shanxue.SxMyStudyWayService;
import scott.service.shanxue.SxProgramService;
import scott.service.shanxue.SxRecommendCourseService;

import com.baidu.inf.iis.bcs.BaiduBCS;
import com.baidu.inf.iis.bcs.auth.BCSCredentials;
import com.baidu.inf.iis.bcs.auth.BCSSignCondition;
import com.baidu.inf.iis.bcs.http.HttpMethodName;
import com.baidu.inf.iis.bcs.model.BCSClientException;
import com.baidu.inf.iis.bcs.model.BCSServiceException;
import com.baidu.inf.iis.bcs.model.BucketSummary;
import com.baidu.inf.iis.bcs.model.Empty;
import com.baidu.inf.iis.bcs.model.ObjectListing;
import com.baidu.inf.iis.bcs.model.ObjectMetadata;
import com.baidu.inf.iis.bcs.model.ObjectSummary;
import com.baidu.inf.iis.bcs.model.Resource;
import com.baidu.inf.iis.bcs.model.SuperfileSubObject;
import com.baidu.inf.iis.bcs.model.X_BS_ACL;
import com.baidu.inf.iis.bcs.policy.Policy;
import com.baidu.inf.iis.bcs.policy.PolicyAction;
import com.baidu.inf.iis.bcs.policy.PolicyEffect;
import com.baidu.inf.iis.bcs.policy.Statement;
import com.baidu.inf.iis.bcs.request.CreateBucketRequest;
import com.baidu.inf.iis.bcs.request.GenerateUrlRequest;
import com.baidu.inf.iis.bcs.request.GetObjectRequest;
import com.baidu.inf.iis.bcs.request.ListBucketRequest;
import com.baidu.inf.iis.bcs.request.ListObjectRequest;
import com.baidu.inf.iis.bcs.request.PutObjectRequest;
import com.baidu.inf.iis.bcs.request.PutSuperfileRequest;
import com.baidu.inf.iis.bcs.response.BaiduBCSResponse;
import com.base.util.HtmlUtil;
import com.base.web.BaseAction;

/**
 * 
 * <br>
 * <b>功能：</b>SxCourseController<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Controller
@RequestMapping("/sxCourse")
public class SxCourseController extends BaseAction {

	static Logger log = Logger.getLogger("java");

	// Servrice start
	@Autowired(required = false)
	// 自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private SxCourseService<SxCourse> sxCourseService;

	@Autowired(required = false)
	// 自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private SxRecommendCourseService<SxRecommendCourse> sxRecommendCourseService;

	@Autowired(required = false)
	// 自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private SxProgramService<SxProgram> sxProgramService;

	@Autowired(required = false)
	// 自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private SxMyStudyWayService<SxMyStudyWay> SxMyStudyWayService;
	@Autowired(required = false)
	// 自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private SxMyFavoriteService<SxMyFavorite> SxMyFavoriteService;
	@Autowired(required = false)
	// 自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private SxCourseTypeService<SxCourseType> sxCourseTypeService;

	//会话内容保存键
	private final static String SESSION_KEY_COURSE_VIEW_HISTORY = "COURSE_VIEW_HISTORY";
			
	/**
	 * 
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public ModelAndView list(SxCoursePage page, HttpServletRequest request)
			throws Exception {
		Map<String, Object> context = getRootMap();
		return forword("scott/shanxue/sxCourse", context);
	}

	@RequestMapping("/course_detail")
	public ModelAndView course_detail(int courseid, String programid,
			HttpServletRequest request) throws Exception {

		// String path = request.getContextPath();
		// String basePath =
		// request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		// String remoteAddress=request.getRemoteAddr();
		// String servletPath=request.getServletPath();
		// String realPath=request.getRealPath("/");
		// String remoteUser=request.getRemoteUser();
		// String requestURI=request.getRequestURI();
		String complete_url = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ request.getRequestURI();
		Map<String, Object> context = getRootMap();
		if (courseid != 0) {

			SxCourseWithProgram sxCourse = new SxCourseWithProgram();
			SxCourse entity = sxCourseService.queryById(courseid);
			if (entity == null) {
				return new ModelAndView();
			}
			sxCourse.setSxCourse(entity);

			SxProgramPage spage = new SxProgramPage();
			spage.setCourse_id(courseid);
			spage.setRows(1000);
			spage.setSort("play_length");
			spage.setOrder("asc");
			List<SxProgram> sdataList = sxProgramService.queryByList(spage);
			// 设置页面数据
			sxCourse.setSxPrograms(sdataList);

			SxProgram sxProgram = null;
			if (programid != null && !programid.equals("0")) {
				sxCourse.setProgramid(programid);

				for (SxProgram item : sdataList) {
					if (item.getId() == Integer.parseInt(programid)) {
						sxProgram = item;

						break;
					}
				}
				SxProgram item;
				for (int i = 0; i < sdataList.size(); i++) {
					item = sdataList.get(i);
					if (item.getId() == Integer.parseInt(programid)) {
						sxProgram = item;
						if ((i + 1) < sdataList.size()) {
							int next_programid = sdataList.get(i + 1).getId();
							String next_url = complete_url + "?courseid="
									+ courseid + "&programid=" + next_programid;
							sxCourse.setNext_url(next_url);
						} else {
							sxCourse.setNext_url("");
						}

						break;
					}
				}

				if (sxProgram != null) {
					sxCourse.setPlay_url(sxProgram.getFile_url());
				}

			} else {
				if (sdataList.size() > 0) {
					sxProgram = sdataList.get(0);
				}
				if (sdataList.size() > 1) {
					int next_programid = sdataList.get(2).getId();
					String next_url = complete_url + "?courseid=" + courseid
							+ "&programid=" + next_programid;
					sxCourse.setNext_url(next_url);
				}
				sxCourse.setProgramid(sxProgram.getId().toString());
				if (sxProgram != null) {
					sxCourse.setPlay_url(sxProgram.getFile_url());
				}
			}
			context.put("course", sxCourse);
		}
		putCookieToContext(request, context);

		return forword("scott/shanxue/sxCourseDetail", context);
	}

	@RequestMapping(value = "/newhome", produces = { "text/html;charset=UTF-8" })
	public ModelAndView homepage(SxCoursePage page, HttpServletRequest request)
			throws Exception {
		// SxCourseTypePage sPage = new SxCourseTypePage();
		List<SxCourseType> dataList = sxCourseTypeService.queryByList(page);
		Map<String, Object> context = getRootMap();

		page.setPage(1);
		page.setRows(6);
		page.setOrder("desc");
		page.setSort("b.CREATE_DATE");
		List<SxCourse> recommandCourses = sxCourseService
				.sx_recommendcourseList(page);

		context.put("coursetype", dataList);
		context.put("recommandcourse", recommandCourses);

		putCookieToContext(request, context);

		return forword("scott/shanxue/homepage", context);
	}

	private void putCookieToContext(HttpServletRequest request,
			Map<String, Object> context) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userid")) {
					context.put("userid", cookie.getValue());
				}
				if (cookie.getName().equals("username")) {
					context.put("username", cookie.getValue());
				}
			}
		}
	}

	@RequestMapping("/newdetail")
	public ModelAndView detailpage(SxProgramPage page, HttpServletRequest request) throws Exception {
		Map<String, Object> context = getRootMap();

		if (page.getCourse_id() != null && page.getCourse_id() != 0) {
			int courseid = page.getCourse_id();
			SxCourseWithProgram sxCourse = new SxCourseWithProgram();
			SxCourse entity = sxCourseService.queryById(courseid);
			if (entity == null) {
				return new ModelAndView();
			}
			sxCourse.setSxCourse(entity);

			SxProgramPage spage = new SxProgramPage();
			spage.setCourse_id(courseid);
			spage.setRows(1000);
			List<SxProgram> sdataList = sxProgramService.queryByList(spage);
			// 设置页面数据
			sxCourse.setSxPrograms(sdataList);

			SxProgram sxProgram = null;
			if (page.getId() != null && page.getId() != 0) {
				String programid = page.getId().toString();
				sxCourse.setProgramid(programid);

				for (SxProgram item : sdataList) {
					if (item.getId().equals(page.getId())) {
						sxProgram = item;
						break;
					}
				}
				if (sxProgram != null) {
					sxCourse.setPlay_url(sxProgram.getFile_url());
				}

			} else {
				if (sdataList.size() > 0) {
					sxProgram = sdataList.get(0);
				}
				sxCourse.setProgramid(sxProgram.getId().toString());
				if (sxProgram != null) {
					sxCourse.setPlay_url(sxProgram.getFile_url());
				}
			}
			context.put("course", sxCourse);

			//查询同类课程
			findSameCourses(entity, request);

			//更新课程浏览历史
			updateViewHistory(sxCourse, request);
		}
		// if (page.getId() != 0) {//没有传id，则默认播第一集
		// SxCourse course_entity = sxCourseService.queryById(page.getId());
		// }
		// if(page.getCourse_id() != 0)
		// {
		// SxProgram program_entity =
		// sxProgramService.queryById(page.getCourse_id());
		// }
		putCookieToContext(request, context);

		return forword("scott/shanxue/detailpage", context);
	}

	@RequestMapping("/newlist")
	public ModelAndView listpage(SxCoursePage page, HttpServletRequest request)
			throws Exception {
		Map<String, Object> context = getRootMap();
		SxCourseTypePage sPage = new SxCourseTypePage();
		List<SxCourseType> dataList = sxCourseTypeService.queryByList(sPage);
		context.put("coursetype", dataList);

		String type_code = request.getParameter("type_code");
		context.put("type_code", type_code == null ? "" : type_code);

		String name = request.getParameter("name");
		context.put("name", name == null ? "" : name);
		// page.setPage(1);
		// page.setRows(10);
		// page.setOrder("desc");
		// page.setSort("CREATE_DATE");
		// List<SxCourse> dataList = sxCourseService.queryByList(page);
		// context.put("courselist", dataList);
		putCookieToContext(request, context);

		return forword("scott/shanxue/listpage", context);
	}

	@RequestMapping("/newmyinfo")
	public ModelAndView myinfopage(SxCoursePage page, HttpServletRequest request)
			throws Exception {
		Map<String, Object> context = getRootMap();
		SxCourseTypePage sPage = new SxCourseTypePage();
		List<SxCourseType> dataList = sxCourseTypeService.queryByList(sPage);
		context.put("coursetype", dataList);
		// page.setPage(1);
		// page.setRows(10);
		// page.setOrder("desc");
		// page.setSort("CREATE_DATE");
		// List<SxCourse> dataList = sxCourseService.queryByList(page);
		// context.put("courselist", dataList);
		return forword("scott/shanxue/myinfopage", context);
	}

	@RequestMapping("/mycollect")
	public ModelAndView mycollect(SxCoursePage page, HttpServletRequest request)
			throws Exception {
		Map<String, Object> context = getRootMap();
		SxCourseTypePage sPage = new SxCourseTypePage();
		List<SxCourseType> dataList = sxCourseTypeService.queryByList(sPage);
		context.put("coursetype", dataList);

		putCookieToContext(request, context);
		// page.setPage(1);
		// page.setRows(10);
		// page.setOrder("desc");
		// page.setSort("CREATE_DATE");
		// List<SxCourse> dataList = sxCourseService.queryByList(page);
		// context.put("courselist", dataList);
		return forword("scott/shanxue/mycollectpage", context);
	}

	@RequestMapping("/mystudyway")
	public ModelAndView mystudyway(SxCoursePage page, HttpServletRequest request)
			throws Exception {
		Map<String, Object> context = getRootMap();
		SxCourseTypePage sPage = new SxCourseTypePage();
		List<SxCourseType> dataList = sxCourseTypeService.queryByList(sPage);
		context.put("coursetype", dataList);

		putCookieToContext(request, context);
		// page.setPage(1);
		// page.setRows(10);
		// page.setOrder("desc");
		// page.setSort("CREATE_DATE");
		// List<SxCourse> dataList = sxCourseService.queryByList(page);
		// context.put("courselist", dataList);
		return forword("scott/shanxue/mystudywaypage", context);
	}

	@RequestMapping("/newtest")
	public ModelAndView testpage(SxCoursePage page, HttpServletRequest request)
			throws Exception {
		Map<String, Object> context = getRootMap();

		page.setPage(1);
		page.setRows(100);
		page.setOrder("desc");
		page.setSort("CREATE_DATE");
		List<SxCourse> dataList = sxCourseService.queryByList(page);
		context.put("courselist", dataList);
		return forword("scott/shanxue/simpletestpage", context);
	}

	/**
	 * ilook 首页
	 * 
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/dataList")
	public void datalist(SxCoursePage page, HttpServletResponse response)
			throws Exception {
		List<SxCourse> dataList = sxCourseService.queryByList(page);
		// 设置页面数据
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", page.getPager().getRowCount());
		jsonMap.put("rows", dataList);
		HtmlUtil.writerJson(response, jsonMap);
	}

	@RequestMapping("/sx_dataList")
	public void sx_datalist(SxCoursePage page, HttpServletResponse response)
			throws Exception {
		List<SxCourse> dataList = sxCourseService.queryByList(page);
		// 设置页面数据
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", page.getPager().getRowCount());
		jsonMap.put("rows", dataList);
		HtmlUtil.writerJson(response, jsonMap);
	}

	@RequestMapping("/sx_recommendcourseList")
	public void sx_recommendcourseList(SxCoursePage page,
			HttpServletResponse response) throws Exception {
		List<SxCourse> dataList = sxCourseService.sx_recommendcourseList(page);
		// 设置页面数据
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("rows", dataList);
		HtmlUtil.writerJson(response, jsonMap);
	}

	/**
	 * JSP显示本地图片,流形式GET
	 */
	@RequestMapping(value = "/displayImage")
	public void displayImage(HttpServletRequest request,
			HttpServletResponse response) {

		response.setContentType("image/*; charset=UTF-8");
		String filePath = request.getParameter("picture");// 这里本来是应该取登入后request传递过去的值,这里直接赋值
		// filePath =
		// "D:/temp/wxcs/DA0DF8DFC18BB561E040007F01003AAE/Hydrangeas.jpg";

		// //处理对默认头像的显示方式
		// int imgIndex = filePath.lastIndexOf("/");
		// String imgName = filePath.substring(imgIndex+1);
		// if(imgName.equals(WebConstants.DEFAULT_AVATAR_IMG)){//默认头像
		// //修改图片地址为特殊的默认头像
		// filePath = WebConstants.SYSTEM_UPLOADPATH + "/"
		// +WebConstants.DEFAULT_AVATAR_IMG;
		// filePath = filePath.replace("\\", "/");
		// }else{
		// //正常打开图片地址
		// }

		filePath = "D:/shanxue/" + filePath;

		FileInputStream fileIn;
		OutputStream out;
		try {
			fileIn = new FileInputStream(filePath);// 以byte流的方式打开文件
			int i = fileIn.available();// 得到文件大小
			byte[] data = new byte[i];
			fileIn.read(data); // 读数据放入 byte[]
			out = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
			out.write(data); // 输出数据
			out.flush();
			out.close();
			fileIn.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加或修改数据
	 * 
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public void save(SxCourse entity, Integer[] typeIds,
			HttpServletResponse response) throws Exception {
		Map<String, Object> context = new HashMap<String, Object>();
		if (entity.getId() == null
				|| StringUtils.isBlank(entity.getId().toString())) {
			sxCourseService.add(entity);
		} else {
			sxCourseService.update(entity);
		}
		sendSuccessMessage(response, "保存成功~");
	}

	@RequestMapping("/sx_save")
	public void sx_save(SxCourse entity, Integer[] typeIds,
			HttpServletResponse response) throws Exception {
		Map<String, Object> context = new HashMap<String, Object>();
		if (entity.getId() == null
				|| StringUtils.isBlank(entity.getId().toString())) {
			sxCourseService.add(entity);
		} else {
			sxCourseService.update(entity);
		}
		sendSuccessMessage(response, "保存成功~");
	}

	@RequestMapping("/sx_study_course")
	@ResponseBody
	public void sx_study_course(String userid, String courseid,
			HttpServletResponse response) {
		if ((userid != null && userid.length() > 0)
				&& (courseid != null && courseid.length() > 0)) {
			SxMyStudyWayPage page = new SxMyStudyWayPage();
			page.setCourseid(Integer.parseInt(courseid));
			page.setCourseid(Integer.parseInt(userid));
			List<SxMyStudyWay> studyWays;
			try {
				studyWays = SxMyStudyWayService.queryByList(page);
				if (studyWays != null && studyWays.size() > 0) {
					sendFailureMessage(response, "已存在");
				} else {
					SxMyStudyWay sxMyStudyWay = new SxMyStudyWay();
					sxMyStudyWay.setCourseid(Integer.parseInt(courseid));
					sxMyStudyWay.setUserid(Integer.parseInt(userid));
					sxMyStudyWay.setCreate_date(new Date());
					SxMyStudyWayService.add(sxMyStudyWay);
					sendSuccessMessage(response, "保存成功~");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			sendFailureMessage(response, "参数为空");
		}
	}

	@RequestMapping("/sx_collect_course")
	@ResponseBody
	public void sx_collect_course(String userid, String courseid,
			HttpServletResponse response) {
		if ((userid != null && userid.length() > 0)
				&& (courseid != null && courseid.length() > 0)) {
			SxMyFavoritePage page = new SxMyFavoritePage();
			page.setCourseid(Integer.parseInt(courseid));
			page.setUserid(Integer.parseInt(userid));
			List<SxMyFavorite> Favorites;
			try {
				Favorites = SxMyFavoriteService.queryByList(page);
				if (Favorites != null && Favorites.size() > 0) {
					sendFailureMessage(response, "已存在");
				} else {
					SxMyFavorite sxMyFavorite = new SxMyFavorite();
					sxMyFavorite.setCourseid(Integer.parseInt(courseid));
					sxMyFavorite.setUserid(Integer.parseInt(userid));
					sxMyFavorite.setCreate_date(new Date());
					SxMyFavoriteService.add(sxMyFavorite);
					sendSuccessMessage(response, "保存成功~");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			sendFailureMessage(response, "参数为空");
		}
	}

	@RequestMapping("/sx_upload")
	public void sx_upload(HttpServletRequest request,
			HttpServletResponse response) {
		// AjaxJson j = new AjaxJson();

		BCSCredentials credentials = new BCSCredentials(accessKey, secretKey);
		BaiduBCS baiduBCS = new BaiduBCS(credentials, host);
		// baiduBCS.setDefaultEncoding("GBK");
		baiduBCS.setDefaultEncoding("UTF-8"); // Default UTF-8
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
			for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
				MultipartFile file = entity.getValue();// 获取上传文件对象

				// file.getInputStream()
				//
				// //上传到百度服务器
				// putObjectByFile(baiduBCS, file);

				// File file = createSampleFile();
				InputStream fileContent = file.getInputStream();
				ObjectMetadata objectMetadata = new ObjectMetadata();
				objectMetadata.setContentType("text/html");
				objectMetadata.setContentLength(file.getSize());

				String fileName = "/" + file.getOriginalFilename();
				System.out.print(fileName);
				PutObjectRequest putrequest = new PutObjectRequest(bucket,
						fileName, fileContent, objectMetadata);
				ObjectMetadata result = baiduBCS.putObject(putrequest)
						.getResult();
				System.out.print(result);
				log.error("ObjectMetadata" + result);
				// try {
				// jeecgBlobDataService.saveObj(documentTitle, file);
				// j.setMsg("文件导入成功！");
				// } catch (Exception e) {
				// j.setMsg("文件导入失败！");
				// logger.error(ExceptionUtil.getExceptionMessage(e));
				// }
				// break; // 不支持多个文件导入？
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
			log.error("uploaderror" + e.getMessage());
		}

		sendSuccessMessage(response, "成功");
	}

	@RequestMapping("/sx_getId")
	public void sx_getId(String id, HttpServletResponse response)
			throws Exception {
		Map<String, Object> context = new HashMap();
		SxCourse entity = sxCourseService.queryById(id);
		if (entity == null) {
			sendFailureMessage(response, "没有找到对应的记录!");
			return;
		}
		context.put(SUCCESS, true);
		context.put("data", entity);
		HtmlUtil.writerJson(response, context);
	}

	@RequestMapping("/getId")
	public void getId(String id, HttpServletResponse response) throws Exception {
		Map<String, Object> context = new HashMap();
		SxCourse entity = sxCourseService.queryById(id);
		if (entity == null) {
			sendFailureMessage(response, "没有找到对应的记录!");
			return;
		}
		context.put(SUCCESS, true);
		context.put("data", entity);
		HtmlUtil.writerJson(response, context);
	}

	@RequestMapping("/delete")
	public void delete(String[] id, HttpServletResponse response)
			throws Exception {
		sxCourseService.delete(id);
		sendSuccessMessage(response, "删除成功");
	}

	// 获得token，并且将云存储中的视频转码变成flv
	@RequestMapping("/translation")
	public void translation(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// String tokenString = "";
		// BaiduStore store = new BaiduCookieStore(accessKey, request,
		// response);
		// Session session = store.getSession();
		// if (session == null) {
		// try {
		// response.sendRedirect("index");
		// tokenString = "";
		// } catch (IOException e) {
		// e.printStackTrace();
		// }
		// }
		// tokenString = session.getToken().getAccessToken();
		HttpURLConnection url_con = null;
		String responseContent = null;
		String token = "";
		String oathURL = "https://openapi.baidu.com/oauth/2.0/token?grant_type=client_credentials&client_id=dwwUAlsAtKVdt9a9xdpYTG6f&client_secret=tEn2UBrplFLILyPD5fdnozHHNERVddwW";
		try {
			URL url = new URL(oathURL);
			url_con = (HttpURLConnection) url.openConnection();
			url_con.setRequestMethod("GET");
			// System.setProperty("sun.net.client.defaultConnectTimeout", String
			// .valueOf(HttpRequestProxy.connectTimeOut));//
			// （单位：毫秒）jdk1.4换成这个,连接超时
			// System.setProperty("sun.net.client.defaultReadTimeout", String
			// .valueOf(HttpRequestProxy.readTimeOut)); //
			// （单位：毫秒）jdk1.4换成这个,读操作超时
			// url_con.setConnectTimeout(5000);//（单位：毫秒）jdk
			// 1.5换成这个,连接超时
			// url_con.setReadTimeout(5000);//（单位：毫秒）jdk 1.5换成这个,读操作超时
			url_con.setDoOutput(true);
			url_con.getOutputStream().flush();
			url_con.getOutputStream().close();

			InputStream in = url_con.getInputStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(in,
					"utf8"));
			String tempLine = rd.readLine();
			StringBuffer temp = new StringBuffer();
			String crlf = System.getProperty("line.separator");
			while (tempLine != null) {
				temp.append(tempLine);
				temp.append(crlf);
				tempLine = rd.readLine();
			}
			responseContent = temp.toString();
			rd.close();
			in.close();
		} catch (IOException e) {

		} finally {
			if (url_con != null) {
				url_con.disconnect();
			}
		}
		JSONObject jsonObject = null;
		jsonObject = new JSONObject(responseContent);
		if (jsonObject != null) {
			token = jsonObject.optString("access_token");
		}

		String reqUrl = "https://openapi.baidu.com/rest/2.0/media/v1/transcoding/job/create";
		// String access_token = "xxxxxxxxxxxx";
		// String user_appid = "xxxxxxxx";
		// String output =
		// "{\"format\":\"mp4\",\"width\":640,\"height\":480,\"aspect_ratio_mode\":0,\"video_bitrate_bps\":600000,\"audio_bitrate_bps\":128000,\"max_frame_rate\":15,\"audio_sample_rate\":441000,\"audio_channels\":2,\"h264_profile\":\"baseline\",\"callback\":\"\"}";
		// String input_name = URLEncoder.encode("V40406-124933.mp4","utf8");
		// String output_name = URLEncoder.encode("111.flv","utf8");

		Map parameters = new HashMap<String, String>();
		parameters
				.put("url",
						"https://openapi.baidu.com/rest/2.0/media/v1/transcoding/job/create");
		parameters
				.put("access_token",
						"24.05bd71f9029799841babd07f96de3cef.2592000.1399359295.282335-2492841");
		parameters.put("user_appid", "2492841");
		parameters
				.put("output",
						"{\"format\":\"mp4\",\"width\":640,\"height\":480,\"aspect_ratio_mode\":0,\"video_bitrate_bps\":600000,\"audio_bitrate_bps\":128000,\"max_frame_rate\":15,\"audio_sample_rate\":44100,\"audio_channels\":2,\"h264_profile\":\"baseline\",\"callback\":\"\"}");
		parameters.put("input_name", "V40406-124933.mp4");
		parameters.put("output_name", "111.flv");

		try {
			StringBuffer params = new StringBuffer();
			for (Iterator iter = parameters.entrySet().iterator(); iter
					.hasNext();) {
				Entry element = (Entry) iter.next();
				params.append(element.getKey().toString());
				params.append("=");
				params.append(URLEncoder.encode(element.getValue().toString(),
						"utf8"));
				params.append("&");
			}

			if (params.length() > 0) {
				params = params.deleteCharAt(params.length() - 1);
			}

			URL url = new URL(reqUrl);
			url_con = (HttpURLConnection) url.openConnection();
			url_con.setRequestMethod("GET");
			// System.setProperty("sun.net.client.defaultConnectTimeout", String
			// .valueOf(HttpRequestProxy.connectTimeOut));//
			// （单位：毫秒）jdk1.4换成这个,连接超时
			// System.setProperty("sun.net.client.defaultReadTimeout", String
			// .valueOf(HttpRequestProxy.readTimeOut)); //
			// （单位：毫秒）jdk1.4换成这个,读操作超时
			// url_con.setConnectTimeout(5000);//（单位：毫秒）jdk
			// 1.5换成这个,连接超时
			// url_con.setReadTimeout(5000);//（单位：毫秒）jdk 1.5换成这个,读操作超时
			url_con.setDoOutput(true);
			byte[] b = params.toString().getBytes();
			url_con.getOutputStream().write(b, 0, b.length);
			url_con.getOutputStream().flush();
			url_con.getOutputStream().close();

			InputStream in = url_con.getInputStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(in,
					"utf8"));
			String tempLine = rd.readLine();
			StringBuffer temp = new StringBuffer();
			String crlf = System.getProperty("line.separator");
			while (tempLine != null) {
				temp.append(tempLine);
				temp.append(crlf);
				tempLine = rd.readLine();
			}
			responseContent = temp.toString();
			rd.close();
			in.close();
		} catch (IOException e) {

		} finally {
			if (url_con != null) {
				url_con.disconnect();
			}
		}

		sendSuccessMessage(response, responseContent);
	}

	static String host = "bcs.duapp.com";
	static String accessKey = "dwwUAlsAtKVdt9a9xdpYTG6f";
	static String secretKey = "tEn2UBrplFLILyPD5fdnozHHNERVddwW";
	static String bucket = "lvyou01";
	// ----------------------------------------
	static String object = "/first-object";
	static File destFile = new File("test");

	@RequestMapping("/bcs")
	public void bcs_add(String[] id, HttpServletResponse response)
			throws Exception {
		BCSCredentials credentials = new BCSCredentials(accessKey, secretKey);
		BaiduBCS baiduBCS = new BaiduBCS(credentials, host);
		// baiduBCS.setDefaultEncoding("GBK");
		baiduBCS.setDefaultEncoding("UTF-8"); // Default UTF-8
		try {
			// -------------bucket-------------
			// listBucket(baiduBCS);
			// createBucket(baiduBCS);
			// deleteBucket(baiduBCS);
			// getBucketPolicy(baiduBCS);
			// putBucketPolicyByPolicy(baiduBCS);
			// putBucketPolicyByX_BS_ACL(baiduBCS, X_BS_ACL.PublicControl);
			// listObject(baiduBCS);
			// getObject(baiduBCS);
			// ------------object-------------
			// putObjectByFile(baiduBCS);
			// putObjectByInputStream(baiduBCS);
			// GetObjectRequest getObjectRequest = new GetObjectRequest(bucket,
			// "/first-object");
			// BaiduBCSResponse<DownloadObject> baiduBCSResponse =
			// baiduBCS.getObject(getObjectRequest);
			// baiduBCSResponse.
			// putSuperfile(baiduBCS);
			// deleteObject(baiduBCS);
			// getObjectMetadata(baiduBCS);
			// setObjectMetadata(baiduBCS);
			// copyObject(baiduBCS, bucket, object + "_copy" +
			// (System.currentTimeMillis()));
			// getObjectPolicy(baiduBCS);
			// putObjectPolicyByPolicy(baiduBCS);
			// putObjectPolicyByX_BS_ACL(baiduBCS, X_BS_ACL.PublicControl);

			// ------------common------------------
			// generateUrl(BaiduBCS baiduBCS);
			// generateUrl(baiduBCS);
		} catch (BCSServiceException e) {
			log.warn("Bcs return:" + e.getBcsErrorCode() + ", "
					+ e.getBcsErrorMessage() + ", RequestId="
					+ e.getRequestId());
		} catch (BCSClientException e) {
			e.printStackTrace();
		}
	}

	// 生成一个文件的签名链接地址
	public static void generateUrl(BaiduBCS baiduBCS) {
		GenerateUrlRequest generateUrlRequest = new GenerateUrlRequest(
				HttpMethodName.GET, bucket, object);
		generateUrlRequest.setBcsSignCondition(new BCSSignCondition());
		// generateUrlRequest.getBcsSignCondition().setIp("1.1.1.1");
		// generateUrlRequest.getBcsSignCondition().setTime(123455L);
		// generateUrlRequest.getBcsSignCondition().setSize(123455L);
		String genurlString = baiduBCS.generateUrl(generateUrlRequest);
		System.out.println(baiduBCS.generateUrl(generateUrlRequest));
	}

	public static void copyObject(BaiduBCS baiduBCS, String destBucket,
			String destObject) {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType("image/jpeg");
		baiduBCS.copyObject(new Resource(bucket, object), new Resource(
				destBucket, destObject), objectMetadata);
		baiduBCS.copyObject(new Resource(bucket, object), new Resource(
				destBucket, destObject), null);
		baiduBCS.copyObject(new Resource(bucket, object), new Resource(
				destBucket, destObject));
	}

	private static void createBucket(BaiduBCS baiduBCS) {
		// baiduBCS.createBucket(bucket);
		baiduBCS.createBucket(new CreateBucketRequest(bucket,
				X_BS_ACL.PublicRead));
	}

	private static void getObject(BaiduBCS baiduBCS) {
		// baiduBCS.createBucket(bucket);

	}

	private static void deleteBucket(BaiduBCS baiduBCS) {
		baiduBCS.deleteBucket(bucket);
	}

	public static void deleteObject(BaiduBCS baiduBCS) {
		Empty result = baiduBCS.deleteObject(bucket, object).getResult();
		log.info(result);
	}

	private static void getBucketPolicy(BaiduBCS baiduBCS) {
		BaiduBCSResponse<Policy> response = baiduBCS.getBucketPolicy(bucket);
		String logString = response.getResult().toJson();
		logString = response.getResult().getOriginalJsonStr();
		log.info("After analyze: " + response.getResult().toJson());
		log.info("Origianal str: " + response.getResult().getOriginalJsonStr());
	}

	public static void getObjectMetadata(BaiduBCS baiduBCS) {
		ObjectMetadata objectMetadata = baiduBCS.getObjectMetadata(bucket,
				object).getResult();
		log.info(objectMetadata);
	}

	private static void getObjectPolicy(BaiduBCS baiduBCS) {
		BaiduBCSResponse<Policy> response = baiduBCS.getObjectPolicy(bucket,
				object);
		log.info("After analyze: " + response.getResult().toJson());
		log.info("Origianal str: " + response.getResult().getOriginalJsonStr());
	}

	private static void getObjectWithDestFile(BaiduBCS baiduBCS) {
		GetObjectRequest getObjectRequest = new GetObjectRequest(bucket, object);
		baiduBCS.getObject(getObjectRequest, destFile);
	}

	private static void listBucket(BaiduBCS baiduBCS) {
		ListBucketRequest listBucketRequest = new ListBucketRequest();
		BaiduBCSResponse<List<BucketSummary>> response = baiduBCS
				.listBucket(listBucketRequest);
		for (BucketSummary bucket : response.getResult()) {
			log.info(bucket);
		}
	}

	private static void listObject(BaiduBCS baiduBCS) {
		ListObjectRequest listObjectRequest = new ListObjectRequest(bucket);
		listObjectRequest.setStart(0);
		listObjectRequest.setLimit(20);
		// ------------------by dir
		{
			// prefix must start with '/' and end with '/'
			// listObjectRequest.setPrefix("/1/");
			// listObjectRequest.setListModel(2);
		}
		// ------------------only object
		{
			// prefix must start with '/'
			// listObjectRequest.setPrefix("/1/");
		}
		BaiduBCSResponse<ObjectListing> response = baiduBCS
				.listObject(listObjectRequest);
		log.info("we get [" + response.getResult().getObjectSummaries().size()
				+ "] object record.");
		for (ObjectSummary os : response.getResult().getObjectSummaries()) {
			log.info(os.toString());
		}
	}

	private static void putBucketPolicyByPolicy(BaiduBCS baiduBCS) {
		Policy policy = new Policy();
		Statement st1 = new Statement();
		st1.addAction(PolicyAction.all).addAction(PolicyAction.get_object);
		st1.addUser("zhengkan").addUser("zhangyong01");
		st1.addResource(bucket + "/111").addResource(bucket + "/111");
		st1.setEffect(PolicyEffect.allow);
		policy.addStatements(st1);
		baiduBCS.putBucketPolicy(bucket, policy);
	}

	private static void putBucketPolicyByX_BS_ACL(BaiduBCS baiduBCS,
			X_BS_ACL acl) {
		baiduBCS.putBucketPolicy(bucket, acl);
	}

	public static void putObjectByFile(BaiduBCS baiduBCS) {
		PutObjectRequest request = new PutObjectRequest(bucket, object,
				createSampleFile());
		ObjectMetadata metadata = new ObjectMetadata();
		// metadata.setContentType("text/html");
		request.setMetadata(metadata);
		BaiduBCSResponse<ObjectMetadata> response = baiduBCS.putObject(request);
		ObjectMetadata objectMetadata = response.getResult();
		log.info("x-bs-request-id: " + response.getRequestId());
		log.info(objectMetadata);
	}

	public static void putObjectByFile(BaiduBCS baiduBCS, File file) {
		PutObjectRequest request = new PutObjectRequest(bucket, object, file);
		ObjectMetadata metadata = new ObjectMetadata();
		// metadata.setContentType("text/html");
		request.setMetadata(metadata);
		BaiduBCSResponse<ObjectMetadata> response = baiduBCS.putObject(request);
		ObjectMetadata objectMetadata = response.getResult();
		log.info("x-bs-request-id: " + response.getRequestId());
		log.info(objectMetadata);
		System.out.print(objectMetadata);
	}

	public static void putObjectByInputStream(BaiduBCS baiduBCS)
			throws FileNotFoundException {
		File file = createSampleFile();
		InputStream fileContent = new FileInputStream(file);
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType("text/html");
		objectMetadata.setContentLength(file.length());
		PutObjectRequest request = new PutObjectRequest(bucket, object,
				fileContent, objectMetadata);
		ObjectMetadata result = baiduBCS.putObject(request).getResult();
		log.info(result);
	}

	private static void putObjectPolicyByPolicy(BaiduBCS baiduBCS) {
		Policy policy = new Policy();
		Statement st1 = new Statement();
		st1.addAction(PolicyAction.all).addAction(PolicyAction.get_object);
		st1.addUser("zhengkan").addUser("zhangyong01");
		st1.addResource(bucket + object).addResource(bucket + object);
		st1.setEffect(PolicyEffect.allow);
		policy.addStatements(st1);
		baiduBCS.putObjectPolicy(bucket, object, policy);
	}

	private static void putObjectPolicyByX_BS_ACL(BaiduBCS baiduBCS,
			X_BS_ACL acl) {
		baiduBCS.putObjectPolicy(bucket, object, acl);
	}

	public static void putSuperfile(BaiduBCS baiduBCS) {
		List<SuperfileSubObject> subObjectList = new ArrayList<SuperfileSubObject>();
		// 0
		BaiduBCSResponse<ObjectMetadata> response1 = baiduBCS.putObject(bucket,
				object + "_part0", createSampleFile());
		subObjectList.add(new SuperfileSubObject(bucket, object + "_part0",
				response1.getResult().getETag()));
		// 1
		BaiduBCSResponse<ObjectMetadata> response2 = baiduBCS.putObject(bucket,
				object + "_part1", createSampleFile());
		subObjectList.add(new SuperfileSubObject(bucket, object + "_part1",
				response2.getResult().getETag()));
		// put superfile
		PutSuperfileRequest request = new PutSuperfileRequest(bucket, object
				+ "_superfile", subObjectList);
		BaiduBCSResponse<ObjectMetadata> response = baiduBCS
				.putSuperfile(request);
		ObjectMetadata objectMetadata = response.getResult();
		log.info("x-bs-request-id: " + response.getRequestId());
		log.info(objectMetadata);
	}

	public static void setObjectMetadata(BaiduBCS baiduBCS) {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType("text/html12");
		baiduBCS.setObjectMetadata(bucket, object, objectMetadata);
	}

	private static File createSampleFile() {
		try {
			File file = File.createTempFile("java-sdk-", ".txt");
			file.deleteOnExit();

			Writer writer = new OutputStreamWriter(new FileOutputStream(file));
			writer.write("01234567890123456789\n");
			writer.write("01234567890123456789\n");
			writer.write("01234567890123456789\n");
			writer.write("01234567890123456789\n");
			writer.write("01234567890123456789\n");
			writer.close();

			return file;
		} catch (IOException e) {
			log.error("tmp file create failed.");
			return null;
		}
	}

	/**
	 * 更新课程浏览历史
	 * @param sxCourse
	 * @param request
	 */
	private void updateViewHistory(SxCourseWithProgram sxCourse, HttpServletRequest request) {
		if (null == sxCourse) {
			return;
		}

		HttpSession session = request.getSession();
		
		Object sessionAttr = session.getAttribute(SESSION_KEY_COURSE_VIEW_HISTORY);
		
		List<SxCourseWithProgram> viewHistory = null;

		//获取会话存储
		if (sessionAttr instanceof List) {
			viewHistory = (List<SxCourseWithProgram>) sessionAttr;
		} else {
			viewHistory = new LinkedList<SxCourseWithProgram>();
			session.setAttribute(SESSION_KEY_COURSE_VIEW_HISTORY, viewHistory);
		}

		viewHistory.add(sxCourse);
		
		//保存浏览内容至页面
		request.setAttribute("viewHistory", viewHistory);
	}
	
	
	/**
	 * 查询同类课程
	 * @param sxCourse
	 * @param request
	 */
	private void findSameCourses(SxCourse sxCourse, HttpServletRequest request){
		if(null == sxCourse){
			return;
		}
		
		List<SxCourse> sameCourses = sxCourseService.getSameTypeCourses(sxCourse.getType_code());
		
		if(null != sameCourses){
			request.setAttribute("sameCourses", sameCourses);
		}
	}
}

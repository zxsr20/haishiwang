package scott.entity.shanxue;

import com.base.entity.BaseEntity;
import java.math.BigDecimal;
/**
 * 
 * <br>
 * <b>功能：</b>SxRecommendCourseEntity<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public class SxRecommendCourse extends BaseEntity {
	
		private java.lang.Integer id;//   id	private java.lang.Integer courseid;//   课程id	private java.lang.String create_by;//   CREATE_BY	private java.util.Date create_date;//   CREATE_DATE	private java.lang.String update_by;//   UPDATE_BY	private java.util.Date update_date;//   UPDATE_DATE	private java.lang.Integer delflag;//   DELFLAG	private java.util.Date del_date;//   DEL_DATE	public java.lang.Integer getId() {	    return this.id;	}	public void setId(java.lang.Integer id) {	    this.id=id;	}	public java.lang.Integer getCourseid() {	    return this.courseid;	}	public void setCourseid(java.lang.Integer courseid) {	    this.courseid=courseid;	}	public java.lang.String getCreate_by() {	    return this.create_by;	}	public void setCreate_by(java.lang.String create_by) {	    this.create_by=create_by;	}	public java.util.Date getCreate_date() {	    return this.create_date;	}	public void setCreate_date(java.util.Date create_date) {	    this.create_date=create_date;	}	public java.lang.String getUpdate_by() {	    return this.update_by;	}	public void setUpdate_by(java.lang.String update_by) {	    this.update_by=update_by;	}	public java.util.Date getUpdate_date() {	    return this.update_date;	}	public void setUpdate_date(java.util.Date update_date) {	    this.update_date=update_date;	}	public java.lang.Integer getDelflag() {	    return this.delflag;	}	public void setDelflag(java.lang.Integer delflag) {	    this.delflag=delflag;	}	public java.util.Date getDel_date() {	    return this.del_date;	}	public void setDel_date(java.util.Date del_date) {	    this.del_date=del_date;	}
}


package scott.entity.shanxue;

import com.base.entity.BaseEntity;
import java.math.BigDecimal;
/**
 * 
 * <br>
 * <b>功能：</b>SxMyStudyWayEntity<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */

//有几个多余的属性，可以在返回的时候返回
public class SxMyStudyWayNew extends BaseEntity {
	
	
	private java.lang.Integer id;//   id
	private java.lang.Integer userid;//   用户id
	private java.lang.Integer courseid;//   课程id
	private java.lang.String coursename;//   coursename
	private java.lang.String picture;//   picture
	private java.lang.Integer programid;//   节目id
	private java.lang.String programname;//   programname
	private java.util.Date look_time;//   什么时候看的
	private java.lang.Integer play_time;//   播放到的时间
	private java.lang.String create_by;//   CREATE_BY
	private java.util.Date create_date;//   CREATE_DATE
	private java.lang.String update_by;//   UPDATE_BY
	private java.util.Date update_date;//   UPDATE_DATE
	private java.lang.Integer delflag;//   DELFLAG
	private java.util.Date del_date;//   DEL_DATE
	
	
	
	public java.lang.String getCoursename() {
		return coursename;
	}
	public void setCoursename(java.lang.String coursename) {
		this.coursename = coursename;
	}
	public java.lang.String getProgramname() {
		return programname;
	}
	public void setProgramname(java.lang.String programname) {
		this.programname = programname;
	}
	public java.lang.Integer getId() {
	    return this.id;
	}
	public void setId(java.lang.Integer id) {
	    this.id=id;
	}
	public java.lang.Integer getUserid() {
	    return this.userid;
	}
	public void setUserid(java.lang.Integer userid) {
	    this.userid=userid;
	}
	public java.lang.Integer getCourseid() {
	    return this.courseid;
	}
	public void setCourseid(java.lang.Integer courseid) {
	    this.courseid=courseid;
	}
	public java.lang.Integer getProgramid() {
	    return this.programid;
	}
	public void setProgramid(java.lang.Integer programid) {
	    this.programid=programid;
	}
	public java.util.Date getLook_time() {
	    return this.look_time;
	}
	public void setLook_time(java.util.Date look_time) {
	    this.look_time=look_time;
	}
	public java.lang.Integer getPlay_time() {
	    return this.play_time;
	}
	public void setPlay_time(java.lang.Integer play_time) {
	    this.play_time=play_time;
	}
	public java.lang.String getCreate_by() {
	    return this.create_by;
	}
	public void setCreate_by(java.lang.String create_by) {
	    this.create_by=create_by;
	}
	public java.util.Date getCreate_date() {
	    return this.create_date;
	}
	public void setCreate_date(java.util.Date create_date) {
	    this.create_date=create_date;
	}
	public java.lang.String getUpdate_by() {
	    return this.update_by;
	}
	public void setUpdate_by(java.lang.String update_by) {
	    this.update_by=update_by;
	}
	public java.util.Date getUpdate_date() {
	    return this.update_date;
	}
	public void setUpdate_date(java.util.Date update_date) {
	    this.update_date=update_date;
	}
	public java.lang.Integer getDelflag() {
	    return this.delflag;
	}
	public void setDelflag(java.lang.Integer delflag) {
	    this.delflag=delflag;
	}
	public java.util.Date getDel_date() {
	    return this.del_date;
	}
	public void setDel_date(java.util.Date del_date) {
	    this.del_date=del_date;
	}
	public java.lang.String getPicture() {
		return picture;
	}
	public void setPicture(java.lang.String picture) {
		this.picture = picture;
	}
	
}


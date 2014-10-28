package scott.entity.shanxue;

import com.base.entity.BaseEntity;
import java.math.BigDecimal;

/**
 * 
 * <br>
 * <b>功能：</b>SxCourseCommentsEntity<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public class SxCourseComments extends BaseEntity {

	private java.lang.Integer id;// ???ID
	private java.lang.Integer course_id;// ???ID
	private java.lang.Integer user_id;// ??????ID
	private java.lang.String content;// ??????
	private java.lang.String create_date;// ?????????
	private scott.entity.shanxue.SxUserInfo user;

	public java.lang.Integer getId() {
		return this.id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

	public java.lang.Integer getCourse_id() {
		return this.course_id;
	}

	public void setCourse_id(java.lang.Integer course_id) {
		this.course_id = course_id;
	}

	public java.lang.Integer getUser_id() {
		return this.user_id;
	}

	public void setUser_id(java.lang.Integer user_id) {
		this.user_id = user_id;
	}

	public java.lang.String getContent() {
		return this.content;
	}

	public void setContent(java.lang.String content) {
		this.content = content;
	}

	public java.lang.String getCreate_date() {
		return this.create_date;
	}

	public void setCreate_date(java.lang.String create_date) {
		this.create_date = create_date;
	}

	public scott.entity.shanxue.SxUserInfo getUser() {
		return user;
	}

	public void setUser(scott.entity.shanxue.SxUserInfo user) {
		this.user = user;
	}

}

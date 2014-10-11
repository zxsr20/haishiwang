package scott.entity.shanxue;

import java.util.ArrayList;
import java.util.List;

import com.base.entity.BaseEntity;

public class SxCourseWithProgram extends BaseEntity {
	
	
	private SxCourse sxCourse;
	
	private List<SxProgram>  sxPrograms;
	
	private String programid;
	
	private String play_url;
	
	private String next_url;
	
	public List<SxProgram> getSxPrograms() {
		return sxPrograms;
	}

	public void setSxPrograms(List<SxProgram> sxPrograms) {
		this.sxPrograms = sxPrograms;
	}
	
	public SxCourse getSxCourse() {
		return sxCourse;
	}

	public void setSxCourse(SxCourse sxCourse) {
		this.sxCourse = sxCourse;
	}

	public String getProgramid() {
		return programid;
	}

	public void setProgramid(String programid) {
		this.programid = programid;
	}

	public String getPlay_url() {
		return play_url;
	}

	public void setPlay_url(String play_url) {
		this.play_url = play_url;
	}

	public String getNext_url() {
		return next_url;
	}

	public void setNext_url(String next_url) {
		this.next_url = next_url;
	}
	
	
	
	

	
	
}

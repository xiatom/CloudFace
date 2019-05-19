package com.ace.model;

public class Star {
	 String error_msg;
	 String error_code;
	 String group_id;
	 String user_id;
	 String user_info;
	 String score;
	 public String getError_msg() {
		return error_msg;
	}
	@Override
	public String toString() {
		return "Star [error_msg=" + error_msg + ", error_code=" + error_code + ", group_id=" + group_id + ", user_id="
				+ user_id + ", user_info=" + user_info + ", score=" + score + "]";
	}
	public void setError_msg(String error_msg) {
		this.error_msg = error_msg;
	}
	public String getError_code() {
		return error_code;
	}
	public void setError_code(String error_code) {
		this.error_code = error_code;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_info() {
		return user_info;
	}
	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
}

package com.sys.entity;

import java.util.Date;

/**
 * 用户表
 */

public class User extends BaseModel {

	private static final long serialVersionUID = 1L;
	
	private String name;
	
	private String phone;
	
	private String avatar;
	
	private Integer status;
	
	private String token;
	
	private Date token_expire;
	
	private String inviter;
	
	private String path;
	
	private Boolean admin_user;
	
	private Boolean app_user;
	
	private Boolean agent_user;
	
	private Boolean shop_user;
	
	private Boolean black;
	
	private Integer level;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Date getToken_expire() {
		return token_expire;
	}

	public void setToken_expire(Date token_expire) {
		this.token_expire = token_expire;
	}

	public String getInviter() {
		return inviter;
	}

	public void setInviter(String inviter) {
		this.inviter = inviter;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Boolean getAdmin_user() {
		return admin_user;
	}

	public void setAdmin_user(Boolean admin_user) {
		this.admin_user = admin_user;
	}

	public Boolean getApp_user() {
		return app_user;
	}

	public void setApp_user(Boolean app_user) {
		this.app_user = app_user;
	}

	public Boolean getAgent_user() {
		return agent_user;
	}

	public void setAgent_user(Boolean agent_user) {
		this.agent_user = agent_user;
	}

	public Boolean getShop_user() {
		return shop_user;
	}

	public void setShop_user(Boolean shop_user) {
		this.shop_user = shop_user;
	}

	public Boolean getBlack() {
		return black;
	}

	public void setBlack(Boolean black) {
		this.black = black;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	
}

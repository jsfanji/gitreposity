package com.sys.entity;

import java.io.Serializable;
import java.sql.Timestamp;



public class BaseModel implements Serializable {

	private static final long serialVersionUID = -2113718894872074627L;

	private long id;

	private Timestamp created_at;

	private Timestamp updated_at;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public Timestamp getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}

	

}

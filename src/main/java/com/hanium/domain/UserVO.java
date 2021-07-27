package com.hanium.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private String userid;
	private String userptype;
	private String userdept;
	private String username;
	private String userpw;
	private String useremail;
	private String userbirth;
	private String userphone;
	private boolean valid;
	private boolean permission;
	private Date reqdate;
}

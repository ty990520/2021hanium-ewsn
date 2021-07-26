package com.hanium.domain;
import java.util.Date;

import lombok.Data;

@Data
public class ActionVO {
	private Long AC_no;
	private String AC_plan ;
	private Date AC_expectedDate;
	private String AC_dept;
	private String AC_manager;
	private String AC_type;

}

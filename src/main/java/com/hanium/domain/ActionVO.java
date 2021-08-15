package com.hanium.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ActionVO {
	private Long AC_no; //권고발행번호 
	private String AC_plan ; //조치계획 
	private String AC_expectedDate; //조치예상일자
	private String AC_dept; //조치부서
	private String AC_manager; //조치담당자 
	private String AC_type; //조치구분 


}

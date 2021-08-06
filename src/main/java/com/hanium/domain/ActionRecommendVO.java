package com.hanium.domain;


import java.util.Date;

import lombok.Data;

@Data
public class ActionRecommendVO {
	private Long AR_no;  //권고발행번호 
	private Date AR_regDate; //발행일자
	private String AR_daID; //자산번호 
	private String AR_daName; //자산명
	private String AR_daSystemSW;  //시스템 S/W유형
	private String AR_ActionType; //조치유형
	private String AR_title;//제목
	private String AR_issue; //권고사항
	private String AR_regDept;  //발행부서
	private String RegistrarID; //발행자 
}

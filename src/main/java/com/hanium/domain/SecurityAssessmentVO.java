package com.hanium.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SecurityAssessmentVO {
	private Long SA_no;
	private String SA_daID;
	private Date SA_date;
	private String SA_IdentifyType;
}

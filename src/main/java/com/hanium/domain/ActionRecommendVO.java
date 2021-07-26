package com.hanium.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ActionRecommendVO {
	private Long AR_no;
	private Date AR_regDate;
	private String AR_daID;
	private String AR_daName;
	private String AR_ActionType;
	private String AR_issue;
	private String AR_regDept;
	private String RegistrarID;
}

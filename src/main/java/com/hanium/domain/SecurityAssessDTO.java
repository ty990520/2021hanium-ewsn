package com.hanium.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SecurityAssessDTO {
	private Long SA_no;
	private String daname;
	private String SA_daID;
	private String daptype;
	private String daPDetailType;
	private Date SA_date;
	private String SA_IdentifyType;
}

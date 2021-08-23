package com.hanium.domain;

import java.util.Date;

import lombok.Data;


@Data
public class ControlledItemsApplyDTO {
	private Long CI_apply_no;
	private Date CI_applyDate;
	
	private String CI_daID;
	private String CI_daname;
	
	private String checkerID;
	private String CI_apply_version;
	
	private String[] CI_applyDetail_id;
	private String[] CI_applyContent;
	private String[] CI_applyCheck;
}

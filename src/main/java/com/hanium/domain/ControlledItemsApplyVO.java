package com.hanium.domain;

import java.util.Date;

import lombok.Data;


@Data
public class ControlledItemsApplyVO {
	private Long CI_apply_no;
	private String CI_daID;
	private String CI_apply_version;
	private String CI_applyContent;
	private String CI_applyCheck;
	private Date CI_applyDate;
	private String checkerID;
	private String CI_applyDetail_id;
	private String CI_daname;
	private Long ci_version_no;
}

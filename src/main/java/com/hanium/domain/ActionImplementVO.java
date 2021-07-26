package com.hanium.domain;
import java.util.Date;

import lombok.Data;

@Data
public class ActionImplementVO {
	private Long AI_no;
	private Boolean AI_check ;
	private String AI_impossibleReason;
	private String AI_AlterMeasures;
	private String AR_daSystemSW;
	private String AI_result;
	private Date AI_finishDate;
}

package com.hanium.domain;

import lombok.Data;

@Data
public class ActionImplementVO {
	private Long AI_no; //권고발행번호
	private char AI_check ; //이행여부 
	private String AI_impossibleReason; // 조치불가사유
	private String AI_AlterMeasures;  //대안조치
	private String AI_result; //이행결과 
	private String AI_finishDate; //이행완료일자
}

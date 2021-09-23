package com.hanium.domain;

import lombok.Data;

@Data
public class ActionVO {
	private Long AC_no; //권고발행번호 
	private String AC_plan1 ; //조치계획1	(추가)
	private String AC_plan2 ; //조치계획2 	(추가)
	private String AC_plan3 ; //조치계획3 	(추가)
	private String AC_expectedDate1; //조치예상일자1	(추가)
	private String AC_expectedDate2; //조치예상일자2	(추가)
	private String AC_expectedDate3; //조치예상일자3	(추가)
	private Long estimated_cost;	//예상비용			(추가)
	private String AC_dept; //조치부서
	private String AC_manager; //조치담당자 
	private String AC_type; //조치구분 

	/* 기존에 있던 AC_plan와 AC_expectedDate에 인덱스번호 매긴 것이니 확인 부탁해용 */
}

package com.hanium.domain;

import lombok.Data;

@Data
public class ActionRecommendDTO {
	private String CI_detail_id; //통제항목 ID pk
	private String CI_type;  //통제항목분류  
	private String CI_detailType; //상세분류
	private String CI_content; //통제항목 내용 
	//취약점
	private String Vul_id; //pk
	private String VulName; //취약점명
	private String Vul_Manufacturer; //제조사 
	private String Val_model; //모델명
	private String Val_systemSW; //시스템sw유형
	private String vul_ci_id;
	
	public ActionRecommendDTO() {}
	public ActionRecommendDTO(String vul_Manufacturer, String val_model, String val_systemSW) {
		super();
		Vul_Manufacturer = vul_Manufacturer;
		Val_model = val_model;
		Val_systemSW = val_systemSW;
	}

	
}

package com.hanium.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DAVO {
	private String daid;
	private String daname;
	private String daptype;
	private String daPDetailType;
	private String daFunc;
	private String daFuncType;
	private String daImpact;
	private String daFacilitiesType;
	private String daFacilitiesPurposeOfUse;
	private String daSystemSW;
	private String daReportIF;
	private String daStorageDevice;
	private String daModifyOPAvailability;
	private String daModifiableOperationData;
	private String daHMIType;
	private String daIdentifyType;
	private String daUse;	//1 : 사용 0: 미사
	private String daManufacturer;
	private String daModel;
	private String daRegistrarID;
	private String daLastUpdateID;
	private Date daRegDate;
	private Date daUpdateDate;

}

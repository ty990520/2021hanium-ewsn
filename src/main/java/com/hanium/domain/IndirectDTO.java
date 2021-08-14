package com.hanium.domain;

import lombok.Data;

@Data
public class IndirectDTO {
	private Long indirectNo;
	private String indIWPerformContent;
	private String indIWAlterContent;
	private String indDmgDetectContent;
	private String indDmgDetectDoc;
	private String indDmgDetectASContent;
	private String indDmgDetectASDoc;
	private String indETContent;
	private String indETDoc;
	private String[] checkArray;
}

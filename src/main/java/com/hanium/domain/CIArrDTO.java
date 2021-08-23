package com.hanium.domain;

import lombok.Data;

@Data
public class CIArrDTO {
	
	private String ciid;
	private String content;
	private String check;
	private String citype;
	private String cidetype;
	
	public CIArrDTO(String ciid, String content, String check, String citype, String cidetype) {
		this.ciid = ciid;
		this.content = content;
		this.check = check;
		this.citype = citype;
		this.cidetype = cidetype;
	}
}

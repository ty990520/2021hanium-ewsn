package com.hanium.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Criteria {
	private int pageNum;	//현재 페이지
	private int amount;		//보여줄 양
	
	private int startIndex;
	private int endIndex;
	
	private String type;	//검색
	private String keyword;	//검색
	
	public Criteria() {
		this(1,10);
		setPageIndex();
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		setPageIndex();
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		setPageIndex();
	}

	public void setAmount(int amount) {
		this.amount = amount;
		setPageIndex();
	}
	
	public void setPageIndex() {
		startIndex = (pageNum-1)*amount;	
		endIndex = pageNum*amount;
	}
	
	/*여러개의 파라미터들을 연결해서 url형태로 만들어줌*/
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
		.queryParam("pageNum", this.getPageNum())
		.queryParam("amount", this.getAmount())
		.queryParam("type", this.getType())
		.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}

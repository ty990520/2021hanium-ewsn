package com.hanium.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Criteria {
	private int pageNum;	//현재 페이지
	private int amount;		//보여줄 양
	
	private int startIndex;
	private int endIndex;
	
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
	
}

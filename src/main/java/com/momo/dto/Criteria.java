package com.momo.dto;

/**
 * 리스트를 조회하기 위한 파라메터 세팅
 */
public class Criteria {
	// 값이 넘어오지 않을 경우 대비해 기본값 설정
	private int pageNo = 1;
	private int amount = 10;
	
	private int startNum;
	private int endNum;
	
	public Criteria() {
		this.endNum = this.pageNo * this.amount;
		this.startNum = this.endNum - this.amount +1; 
	};
	
	public Criteria(String pageNo, String amount) {
		
		if(pageNo != null && !"".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);
		}
		if(amount != null && !"".equals(amount)) {
			this.amount = Integer.parseInt(amount);
		}
		
		this.endNum = this.pageNo * this.amount;
		this.startNum = this.endNum - this.amount +1; 
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getStartNum() {
		return startNum;
	}

	
	public int getEndNum() {
		return endNum;
	}

	
}

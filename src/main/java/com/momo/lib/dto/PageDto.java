package com.momo.lib.dto;

import com.momo.dto.Criteria;

public class PageDto {
	// navigation 그리기 위해 만드는 dto
	private int startNo;
	private int endNo;
	private int realEnd;
	
	private int blockAmount = 10;
	private int totalCnt;
	private Criteria cri;
	boolean prev, next;
	

	public PageDto(int totalCnt, Criteria cri) {
		this.totalCnt = totalCnt;
		this.cri = cri;
		
		// startNo, endNo 계산
		endNo = (int)Math.ceil(cri.getPageNo()/(blockAmount * 1.0)) * blockAmount;
		startNo = endNo - blockAmount + 1;
		realEnd = (int)Math.ceil(this.totalCnt/(cri.getAmount() * 1.0)) * cri.getAmount();
		// 만약 realEnd가 endNo보다 작으면 endNo를 realEnd로 바꿔줌
		this.endNo = (endNo > realEnd)? realEnd : endNo;
		
		
		prev = (startNo == 1)? false : true;
		next = (endNo == realEnd)? false : true;
		
	}
	
	public PageDto(String blockAmount, int totalCnt, Criteria cri) {
		this(totalCnt, cri);
		if(blockAmount != null && !"".equals(blockAmount)) {
			this.blockAmount = Integer.parseInt(blockAmount);
		}
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getRealEnd() {
		return realEnd;
	}

	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}

	public int getBlockAmount() {
		return blockAmount;
	}

	public void setBlockAmount(int blockAmount) {
		this.blockAmount = blockAmount;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	
}
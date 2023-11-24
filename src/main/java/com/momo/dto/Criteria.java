package com.momo.dto;

/**
 * 리스트를 조회하기 위한 파라메터 세팅
 */
public class Criteria {
	// 값이 넘어오지 않을 경우 대비해 기본값 설정
	// 페이지 번호
	private int pageNo = 1;
	// 페이지당 게시물 수
	private int amount = 10;
	
	// 검색어
	private String searchWord = "";
	// 검색필드
	private String searchField = "";
	private String searchRent="";
	// 페이지 번호와 게시물수를 입력받아
	// 조회할 게시글의 시작번호, 끝번호를 구함
	// 조회할 게시글의 시작번호
	private int startNum;
	// 조회할 게시글의 끝번호
	private int endNum;
	
	public Criteria() {
		// 시작, 끝번호를 구함
		this.endNum = this.pageNo * this.amount;
		this.startNum = this.endNum - this.amount +1; 
	};
	
	/**
	 * 생성자를 통해 페이지번호와 페이지당 게시물 수를 받아
	 * 시작번호와 끝번호를 구함
	 * @param pageNo
	 * @param amount
	 */
	public Criteria(String pageNo, String amount, String searchField, String searchWord, String searchRent) {
		
		if(pageNo != null && !"".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);
		}
		if(amount != null && !"".equals(amount)) {
			this.amount = Integer.parseInt(amount);
		}
		if(searchField != null && !"".equals(searchField)) {
			this.searchField = searchField;
		}
		if(searchWord != null && !"".equals(searchWord)) {
			this.searchWord = searchWord;
		}
		if(searchRent != null && !"".equals(searchRent)) {
			this.searchRent = searchRent;
		}
		
		this.endNum = this.pageNo * this.amount;
		this.startNum = this.endNum - this.amount +1; 
	}

	@Override
	public String toString() {
		// 재정의 하지 않으면 주소가 출력됨
		// toString method 재정의하여 객체가 가진 필드값을 출력해줌
		return "[searchWord]" + this.searchWord
				+ "\n[searchField]" + this.searchField
				+"\n[pageNo]" + this.pageNo
				+"\n[amount]" + this.amount;
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

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchRent() {
		return searchRent;
	}

	public void setSearchRent(String searchRent) {
		this.searchRent = searchRent;
	}




	

	
}

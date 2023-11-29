package com.momo.book.dto;

/**
 * 도서테이블의 정보를 담아줌
 */
public class BookDto {
	private String no;
	private String title;
	private String author;
	private String rentYn;
	private String rentYnStr;
	private int visitcount;
	
	// 생성자
	public BookDto(String no, String title, String author, String rentYn, int visitcount) {
		this.no = no;
		this.title = title;
		this.author = author;
		this.rentYn = rentYn;
		rentYnStr = rentYn.equals("Y") ? "대여중" : "대여가능";
		this.visitcount = visitcount;
	}
	
	@Override
	public String toString() {
		return "[title "+title +"]";
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

	public String getRentYn() {
		return rentYn;
	}

	public void setRentYn(String rentYn) {
		this.rentYn = rentYn;
	}

	public String getRentYnStr() {
		return rentYnStr;
	}

	public void setRentYnStr(String rentYnStr) {
		this.rentYnStr = rentYnStr;
	}

	public int getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
	
	
	
}

package org.zerock.domain;

public class Criteria {
	private int skip;
	private int page;
	private int pageNum;
	private String keyword;
	private String type;

	public Criteria() {
		page = 1;
		pageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page < 0) {
			this.page = 1;
		}

		this.page = page;
	}

	public int getPageNum() {
		if (this.pageNum < 0 || this.pageNum > 10) {
			this.pageNum = 10;
		}
		return pageNum;
	}

	public int getPageStart() {
		return (this.page - 1) * pageNum;
	}

	public void setPageNum(int pageNum) {
		if (this.pageNum < 0 || this.pageNum > 10) {
			this.pageNum = 10;
		}
		this.pageNum = pageNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSkip() {

		return (this.page - 1) * this.pageNum;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageNum=" + pageNum + ", keyword=" + keyword + ", type=" + type + "]";
	}

}

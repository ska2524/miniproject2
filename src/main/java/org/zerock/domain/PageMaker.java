package org.zerock.domain;

public class PageMaker {
	
	private int start, end;
	private int current;
	private int size;
	private int total;
	private boolean prev, next;
	Criteria cri;
	
	public PageMaker(Criteria cri,int total){
		
		
		this.start = start;
		this.end = end;
		this.total = total;
		this.current = cri.getPage();
		this.size = cri.getPageNum();
		this.cri = cri;
		calc();
		
		
	}
	
	
	private void calc(){
		
		int TempEnd = (int) (Math.ceil(current/10.0)*10);
		start = TempEnd - 9;
		end = (int) (TempEnd*size>total?Math.ceil(total/(double)size):TempEnd);
		prev = start == 1?false:true;
		next = TempEnd*size < total?true:false;
		
	}


	public int getStart() {
		
			
		return start;
	}


	public void setStart(int start) {
		
		if(this.start>0){
		this.start = start;	
		}
		
		
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
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


	
	
	public int getCurrent() {
		return current;
	}


	public void setCurrent(int current) {
		this.current = current;
	}


	public int getSize() {
		return size;
	}


	public void setSize(int size) {
		this.size = size;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}
	
	


	public Criteria getCri() {
		return cri;
	}


	public void setCri(Criteria cri) {
		this.cri = cri;
	}


	@Override
	public String toString() {
		return "PageMaker [start=" + start + ", end=" + end + ", current=" + current + ", size=" + size + ", total="
				+ total + ", prev=" + prev + ", next=" + next + ", cri=" + cri + "]";
	}


	

	

  
	
	
	
}

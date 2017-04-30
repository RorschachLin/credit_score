package com.le.ac.core.util;
import java.util.List;
public class Pager {
public final static String NUMBER_DEFAULT_PATTERN = "^\\d+$";
	
	private static int DEFAULT_PAGE_SIZE = 10;
	
	public int pageSize;
	
	public int currentPage;//当前页数
	
	public int totalPage ;
	
	public long totalRecord;
	
	public List<?> data; // 当前页中存放的记录,类型一般为List
	

	public Pager() {

	}

	public Pager(int currentPage, int pageSize ) {
		this.pageSize = pageSize;
		this.currentPage = validCurrentPage(currentPage, totalPage);
	}
	
	public Pager(int currentPage, int pageSize, long totalRecord) {
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		this.totalPage = (int)Math.ceil(((double)totalRecord+(double)pageSize)/(double)pageSize);
		this.currentPage = validCurrentPage(currentPage, totalPage);
	}
	
	public Pager(int currentPage, int pageSize, long totalRecord,
			List<?> data) {
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		this.totalPage = (int)Math.ceil((double)totalRecord/(double)pageSize);
		this.currentPage = validCurrentPage(currentPage, totalPage);
		this.data = data;
	}

	private int validCurrentPage(int currentPage, int totalPage){
		if(currentPage > totalPage){
			currentPage = totalPage;
		}else if(currentPage <= 0){
			currentPage = 1;
		}
		return currentPage;
	}
	
	public static int validPageNo(int currentPage, int pageSize,long totalRecord){
		int tmpTotalPage = 0 ;
		tmpTotalPage = (int)Math.ceil((double)totalRecord/(double)pageSize);
		if(currentPage > tmpTotalPage){
			currentPage = tmpTotalPage;
		}else if(currentPage <= 0){
			currentPage = 1;
		}
		return currentPage;
	}
	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = validCurrentPage(currentPage, this.totalPage);
	}

	public long getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(long totalRecord) {
		this.totalRecord = totalRecord;
		this.totalPage = (int)Math.ceil(((double)totalRecord+(double)pageSize)/(double)pageSize);
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	/**
	 * 获取任一页第一条数据在数据集的位置，每页条数使用默认值.
	 *
	 * @see #getStartOfPage(int,int)
	 */
	protected static int getStartOfPage(int pageNo) {
		return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
	}

	/**
	 * 获取任一页第一条数据在数据集的位置.
	 *
	 * @param pageNo   从1开始的页号
	 * @param pageSize 每页记录条数
	 * @return 该页第一条数据
	 */
	public static int getStartOfPage(int pageNo, int pageSize) {
		
		return (pageNo - 1) * pageSize;
	}
}
package com.pojo;


public class Page {
	private User user;
	private Bill bill;
	private Provider provider;
	private int currentPage;//当前页
	private int totalPage;//总页数
	private int totalEmployee;//总人数
	private int nextPage;//下一页
	private int usedPage;//上一页
	private int pageSize=4;//每页多少条数据
	private int startPageEmployee;//展示那一页的第一条数据
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Bill getBill() {
		return bill;
	}
	public void setBill(Bill bill) {
		this.bill = bill;
	}
	public Provider getProvider() {
		return provider;
	}
	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		if(totalEmployee%pageSize==0){
			totalPage=totalEmployee/pageSize;
		}else{
			totalPage=totalEmployee/pageSize+1;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalEmployee() {
		return totalEmployee;
	}
	public void setTotalEmployee(int totalEmployee) {
		this.totalEmployee = totalEmployee;
	}
	public int getNextPage() {
		if(currentPage==totalPage){
			nextPage=totalPage;
		}else{
			nextPage=currentPage+1;
		}
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getUsedPage() {
		if(currentPage==1){
			usedPage=currentPage;
		}else{
			usedPage=currentPage-1;
		}
		return usedPage;
	}
	public void setUsedPage(int usedPage) {
		this.usedPage = usedPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStartPageEmployee() {
		
		startPageEmployee=(currentPage-1)*pageSize;
		
		return startPageEmployee;
	}
	public void setStartPageEmployee(int startPageEmployee) {
		this.startPageEmployee = startPageEmployee;
	}
}

package com.pojo;


public class Page {
	private User user;
	private Bill bill;
	private Provider provider;
	private int currentPage;//��ǰҳ
	private int totalPage;//��ҳ��
	private int totalEmployee;//������
	private int nextPage;//��һҳ
	private int usedPage;//��һҳ
	private int pageSize=4;//ÿҳ����������
	private int startPageEmployee;//չʾ��һҳ�ĵ�һ������
	
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

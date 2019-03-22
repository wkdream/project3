package com.controllers;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Bill;
import com.pojo.Page;
import com.pojo.Provider;
import com.services.BillService;

@Controller
public class BillController {
	@Autowired
	private BillService billService;
	
	@RequestMapping("/findAll_bill.action")
	public String find_all_bill(HttpServletRequest request){
		
		List<Bill> list = billService.findAll();
		Page page = new Page();
		page.setTotalEmployee(list.size());
		page.setCurrentPage(1);
		Bill bill = new Bill();
		bill.setB_name("_");
		page.setBill(bill);
		List<Bill> billListByPage = billService.getAllBillByPage(page);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("billListByPage", billListByPage);
		
		return "redirect:findAll_providername.action";
	}
	@RequestMapping("/findAllBillbychangePage.action")
	public void findAllUserByChangePage(HttpServletRequest request,String currentPage,HttpServletResponse response,Bill bill){
		if(bill.getB_name()==null){
			bill.setB_name("_");
		}
		Page page = new Page();
		List<Bill> list=null;
		if(bill.getB_name()==null||bill.getB_name()=="_"){
			list = billService.findAll();
		}else{
			list = billService.findBilllikeName(bill.getB_name());
		}
		page.setTotalEmployee(list.size());
		if(currentPage==null){
			page.setCurrentPage(1);
		}else{
			int intcurrentPage = Integer.parseInt(currentPage);//String转成int
			page.setCurrentPage(intcurrentPage);
		}
		 page.setBill(bill);
		List<Bill> billListByPage = billService.getAllBillByPage(page);
		request.getSession().setAttribute("page", page);
		/*System.out.println("总页数"+page.getTotalPage());
		System.out.println("当前页"+page.getCurrentPage());
		System.out.println("下一页"+page.getNextPage());
		System.out.println("上一页"+page.getUsedPage());
		System.out.println("开始行"+page.getStartPageEmployee());*/
		request.getSession().setAttribute("billListByPage", billListByPage);
		try {
			response.getWriter().write("<script>window.open('billList.jsp','right')</script>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/delBill.action")
	public void delBill(String b_id,String currentpage,HttpServletResponse response){
		billService.delBill(b_id);
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter.print(1);
	}
	@RequestMapping("/addBill.action")
	public void addbill(Bill bill,HttpServletRequest request,HttpServletResponse response,String p_id){
		Provider provider = new Provider();
		provider.setP_id(p_id);
		bill.setProvider(provider);
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println("商品名称"+bill.getB_name());
//		System.out.println(billService.getAllBillByName(bill.getB_name()));
		if(billService.getAllBillByName(bill.getB_name())!=null){
			billService.updateBill(bill);
			PrintWriter.print(1);
		}else{
			billService.addBill(bill);
			PrintWriter.print(2);
		}
	}
	@RequestMapping("/updataBill.action")
	public void updatabill(Bill bill,HttpServletRequest request,HttpServletResponse response,String p_id){
//		System.out.println("供应商编号"+p_id);
		Provider provider = new Provider();
		provider.setP_id(p_id);
		bill.setProvider(provider);
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			billService.updateBill(bill);
			PrintWriter.print(1);
	}
	@RequestMapping("/selectBill.action")
	public void selcetBillByNAndC(Bill bill,HttpServletRequest request,String currentpage,HttpServletResponse response){
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println(bill.getB_name()+"=="+bill.getB_checkmoney());
		List<Bill> selectBillByNAndC = billService.selectBillByNAndC(bill);
		Page page = new Page();
		page.setTotalEmployee(selectBillByNAndC.size());
		if(currentpage==null){
			page.setCurrentPage(1);
		}
		/*Bill bill1 = new Bill();
		bill1.setB_name(bill.getB_name());
		bill1.setB_checkmoney(bill.getB_checkmoney());*/
		page.setBill(bill);
		List<Bill> billListByPage = billService.getAllBillByPage(page);
		request.getSession().setAttribute("page", page);
		/*System.out.println("总页数"+page.getTotalPage());
		System.out.println("当前页"+page.getCurrentPage());
		System.out.println("下一页"+page.getNextPage());
		System.out.println("上一页"+page.getUsedPage());
		System.out.println("开始行"+page.getStartPageEmployee());*/
		request.getSession().setAttribute("billListByPage", billListByPage);
		if(selectBillByNAndC.size()==0){
			PrintWriter.print(2);
		}else{
			PrintWriter.print(1);
		}
		
	}
	@RequestMapping("/selectBillByChPage.action")
	public String selcetBillByChPage(Bill bill,HttpServletRequest request){
		List<Bill> selectBillByNAndC = billService.selectBillByNAndC(bill);
		
		Page page = new Page();
		page.setTotalEmployee(selectBillByNAndC.size());
		page.setCurrentPage(1);
		Bill bill1 = new Bill();
		bill1.setB_name(bill.getB_name());
		bill1.setB_checkmoney(bill.getB_checkmoney());
		page.setBill(bill1);
		List<Bill> billListByPage = billService.getAllBillByPage(page);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("billListByPage", billListByPage);
		return "billList";
	}
}

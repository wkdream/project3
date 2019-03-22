package com.controllers;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Bill;
import com.pojo.Page;
import com.pojo.Provider;
import com.services.ProviderService;

@Controller
public class ProviderController {
	
	@Autowired
	private ProviderService providerService;
	
	@RequestMapping("/findAll_provider.action")
	public String find_all_provider(HttpServletRequest request){
		
		    List<Provider> list = providerService.findAll();
		    Page page = new Page();
			page.setTotalEmployee(list.size());
			page.setCurrentPage(1);
			Provider provider = new Provider();
			provider.setP_name("_");
			page.setProvider(provider);
			List<Provider> providerByPage = providerService.getAllProviderByPage(page);
			request.getSession().setAttribute("page", page);
			request.getSession().setAttribute("providerByPage", providerByPage);
		
		return "providerList";
	}
	@RequestMapping("/findAll_providername.action")
	public String find_all_providername(HttpServletRequest request){
		
		    List<Provider> findAll = providerService.findAll();
		    request.getSession().setAttribute("findAll", findAll);
		
		    return "billList";
	}
	@RequestMapping("/addprovider.action")
	public void add_provider(Provider provider,HttpServletResponse response){
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Provider provider2 = providerService.findproviderByName(provider.getP_name());
		if(provider2!=null){
			PrintWriter.print(2);
			System.out.println("供应商已存在!");
		}else{
			System.out.println("cg");
			 providerService.addprovider(provider);
			PrintWriter.print(1);
		}
	}
	@RequestMapping("/findproviderlikeName.action")
	public void findproviderlikeName(String p_name ,HttpServletResponse response,HttpServletRequest request){
			List<Provider> list=null;
			List<Provider> list1 = providerService.findproviderlikeName(p_name);
//			System.out.println("当前名字集合"+list1.size());
			if(list1.size()==0){
				list = providerService.findAll();
			}else{
				list=list1;
			}
			 Page page = new Page();
			 page.setTotalEmployee(list.size());
			 page.setCurrentPage(1);
			 Provider provider = new Provider();
			 if(p_name==null||list1.size()==0){
				 p_name="_";
			}
			 provider.setP_name(p_name);
			 page.setProvider(provider);
			List<Provider> providerByPage = providerService.getAllProviderByPage(page);
			request.getSession().setAttribute("page", page);
		 	/*System.out.println("总页数"+page.getTotalPage());
			System.out.println("当前页"+page.getCurrentPage());
			System.out.println("下一页"+page.getNextPage());
			System.out.println("上一页"+page.getUsedPage());*/
			request.getSession().setAttribute("providerByPage", providerByPage);
			PrintWriter PrintWriter=null;
		try {
				PrintWriter = response.getWriter();
				if(list1.size()==0){
					PrintWriter.print(2);
				}else{
					PrintWriter.print(1);
				}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/findAllproviderbychangePage.action")
	public void findAllUserByChangePage(HttpServletRequest request,String currentPage,HttpServletResponse response,String p_name){
		/*System.out.println("到这了currentPage="+currentPage);
		System.out.println("到这了currentPage="+p_name);*/
		Page page = new Page();
		List<Provider> list=null;
		if(p_name==null||p_name=="_"){
			list = providerService.findAll();
		}else{
			list = providerService.findproviderlikeName(p_name);
		}
		page.setTotalEmployee(list.size());
		if(currentPage==null){
			page.setCurrentPage(1);
		}else{
			int intcurrentPage = Integer.parseInt(currentPage);//String转成int
			page.setCurrentPage(intcurrentPage);
		}
		Provider provider = new Provider();
		if(p_name==null){
			p_name="_";
		}
		 provider.setP_name(p_name);
		 page.setProvider(provider);
		List<Provider> providerByPage = providerService.getAllProviderByPage(page);
		request.getSession().setAttribute("page", page);
		/*System.out.println("总页数"+page.getTotalPage());
		System.out.println("当前页"+page.getCurrentPage());
		System.out.println("下一页"+page.getNextPage());
		System.out.println("上一页"+page.getUsedPage());
		System.out.println("开始行"+page.getStartPageEmployee());*/
		request.getSession().setAttribute("providerByPage", providerByPage);
		try {
			response.getWriter().write("<script>window.open('providerList.jsp','right')</script>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/updataProvider.action")
	public void updataProvider(Provider provider,HttpServletResponse response){
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			providerService.updateProvider(provider);
			PrintWriter.print(1);
	}
	@RequestMapping("/delProvider.action")
	public void delProvider(Provider provider,HttpServletResponse response){
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		providerService.delProvider(provider.getP_id());
		PrintWriter.print(1);
	}
}

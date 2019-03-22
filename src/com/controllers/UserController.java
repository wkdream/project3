package com.controllers;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Msg;
import com.pojo.Page;
import com.pojo.User;
import com.services.UserService;



@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.action")
	public void ckeck_login(User user,HttpServletResponse response,HttpServletRequest request){
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User user_login = userService.findUserByName(user.getU_name());
		if(user_login!=null){
			if(user_login.getU_password().equals(user.getU_password())){
				if(user_login.getU_password().equals("999999")){
					PrintWriter.print(3);
					System.out.println("强制改密码");
				}else{
					User user_tip = userService.findUserByName(user_login.getU_name());
					String tip=null;
					if(user_tip.getU_sex().equals("男")){
						tip=user_tip.getU_name()+"先生";
					}else {
						tip=user_tip.getU_name()+"女士";
					}
					request.getSession().setAttribute("userTip", tip);
					PrintWriter.print(1);
					System.out.println("成功");
					request.getSession().setAttribute("loginuser", user_login);
				}
			}else{
				PrintWriter.print(2);
				System.out.println("密码不正确!");
			}
		}else{
			PrintWriter.print(2);
			System.out.println("账号不存在!");
		}
	//	return "";
	}
	@RequestMapping("/findAll_user.action")
	public String findAllUser(Model mod,HttpServletRequest request,String currentPage){
		List<User> list = userService.findAll();
		
		Page page = new Page();
		page.setTotalEmployee(list.size());
		if(currentPage==null){
			page.setCurrentPage(1);
		}else{
			int intcurrentPage = Integer.parseInt(currentPage);//String转成int
			page.setCurrentPage(intcurrentPage);
		}
		User user = new	User();
		user.setU_name("_");
		page.setUser(user);
		List<User> userByPage = userService.getAllUserByPage(page);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("userByPage", userByPage);
		request.getSession().setAttribute("userList", list);
		return "frame/main";
	}
	@RequestMapping("/findAll_user_by_changePage.action")
	public void findAllUserByChangePage(HttpServletRequest request,String currentPage,HttpServletResponse response,String u_name){
//		System.out.println("到这了currentPage="+currentPage);
		Page page = new Page();
		List<User> list=null;
		if(u_name==null||u_name=="_"){
			list = userService.findAll();
		}else{
			list = userService.findListUserByName(u_name);
		}
		page.setTotalEmployee(list.size());
//		System.out.println("删除后的list"+list.size());
		if(currentPage==null){
			page.setCurrentPage(1);
		}else{
			int intcurrentPage = Integer.parseInt(currentPage);//String转成int
			page.setCurrentPage(intcurrentPage);
		}
//		System.out.println("u_name="+u_name);
		User user = new	User();
		if(u_name==null){
			u_name="_";
		}
		user.setU_name(u_name);
		page.setUser(user);
		List<User> userByPage = userService.getAllUserByPage(page);
		request.getSession().setAttribute("page", page);
	/*	System.out.println("总页数"+page.getTotalPage());
		System.out.println("当前页"+page.getCurrentPage());
		System.out.println("下一页"+page.getNextPage());
		System.out.println("上一页"+page.getUsedPage());
		System.out.println("开始行"+page.getStartPageEmployee());*/
		request.getSession().setAttribute("userByPage", userByPage);
		request.getSession().setAttribute("userList", list);
		try {
			response.getWriter().write("<script>window.open('userList.jsp','right')</script>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/findAll_user_by_u_name.action")
	public void findAllUserByu_name(HttpServletRequest request,String u_name,HttpServletResponse response,String currentPage){
		List<User> list=null;
		List<User> list1 = userService.findListUserByName(u_name);
//		System.out.println("当前名字集合"+list1.size());
		if(list1.size()==0){
			list = userService.findAll();
		}else{
			list=list1;
		}
		 Page page = new Page();
		 page.setTotalEmployee(list.size());
		 if(currentPage==null){
				page.setCurrentPage(1);
			}else{
				int intcurrentPage = Integer.parseInt(currentPage);//String转成int
				page.setCurrentPage(intcurrentPage);
			}
		 	User user = new	User();
		 	if(u_name==null||list1.size()==0){
				u_name="_";
			}
			user.setU_name(u_name);
			page.setUser(user);
			List<User> userByPage = userService.getAllUserByPage(page);
			request.getSession().setAttribute("page", page);
	/*	 	System.out.println("总页数"+page.getTotalPage());
			System.out.println("当前页"+page.getCurrentPage());
			System.out.println("下一页"+page.getNextPage());
			System.out.println("上一页"+page.getUsedPage());*/
			request.getSession().setAttribute("userByPage", userByPage);
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
	@RequestMapping("/register_user.action")
	public void register(User user,HttpServletResponse response){
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User user_login = userService.findUserByName(user.getU_name());
		if(user_login!=null){
			PrintWriter.print(2);
			System.out.println("账号已存在!");
		}else{
			System.out.println("cg");
			userService.addUser(user);
			PrintWriter.print(1);
		}
	}
	@RequestMapping("/add_user.action")
	public void adduser(User user,HttpServletResponse response){
		user.setU_password("999999");
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User user_login = userService.findUserByName(user.getU_name());
		if(user_login!=null){
			PrintWriter.print(2);
			System.out.println("账号已存在!");
		}else{
			System.out.println("cg");
			userService.addUser(user);
			PrintWriter.print(1);
		}
	}
	@RequestMapping("/updata_user_by_u_id.action")
	public void updata_user_by_u_id(User user,HttpServletResponse response){
		userService.updateUser(user);
//		System.out.println("修改了");
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter.print(1);
	}
	@ResponseBody
	@RequestMapping("/delete_user_by_u_id.action")
	public JSONObject  delete_user_by_u_id( String u_id, String currentPage,HttpServletResponse response,HttpServletRequest request){
		userService.delUser(u_id);
/*		System.out.println(u_id);
		System.out.println(currentPage);*/
		Page page = new Page();
		List<User> list = userService.findAll();
		page.setTotalEmployee(list.size());
		page.setCurrentPage(Integer.parseInt(currentPage));
		List<User> list2 = userService.getAllUserByPagedelete(page);
		request.getSession().setAttribute("page", page);
/*	 	System.out.println("总页数"+page.getTotalPage());
		System.out.println("当前页"+page.getCurrentPage());
		System.out.println("下一页"+page.getNextPage());
		System.out.println("上一页"+page.getUsedPage());*/
		request.getSession().setAttribute("userByPage", list2);
		/*PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
			PrintWriter.print("success");
			System.out.println("删除成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		Map<String, Object> resultMap=new HashMap<>();
		resultMap.put("result", "success");
		JSONObject json =new JSONObject(resultMap);
		System.out.println(json);
		return json;
	}
	@RequestMapping("/updatePassword.action")
	public void updatePassword(User user,HttpServletResponse response){
		userService.updatePassword(user);
		PrintWriter PrintWriter=null;
		try {
			PrintWriter = response.getWriter();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter.print(1);
	}
	@RequestMapping("/zhuxiao.action")
	public void zhuxiao(HttpServletRequest request,HttpServletResponse response){
		
		request.getSession().invalidate();
		try {
			response.getWriter().write("<script>parent.window.location='login.jsp'</script>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

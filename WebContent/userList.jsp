<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/userList.js"></script>
</head>
<body>
	<input type="text" id="ul_password" style="display: none" value=${loginuser.u_password }>
	<input type="text" id="currentpg" value="${page.currentPage}" style="display:none">
	<input type="text" id="pagesize" value="${page.pageSize}" style="display:none">
	<input type="text" id="totalpg" value="${page.totalPage}" style="display:none">
	<input type="text" id="totalEm" value="${page.totalEmployee}" style="display:none">
	<div class="menu">
		<form action="" class="form-inline">
			<div class="form-group">
				<label for="exampleInputName2">用户名称:</label> <input type="text"
					class="form-control" id="u_serch"> <input type="text"
					class="form-control" id="ul_name" style="display: none"
					value=${loginuser.u_name }> <input type="text" id="ul_iden"
					style="display: none" value=${loginuser.u_iden }>
				<button type="submit" class="btn btn-default" id="btn_serch">搜索</button>
			</div>
		</form>
	</div>
	<div class="main">
		<div class="optitle clearfix">
			<em><input value="添加数据" type="button" class="btn btn-info"
				id="btn_add"></em>
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<div>
			<table class="table table-striped table-hover" id="table_userList">
				<tr class="success">
					<td width="70" height="29">编号</td>
					<td width="80">用户名称</td>
					<td width="100">性别</td>
					<td width="100">年龄</td>
					<td width="150">电话</td>
					<td width="150">地址</td>
					<td width="150">操作</td>
				</tr>
				<c:forEach items="${userByPage}" var="user">
					<tr>
						<td height="23" id="u_id">${user.u_id }</td>
						<td id="u_name${user.u_id }">${user.u_name }</td>
						<td id="u_sex${user.u_id }">${user.u_sex }</td>
						<td id="u_age${user.u_id }">${user.u_age }</td>
						<td id="u_phone${user.u_id }">${user.u_phone }</td>
						<td id="u_address${user.u_id }">${user.u_address }</td>
						<td id="u_iden${user.u_id }" style="display: none">${user.u_iden }</td>
						<td id="currentPage${user.u_id }" style="display:none">${page.currentPage}</td>
						<td colspan="2"><a href="#" onclick="updatayz(${user.u_id })">修改</a>&nbsp;
							<a
							href="#" onclick="deleteuser(${user.u_id })">删除</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div>
		<nav aria-label="Page navigation">
		<ul class="pagination">
			<li><a
				href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=1"
				aria-label="Previous"> <span aria-hidden="true">首页</span>
			</a></li>
			<li><a
				href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=${page.usedPage}"
				aria-label="Previous"> <span aria-hidden="true">上一页</span>
			</a></li>
			<c:if test="${page.currentPage =='1'}">
				<li class="active"><a href="#">${page.currentPage }</a></li>
				<li><a
					href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=2">2</a></li>
				<li><a
					href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=3">3</a></li>
			</c:if>
			<c:if test="${page.currentPage =='2'}">
				<li><a
					href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=1">1</a></li>
				<li class="active"><a href="#">${page.currentPage }</a></li>
				<li><a
					href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=3">3</a></li>
			</c:if>
			<c:if test="${page.currentPage =='3'}">
				<li><a
					href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=1">1</a></li>
				<li><a
					href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=2">2</a></li>
				<li class="active"><a href="#">3</a></li>
			</c:if>
			<c:if test="${page.currentPage > '3'}">
				<li><a
					href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=1">1</a></li>
				<li><a
					href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=2">2</a></li>
				<li class="active"><a href="#">${page.currentPage }</a></li>
			</c:if>
			<li><a
				href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=${page.nextPage}"
				aria-label="Next"> <span aria-hidden="true">下一页</span>
			</a></li>
			<li><a
				href="findAll_user_by_changePage.action?u_name=${page.user.u_name }&currentPage=${page.totalPage}"
				aria-label="Next"> <span aria-hidden="true">尾页</span>
			</a></li>
		</ul>
		</nav>
	</div>
	<!-- 模态弹出框 添加-->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" >
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加用户ADDUSER</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="table1">
						<tr>
							<td>用户名</td>
							<td><input type="text" id="uz_name" name="u_name "
								class="form-control bitian"></td>
							<td><span id="span_no"></span></td>
						</tr>
						<tr>
							<td>性别</td>
							<td><input type="radio" name="uz_sex" id="uz_sex"
								class="bitian" checked value="男">男 <input type="radio"
								name="uz_sex" id="uz_sex" class="bitian"
								style="margin-left: 50px" value="女">女</td>
							<td><span id="span_ua_sex"></span></td>
						</tr>
						<tr>
							<td>年龄</td>
							<td><input type="text" name="uz_age" id="uz_age"
								class="form-control"></td>
							<td><span id="span_ua_age"></span></td>
						</tr>
						<tr>
							<td>联系方式</td>
							<td><input type="text" id="uz_phone" class="form-control"></td>
							<td><span id="span_ua_phone"></span></td>
						</tr>
						<tr>
							<td>住址</td>
							<td><input type="text" id="uz_address" class="form-control"></td>
							<td><span id="span_ua_address"></span></td>
						</tr>
						<tr>
							<td>身份</td>
							<td><select class="form-control bitian" name="u_iden"
								id="ua_iden">
									<option value="0">请选择身份</option>
									<option value="1">用户</option>
									<option value="2">经理</option>
							</select></td>
							<td><span id="span_ua_iden"></span></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="btnzc">提交</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态弹出框 修改-->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用户UPDATEUSER</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="table2">

						<tr>
							<td>用户名</td>

							<td><input type="text" id="um_currentPage"
								style="display: none"> <input type="text" id="um_id"
								style="display: none"> <input type="text" id="um_name"
								class="form-control bitianm"></td>
							<td><span id="span_um_name"></span></td>
						</tr>
						<tr>
							<td>性别</td>
							<td><input type="radio" id="um_sex_M" class="um_sex"
								name="m_sex" value="男">男 <input type="radio"
								id="um_sex_F" class="um_sex" style="margin-left: 50px" value="女"
								name="m_sex">女</td>
							<td><span id="span_um_sex"></span></td>
						</tr>
						<tr>
							<td>年龄</td>
							<td><input type="text" id="um_age" class="form-control"></td>
							<td><span id="span_um_age"></span></td>
						</tr>
						<tr>
							<td>联系方式</td>
							<td><input type="text" id="um_phone" class="form-control"></td>
							<td><span id="span_um_phone"></span></td>
						</tr>
						<tr>
							<td>住址</td>
							<td><input type="text" id="um_address" class="form-control"></td>
							<td><span id="span_um_address"></span></td>
						</tr>
						<tr>
							<td>身份</td>
							<td><select class="form-control bitianm" id="um_iden">
									<option value="0">请选择身份</option>
									<option value="1">用户</option>
									<option value="2">经理</option>
							</select></td>
							<td><span id="span_um_iden"></span></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="btnum">提交</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 模态弹出框 修改密码-->
	<div class="modal fade" id="myModal7" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改密码UPDATEPASSWORD</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="table1">
						<tr>
							<td>原密码</td>
							<td><input type="password" id="old_password" 
								class="form-control bitianp"></td>
							<td><span id="span_old_password"></span></td>
						</tr>
						<tr>
							<td>新密码</td>
							<td><input type="password" id="new_password" 
								class="form-control bitianp"></td>
							<td><span id="span_new_password"></span></td>
						</tr>
						<tr>
							<td>重复新密码</td>
							<td><input type="password" id="new_password_replay" 
								class="form-control bitianp"></td>
							<td><span id="span_new_password_replay"></span></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="btnxg">提交</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
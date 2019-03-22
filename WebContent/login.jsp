<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/zhuce.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<title>超市账单管理系统登陆</title>
<script type="text/javascript">
</script>
</head>
<body class="blue-style">
<div id="login">
	<div class="icon"></div>
	<div class="login-box">
		<form id="form1" method="post" >
			<dl>
				<dt>用户名：</dt>
				<dd><input type="text" name="u_name" id="u_name" class="form-control"/></dd>
				<dt>密　码：</dt>
				<dd><input type="password" name="u_password" id="u_password" class="form-control"/></dd>
				<!-- <dt>身　份：</dt>
				
				<dd><select class="form-control" id="u_shenfen">
					  <option>请选择身份</option>
					  <option>用户</option>
					  <option>经理</option>
					</select></dd>
			 -->
			</dl>
			<div align="right" style="margin-right: 150px">
				<input type="button" id="btnlogin" name="submit" value="登   录" class="btn btn-success"/>
				<input type="button" name="reset" value="注   册" class="btn btn-info" data-toggle="modal" data-target="#myModal"/><br/>
				
			</div>
		</form>
	</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">注册 REGISTER</h4>
					</div>
					<div class="modal-body">
						<table class="table" id="table1">
								<tr>
									<td>用户名</td>
									<td><input type="text" id="uz_name" name="u_name "class="form-control bitian"></td>
									<td><span id="span_no"></span></td>
								</tr>
								<tr>
									<td>密码</td>
									<td><input type="password" id="uz_password" name="u_password" class="form-control bitian" ></td>
									<td><span id="span_password"></span></td>
								</tr>
								<tr>
									<td>确认密码</td>
									<td><input type="password"id="uz_password_replay" class="form-control bitian"></td>
									<td><span id="span_password_replay"></span></td>
								</tr>
								<tr>
									<td>性别</td>
									<td><input type="radio" name="uz_sex" id="uz_sex" class="bitian" checked value="男">男
									<input type="radio" name="uz_sex" id="uz_sex" class="bitian" style="margin-left: 50px" value="女">女</td>
									<td><span id="span_u_sex"></span></td>
								</tr>
								<tr>
									<td>年龄</td>
									<td><input type="text" name="uz_age" id="uz_age"  class="form-control"></td>
									<td><span id="span_u_age"></span></td>
								</tr>
								<tr>
									<td>联系方式</td>
									<td><input type="text"id="uz_phone" class="form-control"></td>
									<td><span id="span_u_phone"></span></td>
								</tr>
								<tr>
									<td>住址</td>
									<td><input type="text" id="uz_address" class="form-control"></td>
									<td><span id="span_u_address"></span></td>
								</tr>
								<tr>
									<td>身份</td>
									<td><select class="form-control bitian" name="u_iden" id="uz_iden">
										  <option value="0">请选择身份</option>
										  <option value="1">用户</option>
										  <option value="2">经理</option>
										</select></td>
									<td><span id="span_u_iden"></span></td>
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
					<table class="table" id="table7">
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
		<div class="modal fade" id="myModalerror" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" >
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
					您还没有登陆呢!
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="btnxg">提交</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
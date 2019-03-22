<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>providerList</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/provider.js"></script>
<script type="text/javascript">
	function doit(flag, id) {
		if (flag == "del") {
			if (confirm("确认删除吗？") != true)
				return;
		}
		window.location = "provider.do?id=" + id + "&flag=" + flag;
	}
	
</script>
</head>
<body>
	<div class="menu">
		<input type="text" id="currentpg" value="${page.currentPage}" style="display:none">
		<input type="text" id="pagesize" value="${page.pageSize}" style="display:none">
		<input type="text" id="totalpg" value="${page.totalPage}" style="display:none">
		<input type="text" id="totalEm" value="${page.totalEmployee}" style="display:none">
		<table>
			<tbody>
				<tr>
					<td><form method="post"  class="form-inline">
							供应商名称：<input name="providerName" class="form-control" type="text" id="p_name">
							&nbsp;<input
								value="查 询" class="btn btn-default" type="button" id="btnselect">
						</form></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="main">
		<div class="optitle clearfix">
			<em><input value="添加数据" class="btn btn-info"
				id="btn_add" type="button"> <input type="text" id="ul_iden"
					style="display: none" value=${loginuser.u_iden }></em>
			<div class="title">供应商管理&gt;&gt;</div>
		</div>
			<input type="text" id="currentpg" value="${page.currentPage}" style="display:none">
			<table  class="table table-striped table-hover" id="table_proderList">
				<tr class="success">
					<td >编号</td>
					<td >供应商名称</td>
					<td >联系人</td>
					<td >电话</td>
					<td >地址</td>
					<td> 操作</td>
				</tr>
				<c:forEach items="${providerByPage }" var="provider">
					<tr>
						<td>${provider.p_id }</td>
						<td  id="p_name${provider.p_id }">${provider.p_name }</td>
						<td  id="p_touch${provider.p_id }">${provider.p_touch}</td>
						<td  id="p_phone${provider.p_id }">${provider.p_phone }</td>
						<td  id="p_address${provider.p_id }">${provider.p_address }</td>
						<td colspan="2"><a href="#" onclick="updatayz(${provider.p_id })">修改</a>&nbsp;
							<a
							href="#" onclick="delprovider(${provider.p_id })">删除</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div>
		<nav aria-label="Page navigation">
		<ul class="pagination">
			<li><a
				href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=1"
				aria-label="Previous"> <span aria-hidden="true">首页</span>
			</a></li>
			<li><a
				href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=${page.usedPage}"
				aria-label="Previous"> <span aria-hidden="true">上一页</span>
			</a></li>
			<c:if test="${page.currentPage =='1'}">
				<li class="active"><a href="#">${page.currentPage }</a></li>
				<li><a
					href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=2">2</a></li>
				<li><a
					href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=3">3</a></li>
			</c:if>
			<c:if test="${page.currentPage =='2'}">
				<li><a
					href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=1">1</a></li>
				<li class="active"><a href="#">${page.currentPage }</a></li>
				<li><a
					href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=3">3</a></li>
			</c:if>
			<c:if test="${page.currentPage =='3'}">
				<li><a
					href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=1">1</a></li>
				<li><a
					href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=2">2</a></li>
				<li class="active"><a href="#">3</a></li>
			</c:if>
			<c:if test="${page.currentPage > '3'}">
				<li><a
					href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=1">1</a></li>
				<li><a
					href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=2">2</a></li>
				<li class="active"><a href="#">${page.currentPage }</a></li>
			</c:if>
			<li><a
				href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=${page.nextPage}"
				aria-label="Next"> <span aria-hidden="true">下一页</span>
			</a></li>
			<li><a
				href="findAllproviderbychangePage.action?p_name=${page.provider.p_name }&currentPage=${page.totalPage}"
				aria-label="Next"> <span aria-hidden="true">尾页</span>
			</a></li>
		</ul>
		</nav>
	</div>
		
<!-- 模态弹出框 添加-->
	<div class="modal fade" id="myModal5" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加供应商ADDPROVIDER</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="table1">
						<tr>
							<td>供应商名称</td>
							<td><input type="text" id="pa_name" name="pa_name "
								class="form-control bitian"></td>
							<td><span id="span_pa_name"></span></td>
						</tr>
						
						<tr>
							<td>联系人</td>
							<td><input type="text" name="pa_touch" id="pa_touch"
								class="form-control bitian"></td>
							<td><span id="span_pa_touch"></span></td>
						</tr>
						<tr>
							<td>电话</td>
							<td><input type="text" id="pa_phone" class="form-control bitian"></td>
							<td><span id="span_pa_phone"></span></td>
						</tr>
						<tr>
							<td>地址</td>
							<td><input type="text" id="pa_address" class="form-control bitian"></td>
							<td><span id="span_pa_address"></span></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="btnpa">提交</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 模态弹出框 修改-->
	<div class="modal fade" id="myModal6" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改供应商UPDATEPROVIDER</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="table6">
						<tr>
							<td>供应商名称</td>
							<td><input type="text" id="pu_name" name="pu_name"
								class="form-control bitianpu"><input type="text" id="pu_id" Style="display: none"></td>
							<td><span id="span_pu_name"></span></td>
						</tr>
						<tr>
							<td>联系人</td>
							<td><input type="text" name="pu_touch" id="pu_touch"
								class="form-control bitianpu"></td>
							<td><span id="span_pu_touch"></span></td>
						</tr>
						<tr>
							<td>联系方式</td>
							<td><input type="text" id="pu_phone" class="form-control bitianpu"></td>
							<td><span id="span_pu_phone"></span></td>
						</tr>
						<tr>
							<td>地址</td>
							<td><input type="text" name="pu_address" id="pu_address"
								class="form-control bitianpu"></td>
							<td><span id="span_pu_address"></span></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="btnpu">提交</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
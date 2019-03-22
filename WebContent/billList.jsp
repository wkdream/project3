<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bill.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
<div class="menu">
	<form method="get" action="" class="form-inline">
		商品名称：<input type="text" name="productName" class="form-control" id="seclectname"/>&nbsp;&nbsp;&nbsp;&nbsp;
		是否付款：<select class="form-control" id="selectcm">
			<option value="">请选择</option>
			<option value="1">已付款</option>
			<option value="0">未付款</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="btn btn-default" type="button" value="组合查询" id="btnselect"/>
	</form>
</div>
<div class="main">
	<div class="optitle clearfix">
		<em><input type="button" name="button" value="添加数据" class="btn btn-info" id="btn_add"/><input type="text" id="ul_iden"
					style="display: none" value=${loginuser.u_iden }></em>
		<div class="title">账单管理&gt;&gt;</div>
	</div>
	<input type="text" id="currentpg" value="${page.currentPage}" style="display:none">
	<input type="text" id="pagesize" value="${page.pageSize}" style="display:none">
	<input type="text" id="totalpg" value="${page.totalPage}" style="display:none">
	<input type="text" id="totalEm" value="${page.totalEmployee}" style="display:none">
		<table class="table table-striped table-hover" id="table_billList">
			<tr class="success">
				<td>账单编号</td>
				<td>商品名称</td>
				<td>商品数量</td>
				<td>交易金额</td>
				<td>是否付款</td>
				<td>供应商名称</td>
				<td>商品描述</td>
				<td>账单时间</td>
				<td >操作</td>
			</tr>
			<c:forEach items="${billListByPage }" var="bill">
			<tr>
				<td>${bill.b_id }</td>
				<td id="b_name${bill.b_id }">${bill.b_name }</td>
				<td id="b_quantity${bill.b_id }">${bill.b_quantity }</td>
				<td id="b_money${bill.b_id }">${bill.b_money }</td>
				<td id="b_checkmoney${bill.b_id }">${bill.b_checkmoney }</td>
				<td id="p_name${bill.b_id }" >${bill.provider.p_name }</td>
				<td id="p_id${bill.b_id }" style="display:none">${bill.provider.p_id }</td>
				<td id="b_miao${bill.b_id }">${bill.b_miao }</td>
				<td id="b_time${bill.b_id }">${bill.b_time }</td>
				<td colspan="2"><a href="#" onclick="updatayz(${bill.b_id })">修改</a>&nbsp;
							<a
							href="#" onclick="delBill(${bill.b_id })">删除</a></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<nav aria-label="Page navigation">
		<ul class="pagination">
			<li><a
				href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=1&b_checkmoney=${page.bill.b_checkmoney }"
				aria-label="Previous"> <span aria-hidden="true">首页</span>
			</a></li>
			<li><a
				href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=${page.usedPage}&b_checkmoney=${page.bill.b_checkmoney }"
				aria-label="Previous"> <span aria-hidden="true">上一页</span>
			</a></li>
			<c:if test="${page.currentPage =='1'}">
				<li class="active"><a href="#">${page.currentPage }</a></li>
				<li><a
					href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=2 &b_checkmoney=${page.bill.b_checkmoney }">2</a></li>
				<li><a
					href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=3 &b_checkmoney=${page.bill.b_checkmoney }">3</a></li>
			</c:if>
			<c:if test="${page.currentPage =='2'}">
				<li><a
					href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=1&b_checkmoney=${page.bill.b_checkmoney }">1</a></li>
				<li class="active"><a href="#">${page.currentPage }</a></li>
				<li><a
					href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=3&b_checkmoney=${page.bill.b_checkmoney }">3</a></li>
			</c:if>
			<c:if test="${page.currentPage =='3'}">
				<li><a
					href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=1&b_checkmoney=${page.bill.b_checkmoney }">1</a></li>
				<li><a
					href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=2&b_checkmoney=${page.bill.b_checkmoney }">2</a></li>
				<li class="active"><a href="#">3</a></li>
			</c:if>
			<c:if test="${page.currentPage > '3'}">
				<li><a
					href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=1&b_checkmoney=${page.bill.b_checkmoney }">1</a></li>
				<li><a
					href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=2&b_checkmoney=${page.bill.b_checkmoney }">2</a></li>
				<li class="active"><a href="#">${page.currentPage }</a></li>
			</c:if>
			<li><a
				href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=${page.nextPage}&b_checkmoney=${page.bill.b_checkmoney }"
				aria-label="Next"> <span aria-hidden="true">下一页</span>
			</a></li>
			<li><a
				href="findAllBillbychangePage.action?b_name=${page.bill.b_name }&currentPage=${page.totalPage}&b_checkmoney=${page.bill.b_checkmoney }"
				aria-label="Next"> <span aria-hidden="true">尾页</span>
			</a></li>
		</ul>
		</nav>
	</div>
	<!-- 模态弹出框 添加-->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加商品ADDBILL</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="table1">
						<tr>
							<td>商品名称</td>
							<td><input type="text" id="ba_name" name="ba_name"
								class="form-control bitian"></td>
							<td><span id="span_ba_name"></span></td>
						</tr>
						<tr>
							<td>商品数量</td>
							<td><input type="text" name="ba_quantity" id="ba_quantity"
								class="form-control bitian"></td>
							<td><span id="span_ba_quantity"></span></td>
						</tr>
						<tr>
							<td>交易金额</td>
							<td><input type="text" id="ba_money" class="form-control bitian"></td>
							<td><span id="span_ba_money"></span></td>
						</tr>
						<tr>
							<td>是否付款</td>
							<td><input type="radio" name="checkmoney" id="checkmoney"
								class="bitian" checked value="是">是 <input type="radio"
								name="checkmoney" id="checkmoney" class="bitian"
								style="margin-left: 50px" value="否">否</td>
							<td><span id="span_ba_checkmoney"></span></td>
						</tr>
						<tr>
							<td>供应商名称</td>
							<td><select class="form-control bitian" name="u_iden"
								id="ba_p_name">
									<option value="0">--请选择--</option>
									<c:forEach items="${findAll }" var="provider">
										<option value="${provider.p_id }">${provider.p_name }</option>
									</c:forEach>
							</select></td>
							<td><span id="span_ba_provider"></span></td>
						</tr>
						<tr>
							<td>账单时间</td>
							<td><input type="text" name="ba_time" id="ba_time"
								class="form-control"></td>
							<td><span id="span_ba_time"></span></td>
						</tr>
						<tr>
							<td>商品描述</td>
							<td><textarea rows="3" cols="8" id="ba_miao" class="form-control"></textarea></td>
							<td><span id="span_ba_miao"></span></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="btnba">提交</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态弹出框 修改-->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改账单UPDATEBILL</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="table2">
						<tr>
							<td>商品名称</td>
							<td><input type="text" id="bu_name" name="bu_name"
								class="form-control bitianbu"><input type="text" id="bu_id" Style="display: none"></td>
							<td><span id="span_bu_name"></span></td>
						</tr>
						<tr>
							<td>商品数量</td>
							<td><input type="text" name="bu_quantity" id="bu_quantity"
								class="form-control bitianbu"></td>
							<td><span id="span_bu_quantity"></span></td>
						</tr>
						<tr>
							<td>交易金额</td>
							<td><input type="text" id="bu_money" class="form-control bitianbu"></td>
							<td><span id="span_bu_money"></span></td>
						</tr>
						<tr>
							<td>是否付款</td>
							<td><input type="radio" name="checkmoney1" id="checkmoney_Y"
								class="bitianbu bu_checked" checked value="是">是 <input type="radio"
								name="checkmoney1" id="checkmoney_N" class="bitianbu bu_checked"
								style="margin-left: 50px" value="否">否</td>
							<td><span id="span_bu_checkmoney"></span></td>
						</tr>
						<tr>
							<td>供应商名称</td>
							<td><select class="form-control bitianbu" name="u_iden"
								id="bu_provider">
									<option value="0">--请选择--</option>
									<c:forEach items="${findAll }" var="provider">
										<option value="${provider.p_id }">${provider.p_name }</option>
									</c:forEach>
							</select></td>
							<td><span id="span_bu_provider"></span></td>
						</tr>
						<tr>
							<td>账单时间</td>
							<td><input type="text" name="bu_time" id="bu_time"
								class="form-control"></td>
							<td><span id="span_bu_time"></span></td>
						</tr>
						<tr>
							<td>商品描述</td>
							<td><textarea rows="3" cols="8" id="bu_miao" class="form-control"></textarea></td>
							<td><span id="span_bu_miao"></span></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="btnbu">提交</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

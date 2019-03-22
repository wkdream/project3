<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../jquery/jquery-3.2.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript">
	$(function(){
		$("#zhuxiao").click(function(){
			if(confirm("确定退出吗?")){
				location.href="../zhuxiao.action";
			}
		});
	});
</script>
</head>
<body class="frame-bd">
<ul class="left-menu">
	<li><a href="../findAll_bill.action" target="right"><img src="../images/btn_bill.gif" /></a></li>
	<li><a href="../findAll_provider.action" target="right"><img src="../images/btn_suppliers.gif" /></a></li>
	<li><a href="../userList.jsp" target="right"><img src="../images/btn_users.gif" /></a></li>
	<li><a href="#" id="zhuxiao"><img src="../images/btn_exit.gif" /></a></li>
</ul>
</body>
</html>
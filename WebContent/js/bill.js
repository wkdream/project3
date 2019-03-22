/**
 * 
 */
$(function() {
	
	/*表格换色*/
	$("#table_billList tr:even:gt(0)").addClass("warning");// 偶数>0行添加class属性
	$("#table_proderList tr:odd").addClass("active");
	/*添加验证*/
	$("#table1 input[type!='submit']").focus(
			function() {
				if ($(this).is("#ba_name")) {
					$("#span_ba_name").html(
							"<font color='red' size='2'>请输入商品名字</font>");
				}
				if ($(this).is("#ba_quantity")) {
					$("#span_ba_quantity").html(
							"<font color='red' size='2'>请输入数量</font>");
				}
				if ($(this).is("#ba_money")) {
					$("#span_ba_money").html(
							"<font color='red' size='2'>请输入金额！</font>");
				}
			});
	$("#ba_p_name").change(
			function() {
				if ($(this).val() == 0) {
					$("#span_ba_provider").html(
									"<font color='red' size='2' title='error'>请选择供应商！</font>");
				} else {
					$("#span_ba_provider").html("✔");
				}
			});
	$("#table1 input")
			.blur(
					function() {
						if ($(this).is("#ba_name")) {
							var span_ba_name = $("#span_ba_name");
							if ($(this).val().length == 0) {
								span_ba_name
										.html("<font color='red' size='2' title='error'>商品名字不能为空！</font>");
							}else if ($(this).val().length > 10) {
								span_ba_name
										.html("<font color='red' size='2' title='error'>太长了！</font>");
							} else {
								span_ba_name.html("✔");
							}
						}
						if ($(this).is("#ba_quantity")) {
							var span_ba_quantity = $("#span_ba_quantity");
							if ($(this).val().length == 0) {
								span_ba_quantity
										.html("<font color='red' size='2' title='error'>数量不能为空！</font>");
							}else if(!/^\+?[1-9][0-9]*$/.test($(this).val())){
								span_ba_quantity
								.html("<font color='red' size='2' title='error'>格式不正确!</font>");
							}else {
								
								span_ba_quantity.html("✔");
							}
						}
						if ($(this).is("#ba_money")) {
							var span_ba_money = $("#span_ba_money");
							if ($(this).val().length == 0) {
								span_ba_money
										.html("<font color='red' size='2' title='error'>金额不能为空！</font>");
							}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($(this).val())){
								span_ba_money
								.html("<font color='red' size='2' title='error'>格式不正确!</font>");
							} else {
								span_ba_money.html("✔");
							}
						}
					}).keyup(function() {
				$(this).triggerHandler("blur");
			});
	/*添加提交按钮*/
	$("#time").click(function(){
		var mydate = new Date();
		var time = (1900 + mydate.getYear()) + "." + (1 + mydate.getMonth())
				+ "." + mydate.getDate() + " " + mydate.getHours() + ":"
				+ mydate.getMinutes() + ":" + mydate.getSeconds();
	});
	$("#btnba").click(function() {
		$(".bitian").trigger("blur");
		$("#ba_p_name").trigger("change");
		if ($("font[title='error']").length > 0) {
			return false;
		} else {
			var totalpg=$("#totalpg").val();
			var totalEm=$("#totalEm").val();
			var pagesize=$("#pagesize").val();
			if(totalEm==parseInt(totalpg)*parseInt(pagesize)){
				totalpg=parseInt(totalpg)+1;
			}
			var ba_name = $("#ba_name").val();
			var ba_quantity = $("#ba_quantity").val();
			var ba_money = $("#ba_money").val();
			var checkmoney = $("#checkmoney:checked").val();
			var p_id=$("#ba_p_name  option:selected").val();
			var ba_time = $("#ba_time").val();
			var ba_miao = $("#ba_miao").val();
			$.ajax({
				type : "post",
				url : "addBill.action",
				data : {
					"b_name" : ba_name,
					"b_quantity" : ba_quantity,
					"b_money" : ba_money,
					"b_checkmoney" : checkmoney,
					"b_time" : ba_time,
					"p_id":p_id,
					"b_miao" : ba_miao
					
				},
				success : function(msg) {
					if (msg == 2) {
						alert("恭喜你!添加成功!");
						location.href="findAllBillbychangePage.action?currentPage="+totalpg;
					} else if (msg == 1) {
						alert("该商品已存在,已自动为你更新数据!");
						window.open('billList.jsp','right');
					}
				}
			});
		}
	});
	/*修改验证*/
	$("#table2 input[type!='submit']").focus(
			function() {
				if ($(this).is("#bu_name")) {
					$("#span_bu_name").html(
							"<font color='red' size='2'>请输入商品名字</font>");
				}
				if ($(this).is("#bu_quantity")) {
					$("#span_bu_quantity").html(
							"<font color='red' size='2'>请输入数量</font>");
				}
				if ($(this).is("#bu_money")) {
					$("#span_bu_money").html(
							"<font color='red' size='2'>请输入金额！</font>");
				}
			});
	$("#bu_provider").change(
			function() {
				if ($(this).val() == 0) {
					$("#span_bu_provider").html(
									"<font color='red' size='2' title='error'>请选择供应商！</font>");
				} else {
					$("#span_bu_provider").html("✔");
				}
			});
	$("#table2 input")
			.blur(
					function() {
						if ($(this).is("#bu_name")) {
							var span_bu_name = $("#span_bu_name");
							if ($(this).val().length == 0) {
								span_bu_name
										.html("<font color='red' size='2' title='error'>商品名字不能为空！</font>");
							}else if ($(this).val().length > 10) {
								span_bu_name
										.html("<font color='red' size='2' title='error'>太长了！</font>");
							} else {
								span_bu_name.html("✔");
							}
						}
						if ($(this).is("#bu_quantity")) {
							var span_bu_quantity = $("#span_bu_quantity");
							if ($(this).val().length == 0) {
								
								span_bu_quantity
										.html("<font color='red' size='2' title='error'>数量不能为空！</font>");
							}else if(!/^\+?[1-9][0-9]*$/.test($(this).val())){
								span_bu_quantity
								.html("<font color='red' size='2' title='error'>格式不正确!</font>");
							}else {
								span_bu_quantity.html("✔");
							}
						}
						if ($(this).is("#bu_money")) {
							var span_bu_money = $("#span_bu_money");
							if ($(this).val().length == 0) {
								span_bu_money
										.html("<font color='red' size='2' title='error'>金额不能为空！</font>");
							}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($(this).val())){
								span_bu_money
								.html("<font color='red' size='2' title='error'>格式不正确!</font>");
							} else {
								span_bu_money.html("✔");
							}
						}
					}).keyup(function() {
				$(this).triggerHandler("blur");
			});
	/*修改提交按钮*/
	$("#btnbu").click(function() {
		$(".bitianbu").trigger("blur");
		$("#bu_provider").trigger("change");
		if ($("font[title='error']").length > 0) {
			return false;
		} else {
			var b_id=$("#bu_id").val();
			var b_name = $("#bu_name").val();
			var b_quantity = $("#bu_quantity").val();
			var b_checkmoney = $(".bu_checked:checked").val();
			var b_money = $("#bu_money").val();
			var b_time = $("#bu_time").val();
			var b_provider=$("#bu_provider  option:selected").val();
			var b_miao=$("#bu_miao").val();
			var curr_page=$("#currentpg").val();
			$.ajax({
				type : "post",
				url : "updataBill.action",
				data : {
					"b_id":b_id,
					"b_name" : b_name,
					"b_quantity" : b_quantity,
					"b_money" : b_money,
					"b_checkmoney":b_checkmoney,
					"b_time" : b_time,
					"b_miao" : b_miao,
					"curr_page":curr_page,
					"p_id" : b_provider
				},
				success : function(msg) {
					if (msg == 1) {
						$("#myModal2").modal('hide');
						location.href="findAllBillbychangePage.action?currentPage="+curr_page;
					} else if (msg == 2) {
						alert("该账号已存在");
					}
				}
			});
		}
	});
	/*添加btn*/
	$("#btn_add").click(function(){
		if($("#ul_iden").val()=="经理"){
			var mydate = new Date();
			var hours,minutes,seconds;
			if(mydate.getHours()<10){
				hours="0"+mydate.getHours();
			}else{
				hours=mydate.getHours()
			}
			if(mydate.getMinutes()<10){
				minutes="0"+mydate.getMinutes();
			}else{
				minutes=mydate.getMinutes()
			}
			if(mydate.getSeconds()<10){
				seconds="0"+mydate.getSeconds();
			}else{
				seconds=mydate.getSeconds()
			}
			var time = (1900 + mydate.getYear()) + "/" + (1 + mydate.getMonth())
						+ "/" + mydate.getDate() + " " + hours + ":"
						+ minutes + ":" + seconds;
			$("#ba_time").val(time);
			$("#myModal3").modal('show');
		}else{
			alert("权限不足!");
		}
	});
	/*搜索*/
	$("#btnselect").click(function() {
		var b_name=$("#seclectname").val();
		var b_checkmoney=$("#selectcm option:selected").text();
		if(b_name==""){
			b_name="_";
		}
		if(b_checkmoney=="请选择"){
			b_checkmoney=null;
		}
		if(b_checkmoney=="已付款"){
			b_checkmoney="是";
		}
		if(b_checkmoney=="未付款"){
			b_checkmoney="否";
		}
		$.ajax({
			type : "post",
			url : "selectBill.action",
			data : {
				"b_name" : b_name,
				"b_checkmoney":b_checkmoney
			},
			success : function(msg) {
				if (msg == 1) {
					window.open('billList.jsp','right');
				} else if (msg == 2) {
					alert("无结果");
					location.href="findAllBillbychangePage.action?currentPage=1";
				}
			}
		});
	});
});
/*修改链接*/
function updatayz(msg){
	var mydate = new Date();
	var hours,minutes,seconds;
	if(mydate.getHours()<10){
		hours="0"+mydate.getHours();
	}else{
		hours=mydate.getHours()
	}
	if(mydate.getMinutes()<10){
		minutes="0"+mydate.getMinutes();
	}else{
		minutes=mydate.getMinutes()
	}
	if(mydate.getSeconds()<10){
		seconds="0"+mydate.getSeconds();
	}else{
		seconds=mydate.getSeconds()
	}
	var time = (1900 + mydate.getYear()) + "/" + (1 + mydate.getMonth())
				+ "/" + mydate.getDate() + " " + hours + ":"
				+ minutes + ":" + seconds;
	 
	if($("#ul_iden").val()=="经理"){
		$("#bu_id").val(msg);
		$("#bu_name").val($("#b_name"+msg).text());
		$("#bu_quantity").val($("#b_quantity"+msg).text());
		if($("#b_checkmoney"+msg).text()=="是"){
			$("#checkmoney_Y").prop("checked", true);
		}else{
			$("#checkmoney_N").prop("checked", true);
		}
		$("#bu_money").val($("#b_money"+msg).text());
		$("#bu_time").val(time);
		$("#bu_provider").val($("#p_id"+msg).text());//控制select当前选中的value为指定的value
		$("#bu_miao").val($("#b_miao"+msg).text());
		$("#myModal4").modal('show');
	}else{
		alert("权限不足!");
	}
}
function delBill(id){
	if($("#ul_iden").val()=="经理"){
		 var currentpage=$("#currentpg").val();
		 if(confirm("确定要删除该用户吗？"))
		 {
			$.ajax({
				type : "post",
				url : "delBill.action",
				data : {
					"b_id":id,
					"currentPage" : currentpage,
				},
				success  : function(msg) {
				if (msg == 1) {
					location.href="findAllBillbychangePage.action?currentPage="+currentpage;
				} else if (msg == 2) {
					alert("该账号已存在");
				}
			}
			});
		 }
	}else{
		alert("权限不足");
	}
}
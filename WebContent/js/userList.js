/**
 * 
 */
$(function() {
	/*表格换色*/
	$("#table_userList tr:even:gt(0)").addClass("warning");// 偶数>0行添加class属性
	$("#table_userList tr:odd").addClass("active");// 奇数行添加class属性
	/*添加验证*/
	$("#table1 input[type!='submit']").focus(
			function() {
				if ($(this).is("#uz_name")) {
					$("#span_no").html(
							"<font color='red' size='2'>请输入2-10个字符！</font>");
				}
			});
	$("#ua_iden")
			.change(
					function() {
						if ($(this).val() == 0) {
							$("#span_ua_iden")
									.html(
											"<font color='red' size='2' title='error'>请选择身份！</font>");
						} else {
							$("#span_ua_iden").html("✔");
						}
					});
	$("#table1 input")
			.blur(
					function() {
						if ($(this).is("#uz_name")) {
							var span_no = $("#span_no");
							if ($(this).val().length == 0) {
								span_no
										.html("<font color='red' size='2' title='error'>账号不能为空！</font>");
							} else if ($(this).val().length < 2) {
								span_no
										.html("<font color='red' size='2' title='error'>账号太短了！</font>");
							} else if ($(this).val().length > 10) {
								span_no
										.html("<font color='red' size='2' title='error'>账号太长了！</font>");
							} else {
								span_no.html("✔");
							}
						}
					}).keyup(function() {
				$(this).triggerHandler("blur");
			});
	/*添加提交按钮*/
	$("#btnzc").click(function() {
		$(".bitian").trigger("blur");
		$("#ua_iden").trigger("change");
		if ($("font[title='error']").length > 0) {
			return false;
		} else {
			var totalpg=$("#totalpg").val();
			var totalEm=$("#totalEm").val();
			var pagesize=$("#pagesize").val();
			if(totalEm==parseInt(totalpg)*parseInt(pagesize)){
				totalpg=parseInt(totalpg)+1;
			}
			var u_name = $("#uz_name").val();
			var u_age = $("#uz_age").val();
			var u_sex = $("#uz_sex:checked").val();
			var u_phone = $("#uz_phone").val();
			var u_address = $("#uz_address").val();
			var u_iden=$("#ua_iden  option:selected").text();
			var currentpage=$("#currentpg").val();
			$.ajax({
				type : "post",
				url : "add_user.action",
				data : {
					"u_name" : u_name,
					"u_age" : u_age,
					"u_sex" : u_sex,
					"u_phone" : u_phone,
					"u_address" : u_address,
					"u_iden" : u_iden
				},
				success : function(msg) {
					if (msg == 1) {
						alert("恭喜你!添加成功!");
						location.href="findAll_user_by_changePage.action?currentPage="+totalpg;
					} else if (msg == 2) {
						alert("该账号已存在");
					}
				}
			});
		}
	});
	/*修改验证*/
	$("#table2 input[type!='submit']").focus(
			function() {
				if ($(this).is("#um_name")) {
					$("#span_um_name").html(
							"<font color='red' size='2'>请输入2-10个字符！</font>");
				}
			});
	$("#um_iden").change(
			function() {
			if ($(this).val() == 0) {
				$("#span_um_iden").html(
						"<font color='red' size='2' title='error'>请选择身份！</font>");
					} else {
						$("#span_um_iden").html("✔");
					}
				});
	$("#um_name").blur(function() {
			var span_no = $("#span_um_name");
				if ($(this).val().length == 0) {
					span_no.html("<font color='red' size='2' title='error'>账号不能为空！</font>");
				} else if ($(this).val().length < 2) {
					span_no.html("<font color='red' size='2' title='error'>账号太短了！</font>");
				} else if ($(this).val().length > 10) {
					span_no.html("<font color='red' size='2' title='error'>账号太长了！</font>");
				} else {
					span_no.html("✔");
				}
			}).keyup(function() {
				$(this).triggerHandler("blur");
			});
	/*修改提交按钮*/
	$("#btnum").click(function() {
		$(".bitianm").trigger("blur");
		$("#um_iden").trigger("change");
		if ($("font[title='error']").length > 0) {
			return false;
		} else {
			var u_id=$("#um_id").val();
			var u_name = $("#um_name").val();
			var u_age = $("#um_age").val();
			var u_sex = $(".um_sex:checked").val();
			var u_phone = $("#um_phone").val();
			var u_address = $("#um_address").val();
			var u_iden=$("#um_iden  option:selected").text();
			var curr_page=$("#um_currentPage").val();
			$.ajax({
				type : "post",
				url : "updata_user_by_u_id.action",
				data : {
					"u_id":u_id,
					"u_name" : u_name,
					"u_age" : u_age,
					"u_sex" : u_sex,
					"u_phone" : u_phone,
					"u_address" : u_address,
					"u_iden" : u_iden,
					"curr_page":curr_page
				},
				success : function(msg) {
					if (msg == 1) {
						$("#myModal2").modal('hide');
						location.href="findAll_user_by_changePage.action?currentPage="+curr_page;
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
			$("#myModal1").modal('show');
		}else{
			alert("权限不足!");
		}
	});
	/*搜索*/
	$("#btn_serch").click(function() {
		var u_name=$("#u_serch").val();
		$.ajax({
			type : "post",
			url : "findAll_user_by_u_name.action",
			data : {
				"u_name" : u_name,
			},
			success : function(msg) {
				if (msg == 1) {
					window.open('userList.jsp','right');
				} else if (msg == 2) {
					alert("无结果");
					window.open('userList.jsp','right');
				}
			}
		});
	});
});
/*修改链接*/
function updatayz(msg){
	if($("#ul_iden").val()=="经理"){
		$("#um_id").val(msg);
		$("#um_name").val($("#u_name"+msg).text());
		$("#um_age").val($("#u_age"+msg).text());
		if($("#u_sex"+msg).text()=="男"){
			$("#um_sex_M").prop("checked", true);
		}else{
			$("#um_sex_F").prop("checked", true);
		}
		$("#um_phone").val($("#u_phone"+msg).text());
		$("#um_address").val($("#u_address"+msg).text());
		if($("#u_iden"+msg).text()=="用户"){
			$("#um_iden option[value='1']").prop("selected", true);
		}else{
			$("#um_iden option[value='2']").prop("selected", true);
		}
		$("#um_currentPage").val($("#currentPage"+msg).text());
		$("#myModal2").modal('show');
	}else{
		alert("权限不足!");
	}
}
function deleteuser(msg){
	if($("#ul_iden").val()=="经理"){
		 var currentpage=$("#currentpg").val();
		 var totalpg=$("#totalpg").val();
		 var totalEm=$("#totalEm").val();
		 var pagesize=$("#pagesize").val();
		 if((parseInt(totalEm)-1)==(parseInt(currentpage)-1)*parseInt(pagesize)){
				totalpg=parseInt(currentpage)-1;
		 }
		 if(confirm("确定要删除该用户吗？"))
		 {
			$.ajax({
				type : "post",
				url : "delete_user_by_u_id.action",
				data : {
					"u_id":msg,
					"currentPage" : currentpage,
				},
				success:function(data){
					if(data!=null){
						location.href="findAll_user_by_changePage.action?currentPage="+totalpg;
					}
				},
				error:function(data){
					alert("出错了"+data.result);
				}
					 
			});
		 }
	}else{
		alert("权限不足");
	}
}
/**
 * 
 */
$(function() {
	
	/*表格换色*/
	$("#table_proderList tr:even:gt(0)").addClass("warning");// 偶数>0行添加class属性
	$("#table_proderList tr:odd").addClass("active");
	/*添加验证*/
	$("#table1 input[type!='submit']").focus(
			function() {
				if ($(this).is("#pa_name")) {
					$("#span_pa_name").html(
							"<font color='red' size='2'>请输入2-10个字符！</font>");
				}
				if ($(this).is("#pa_touch")) {
					$("#span_pa_touch").html(
							"<font color='red' size='2'>请输入1-5个字符！</font>");
				}
				if ($(this).is("#pa_phone")) {
					$("#span_pa_phone").html(
							"<font color='red' size='2'>请输入联系方式！</font>");
				}
				if ($(this).is("#pa_address")) {
					$("#span_pa_address").html(
							"<font color='red' size='2'>请输入地址！</font>");
				}
			});
	$("#table1 input")
			.blur(
					function() {
						if ($(this).is("#pa_name")) {
							var span_pa_name = $("#span_pa_name");
							if ($(this).val().length == 0) {
								span_pa_name
										.html("<font color='red' size='2' title='error'>供应商不能为空！</font>");
							} else if ($(this).val().length < 2) {
								span_pa_name
										.html("<font color='red' size='2' title='error'>太短了！</font>");
							} else if ($(this).val().length > 10) {
								span_pa_name
										.html("<font color='red' size='2' title='error'>太长了！</font>");
							} else {
								span_pa_name.html("✔");
							}
						}
						if ($(this).is("#pa_touch")) {
							var span_pa_touch = $("#span_pa_touch");
							if ($(this).val().length == 0) {
								span_pa_touch
										.html("<font color='red' size='2' title='error'>联系人不能为空！</font>");
							} else if ($(this).val().length < 1) {
								span_pa_touch
										.html("<font color='red' size='2' title='error'>太短了！</font>");
							} else if ($(this).val().length > 5) {
								span_pa_touch
										.html("<font color='red' size='2' title='error'>太长了！</font>");
							} else {
								span_pa_touch.html("✔");
							}
						}
						if ($(this).is("#pa_phone")) {
							var span_pa_phone = $("#span_pa_phone");
							if ($(this).val().length == 0) {
								span_pa_phone
										.html("<font color='red' size='2' title='error'>联系方式不能为空！</font>");
							} else if ($(this).val().length !=11) {
								span_pa_phone
										.html("<font color='red' size='2' title='error'>请输入正确的联系方式!</font>");
							} else {
								span_pa_phone.html("✔");
							}
						}
						if ($(this).is("#pa_address")) {
							var span_pa_address = $("#span_pa_address");
							if ($(this).val().length == 0) {
								span_pa_address
										.html("<font color='red' size='2' title='error'>地址不能为空！</font>");
							} else {
								span_pa_address.html("✔");
							}
						}
					}).keyup(function() {
				$(this).triggerHandler("blur");
			});
	/*添加提交按钮*/
	$("#btnpa").click(function() {
		$(".bitian").trigger("blur");
		if ($("font[title='error']").length > 0) {
			return false;
		} else {
			var totalpg=$("#totalpg").val();
			var totalEm=$("#totalEm").val();
			var pagesize=$("#pagesize").val();
			if(totalEm==parseInt(totalpg)*parseInt(pagesize)){
				totalpg=parseInt(totalpg)+1;
			}
			var p_name = $("#pa_name").val();
			var p_touch = $("#pa_touch").val();
			var p_phone = $("#pa_phone").val();
			var p_address = $("#pa_address").val();
			$.ajax({
				type : "post",
				url : "addprovider.action",
				data : {
					"p_name" : p_name,
					"p_touch" : p_touch,
					"p_phone" : p_phone,
					"p_address" : p_address
				},
				success : function(msg) {
					if (msg == 1) {
						alert("恭喜你!添加成功!");
						location.href="findAllproviderbychangePage.action?currentPage="+totalpg;
					} else if (msg == 2) {
						alert("该账号已存在");
					}
				}
			});
		}
	});
	/*修改验证*/
	$("#table6 input[type!='submit']").focus(
			function() {
				if ($(this).is("#pu_name")) {
					$("#span_pu_name").html(
							"<font color='red' size='2'>请输入2-10个字符！</font>");
				}
				if ($(this).is("#pu_touch")) {
					$("#span_pu_touch").html(
							"<font color='red' size='2'>请输入1-5个字符!</font>");
				}
				if ($(this).is("#pu_phone")) {
					$("#span_pu_phone").html(
							"<font color='red' size='2'>请输入联系方式！</font>");
				}
				if ($(this).is("#pu_address")) {
					$("#span_pu_address").html(
							"<font color='red' size='2'>请输入地址！</font>");
				}
			});
	$("#table6 input")
			.blur(
					function() {
						if ($(this).is("#pu_name")) {
							var span_pu_name = $("#span_pu_name");
							if ($(this).val().length == 0) {
								span_pu_name
										.html("<font color='red' size='2' title='error'>供应商不能为空！</font>");
							} else if ($(this).val().length < 2) {
								span_pu_name
										.html("<font color='red' size='2' title='error'>太短了！</font>");
							} else if ($(this).val().length > 10) {
								span_pu_name
										.html("<font color='red' size='2' title='error'>太长了！</font>");
							} else {
								span_pu_name.html("✔");
							}
						}
						if ($(this).is("#pu_touch")) {
							var span_pu_touch = $("#span_pu_touch");
							if ($(this).val().length == 0) {
								span_pu_touch
										.html("<font color='red' size='2' title='error'>联系人不能为空！</font>");
							} else if ($(this).val().length < 1) {
								span_pu_touch
										.html("<font color='red' size='2' title='error'>太短了！</font>");
							} else if ($(this).val().length > 5) {
								span_pu_touch
										.html("<font color='red' size='2' title='error'>太长了！</font>");
							} else {
								span_pu_touch.html("✔");
							}
						}
						if ($(this).is("#pu_phone")) {
							var span_pu_phone = $("#span_pu_phone");
							if ($(this).val().length == 0) {
								span_pu_phone
										.html("<font color='red' size='2' title='error'>联系方式不能为空！</font>");
							} else if ($(this).val().length !=11) {
								span_pu_phone
										.html("<font color='red' size='2' title='error'>请输入正确的联系方式!</font>");
							} else {
								span_pu_phone.html("✔");
							}
						}
						if ($(this).is("#pu_address")) {
							var span_pu_address = $("#span_pu_address");
							if ($(this).val().length == 0) {
								span_pu_address
										.html("<font color='red' size='2' title='error'>地址不能为空！</font>");
							} else {
								span_pu_address.html("✔");
							}
						}
					}).keyup(function() {
				$(this).triggerHandler("blur");
			});
	/*修改提交按钮*/
	$("#btnpu").click(function() {
		$(".bitiapu").trigger("blur");
		if ($("font[title='error']").length > 0) {
			return false;
		} else {
			var curr_page=$("#currentpg").val();
			var p_id=$("#pu_id").val();
			var p_name = $("#pu_name").val();
			var p_touch=$("#pu_touch").val();
			var p_address = $("#pu_address").val();
			var p_phone = $("#pu_phone").val();
			$.ajax({
				type : "post",
				url : "updataProvider.action",
				data : {
					"p_id":p_id,
					"p_name" : p_name,
					"p_touch" : p_touch,
					"p_address" : p_address,
					"p_phone" : p_phone
				},
				success : function(msg) {
					if (msg == 1) {
						$("#myModal6").modal('hide');
						location.href="findAllproviderbychangePage.action?currentPage="+curr_page;
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
			$("#myModal5").modal('show');
		}else{
			alert("权限不足!");
		}
	});
	/*搜索*/
	$("#btnselect").click(function() {
		var p_name=$("#p_name").val();
		if(p_name==""){
			p_name="_";
		}
		$.ajax({
			type : "post",
			url : "findproviderlikeName.action",
			data : {
				"p_name" : p_name,
			},
			success : function(msg) {
				if (msg == 1) {
					window.open('providerList.jsp','right');
				} else if (msg == 2) {
					alert("无结果");
					window.open('providerList.jsp','right');
				}
			}
		});
	});
});
/*修改链接*/
function updatayz(msg){
	if($("#ul_iden").val()=="经理"){
		$("#pu_id").val(msg);
		$("#pu_name").val($("#p_name"+msg).text());
		$("#pu_touch").val($("#p_touch"+msg).text());
		$("#pu_phone").val($("#p_phone"+msg).text());
		$("#pu_address").val($("#p_address"+msg).text());
		$("#myModal6").modal('show');
	}else{
		alert("权限不足!");
	}
}
function delprovider(msg){
	if($("#ul_iden").val()=="经理"){
		 var currentpage=$("#currentpg").val();
		 var totalpg=$("#totalpg").val();
		 var totalEm=$("#totalEm").val();
		 var pagesize=$("#pagesize").val();
		 if((parseInt(totalEm)-1)==(parseInt(currentpage)-1)*parseInt(pagesize)){
				totalpg=parseInt(currentpage)-1;
		 }
		 if(confirm("确定要删除该供应商吗？"))
		 {
			$.ajax({
				type : "post",
				url : "delProvider.action",
				data : {
					"p_id":msg,
				},
				
				success:function(data){
					if(data==1){
						location.href="findAllproviderbychangePage.action?currentPage="+totalpg;
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
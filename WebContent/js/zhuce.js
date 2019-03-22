/**
 * 
 */
$(function() {
	$("#table1 input[type!='submit']").focus(
			function() {
				if ($(this).is("#uz_name")) {
					$("#span_no").html(
							"<font color='red' size='2'>请输入2-10个字符！</font>");
				}
				if ($(this).is("#uz_password")) {
					$("#span_password").html(
							"<font color='red' size='2'>请输入6-10个字符！</font>");
				}
				if ($(this).is("#uz_password_replay")) {
					$("#span_password_replay").html(
							"<font color='red' size='2'>请重复输入密码！</font>");
				}
			});
	$("#uz_iden").change(function(){
		if($(this).val()==0){
			$("#span_u_iden").html(
			"<font color='red' size='2' title='error'>请选择身份！</font>");
		}else{
			$("#span_u_iden").html("✔");
		}
	});
	$("#table1 input").blur(
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
						if ($(this).is("#uz_password")) {
							var span_password = $("#span_password");
							if ($(this).val().length == 0) {
								span_password
										.html("<font color='red' size='2' title='error'>密码不能为空！</font>");
							} else if ($(this).val().length < 6) {
								span_password
										.html("<font color='red' size='2'  title='error'>密码太短了！</font>");
							} else if ($(this).val().length > 10) {
								span_password
										.html("<font color='red' size='2'  title='error'>密码太长了！</font>");
							} else {
								span_password.html("✔");
							}
						}
						if ($(this).is("#uz_password_replay")) {
							var span_password_replay = $("#span_password_replay");
							if ($(this).val().length == 0) {
								span_password_replay
										.html("<font color='red' size='2' title='error'>请再次输入密码！</font>");
							} else if ($(this).val() != $("#uz_password").val()) {
								span_password_replay
										.html("<font color='red' size='2' title='error'>两次密码不一致！</font>");
							} else {
								span_password_replay.html("✔");
							}
						}
					}).keyup(function() {
				$(this).triggerHandler("blur");
			});
	$("#btnzc").click(function() {
		$(".bitian").trigger("blur");
		$("#uz_iden").trigger("change");
		if ($("font[title='error']").length > 0) {
			return false;
		} else {
			var u_name = $("#uz_name").val();
			var u_password = $("#uz_password").val();
			var u_age=$("#uz_age").val();
			var u_sex = $("#uz_sex:checked").val();
			var u_phone=$("#uz_phone").val();
			var u_address=$("#uz_address").val();
			var u_iden=$("#uz_iden  option:selected").text();
			$.ajax({
				type : "post",
				url : "register_user.action",
				data : {
					"u_name" : u_name,
					"u_password" : u_password,
					"u_age":u_age,
					"u_sex":u_sex,
					"u_phone":u_phone,
					"u_address":u_address,
					"u_iden":u_iden
				},
				success : function(msg) {
					if (msg == 1) {
						alert("恭喜你!注册成功!");
						location.href="login.jsp";
					} else if(msg==2){
						alert("该账号已存在");
					}
				}
			});
		}
	});
});
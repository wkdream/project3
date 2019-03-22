/**
 * 
 */
$(function(){
	$("#btnlogin").click(function(){
		var u_name=$("#u_name").val();
		var u_password=$("#u_password").val();
		if(u_name==""){
			alert("用户名不能为空");
			return false;
		}else if(u_password==""){
			alert("密码不能为空");
			return false;
		}else{
			$.ajax({
				type:"post",
				url:"login.action",
				data:{
					"u_name":u_name,
					"u_password":u_password
				},
				success:function(msg){
					if(msg==1){
						location.href="findAll_user.action?u_name="+u_name;
					}else if(msg==3){
						alert("您是第一次登陆,请重新修改您的密码!")
						$("#myModal7").modal('show');
					}else{
						alert("用户名或密码错误!")
					}
				}
			});
		}
	});
	$("#table7 input").focus(function(){
		if ($(this).is("#old_password")) {
			$("#span_old_password").html("<font color='red' size='2' title='error'>请输入原密码！</font>");
		}
		if ($(this).is("#new_password")) {
			$("#span_new_password").html("<font color='red' size='2' title='error'>请输入新密码！</font>");
		}
		if ($(this).is("#new_password_replay")) {
			$("#span_new_password_replay").html("<font color='red' size='2' title='error'>请重复新密码！</font>");
		}
	});
	$("#table7 input").blur(function(){
		if($(this).is("#old_password")){
			if($(this).val()!="999999"){
				$("#span_old_password").html("<font color='red' size='2' title='error'>原密码错误！</font>");
			}else{
				$("#span_old_password").html("<font color='red' size='2'>✔</font>");
			}
		}
		if($(this).is("#new_password")){
			if($(this).val()=="999999"){
				$("#span_new_password").html("<font color='red' size='2' title='error'>新密码不能与原密码相同！</font>");
			}else if($(this).val().length<6){
				$("#span_new_password").html("<font color='red' size='2' title='error'>新密码太短了！</font>");
			}else if($(this).val().length>12){
				$("#span_new_password").html("<font color='red' size='2' title='error'>新密码太长了！</font>");
			}else{
				$("#span_new_password").html("<font color='red' size='2'>✔</font>");
			}
		}
		if($(this).is("#new_password_replay")){
			if($(this).val()!=$("#new_password").val()){
				$("#span_new_password_replay").html("<font color='red' size='2' title='error'>请与新密码一致！</font>");
			}else{
				$("#span_new_password_replay").html("<font color='red' size='2'>✔</font>");
			}
		}
	}).keyup(function() {
		$(this).triggerHandler("blur");
	});
	$("#btnxg").click(function(){
		$("#table7 input").triggerHandler("blur");
		if($("font[title='error']").length > 0){
			alert("错误")
			return false;
		}else{
			$.ajax({
				type : "post",
				url : "updatePassword.action",
				data : {
					"u_name":$("#u_name").val(),
					"u_password":$("#new_password").val()
				},
				success:function(msg){
					alert(msg)
					if(msg==1){
						alert("密码修改成功!请重新登陆!");
						location.href="login.jsp";
					}else{
						alert("密码修改失败!请重试!");
						$("#myModal7").modal('show');
					}
				}
			});
		}
	});
});
	

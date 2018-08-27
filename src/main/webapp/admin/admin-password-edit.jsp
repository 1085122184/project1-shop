<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
<script type="text/javascript" src="http://libs.useso.com/js/respond.js/1.4.2/respond.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/css3pie/2.0beta1/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="../static/h-ui/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="../static/h-ui.admin/css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/>
<!--[if IE 7]>
<link href="http://www.bootcss.com/p/font-awesome/assets/css/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<title>修改密码</title>
</head>
<body>
<div class="pd-20">
  <form class="form-horizontal" id="form-admin-add" action="updatepass?id=${requestScope.info.id}"method="post">
    
          
          <label class="text-r" width="30%">旧密码：</label>
          <input name="old" id="old" value="${requestScope.info.id}">
          <input name="oldpassword" id="oldpassword" class="input-text" type="password" autocomplete="off" placeholder="密码" tabindex="1" datatype="*6-16" nullmsg="请输入旧密码！" errormsg="4~16个字符，区分大小写！"> 
         
          <label class="text-r" width="30%">新密码：</label>
          <input name="password" id="password" class="input-text" type="password" autocomplete="off" placeholder="设置密码" tabindex="2" datatype="*6-16"  nullmsg="请输入您的新密码！" errormsg="4~16个字符，区分大小写！" > 
          
          <label class="text-r" width="30%">再次输入新密码：</label>
          <input name="password2" id="newpassword2" class="input-text" type="password" autocomplete="off" placeholder="确认新密码" tabindex="3" datatype="*" recheck="newpassword" nullmsg="请再输入一次新密码！" errormsg="您两次输入的新密码不一致！"> 
          <button type="submit"  class="btn btn-success radius" style="margin-top: 2px;margin-left: 250px"><i class="icon-ok"></i> 确定</button>
       
  </form>
</div>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script> 
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script> 
<script type="text/javascript" src="../static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="../lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="../lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="../lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			
			password:{
				required:true,
			},
			password2:{
				required:true,
				equalTo: "#password"
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: $(form).action ,
				success: function(code){
					layer.msg('密码修改成功',{icon:1,time:1000,end:function(){
						var index = parent.layer.getFrameIndex(window.name);
						window.parent.location.reload();
						//parent.$('#a').click();
						parent.layer.close(index);
						
					}});
				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('错误!',{icon:1,time:1000,end:function(){
						var index = parent.layer.getFrameIndex(window.name);
						window.parent.location.reload();
						//parent.$('#a').click();
						parent.layer.close(index);
					}});
				}
			});
		}
	});
});




function  save(id) {
	var url = "updatepass?id="+id;
		$.ajax({
			type : "post",
			async : true,  //yibu请求
			url : url,
			timeout:1000,
			data: $('.form-horizontal').serialize(),
			success:function(dates){
				window.parent.location.reload();
			}
		});
}

</script>
<script>
</script>
</body>
</html>
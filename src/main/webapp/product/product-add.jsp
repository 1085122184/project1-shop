﻿<!--_meta 作为公共模版分离出去-->
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<link href="../lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<form  method="post" class="form form-horizontal" id="form-article-add">
	<input type="hidden" name="id" value="${requestScope.list1.id}">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="" name="fullname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">优先级：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="0" placeholder="" id="" name="priority">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品展示价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="nowprice" id="" placeholder="" value="" class="input-text" style="width:90%">
				元</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">市场价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="price" id="" placeholder="" value="" class="input-text" style="width:90%">
				元</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">活动：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="activity" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">销售信息：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="sale" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">提示信息：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="tip" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="comments" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">商品详情：</label>
			<div class="formControls col-xs-8 col-sm-9" > 
			    
				<script  id="editor" name="info"   type="text/plain" style="width:100%;height:400px;" > </script> 
			</div>
		</div>
		
		
		
		
		
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="save();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 提交审核</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="../lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="../lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="../lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="../lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="../lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="../lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
function  save() {
	var url = "product-insert"
		$.ajax({
			type : "post",
			async : true,  //同步请求
			url : url,
			timeout:1000,
			data: $('.form-horizontal').serialize(),
			success:function(dates){
				window.parent.location.reload();
			}
		});
}




$(function(){
	var ue = UE.getEditor('editor');
});
</script>
</body>
</html>
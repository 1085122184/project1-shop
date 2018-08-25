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
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<link href="../lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>

<c:forEach items="${requestScope.list}" var="r">
    
    <a style="margin-left: 50px">商品全名：</a><a>${r.fullname}</a><br>
    <a style="margin-left: 50px">商品类型：</a><a>${r.tname}</a><br>
    <a style="margin-left: 50px">价格：</a><a>${r.price}</a><br>
    <a style="margin-left: 50px">原价格：</a><a>${r.nowprice}</a><br>
    <a style="margin-left: 50px">销售数量：</a><a>${r.salecount}</a><br>
    <a style="margin-left: 50px">收藏人数：</a><a>${r.collectcount}</a><br>
    <a style="margin-left: 50px">优先级：</a><a>${r.priority}</a><br>
    <a style="margin-left: 50px">状态：</a><a>${r.status_name}</a><br>
    <a style="margin-left: 50px">备注：</a><a>${r.comments}</a><br>
    
    <a style="margin-left: 50px">商品介绍：</a><div style="margin-left: 50px;width: 200px">${r.info}</div>
    <a style="margin-left: 50px">商品图片：</a>
    <div style="margin-left: 50px">
    
    <c:if test="${r.pic!=null}">
                <c:forEach items="${r.piclist}" var="p">
				<img src="${p}"  /> <br>
				</c:forEach>
      </c:if>
        <!--  <img src="${r.pic}" width="200" height="150"  />   -->
	  
    </div>
    

</c:forEach>


















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
</body>
</html>
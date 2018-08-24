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
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">


$("#waitWork").click(function(){
	
});
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要开除吗？',function(index){
		var url = "update_off?id="+id;
		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : url,
			timeout:1000,
			success:function(dates){
			$('#mainContent'+dates[0].id).html(dates[0].status_name);
			$('#mainContent'+dates[0].id).css("background-color","#999999");
			$('#off'+dates[0].id).css("display","none");
			$('#on'+dates[0].id).css("display","inline-block");
			layer.msg('已开除!',{icon:1,time:1000});
			},
			error: function() {
	           // alert("失败，请稍后再试！");
	        }
		});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		var url = "update_on?id="+id;
		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : url,
			timeout:1000,
			success:function(dates){
			$('#mainContent'+dates[0].id).html(dates[0].status_name);
			$('#mainContent'+dates[0].id).css("background-color","#5EB95E");
			$('#on'+dates[0].id).css("display","none");
			$('#off'+dates[0].id).css("display","inline-block");
			layer.msg('已启用!',{icon:1,time:1000});
			},
			error: function() {
	           // alert("失败，请稍后再试！");
	        }
		});
	});


}

$(function(){
	$(".sselect").on("change",function(){
		$(".sinput").css("display","none").attr("disabled","disabled");
		$($(".sinput")[$(".sselect").val()]).css("display","inline").removeAttr("disabled");
	});
	
	$(".sselect").val(select);
	$($(".sinput")[select]).css("display","inline").removeAttr("disabled").val(txt);
});
</script>
<title>管理员列表</title>
</head>

<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r" id="a" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container" >
	<div class="text-c">
	<form action="admin-list" method="post"> 
	
  <select class="sselect" name="select" style="height: 30px; width: 100px;">
     <option value="0">姓名查询</option>
     <option value="1">状态查询</option>
  </select>
  <input type="text" class="input-text sinput" style="width:150px" placeholder="输入管理员名称" id="" name="txt">
 <select name="txt" class="inputselect sinput" style="height:30px;width:150px ;display: none;" disabled="disabled">
			<c:forEach items="${requestScope.status}" var="r" varStatus="v">
				<c:if test="${requestScope.info.status!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.status==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
</select>
		<button type="submit" class="btn btn-success" id="" name="" ><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
		
	</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="admin_add('添加管理员','add','800','600')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a></span> <span class="r">共有数据：<strong>${requestScope.counts}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">员工列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="100">用户名</th>
				<th width="60">姓名</th>
				<th width="90">性别</th>
				<th width="150">手机号</th>
				<th>权限</th>
				<th width="100">是否在职</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${requestScope.list}" var="r">
				<tr class="text-c">
				<td><input type="checkbox" ></td>
				<td>${r.nike}</td>
				<td>${r.name}</td>
				<td>${r.sex_name}</td>
				<td>${r.tel}</td>
				<td>${r.power_name}</td>
				<c:if test="${r.status==0}">
				<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.status_name}</span></td>
				<td class="td-manage"><a style="text-decoration:none;" id="off${r.id}"  onClick="admin_stop(this,${r.id})" href="javascript:;" title="开除"><i class="Hui-iconfont">&#xe631;</i></a>
				                      <a id="on${r.id}" onClick="admin_start(this,${r.id})" href="javascript:;" title="重新启用" style="text-decoration:none;display: none;"><i class="Hui-iconfont">&#xe615;</i></a>
				                      <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','edit?id=${r.id}','1','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a></td>
				</c:if>
				<c:if test="${r.status==1}">
				<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}" style="background-color: #999999">${r.status_name}</span></td>
				<td class="td-manage"><a style="text-decoration:none;display: none;" id="off${r.id}"  onClick="admin_stop(this,${r.id})" href="javascript:;" title="开除"><i class="Hui-iconfont">&#xe631;</i></a>
				                      <a id="on${r.id}" onClick="admin_start(this,${r.id})" href="javascript:;" title="重新启用" style="text-decoration:none;"><i class="Hui-iconfont">&#xe615;</i></a>
				                      <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','edit?id=${r.id}','1','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a></td>
				</c:if>
				
				
				</tr>
				 </c:forEach>
		</tbody>
	</table>
	<div class="text-c">
	<button type="button" class="btn page" onclick="location.href='admin-list?pageno=${requestScope.searchInfo.prev}'" " >上一页</button>
	
	<button type="button" class="btn page" onclick="location.href='admin-list?pageno=${requestScope.searchInfo.next}'">下一页</button>
    </div>
</div>
</body>
</html>
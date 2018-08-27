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
<title>建材列表</title>
<link rel="stylesheet" href="../lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body >

<div class="page-container">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 产品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c"> 日期范围：
			<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
			<input type="text" name="" id="" placeholder=" 产品名称" style="width:250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜商品</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有数据：<strong>54</strong> 条</span> </div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40"><input name="" type="checkbox" value=""></th>
						<th width="100">日期</th>
						<th width="100">订单号</th>
						<th width="60">原金额</th>
						<th width="100">实际金额</th>
						<th width="150">用户名</th>
						<th width="150">地址</th>
						<th width="50">收货人</th>
						<th width="100">状态</th>
						<th width="60">评价状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${requestScope.list}" var="r">
					<tr class="text-c va-m">
						<td><input name="" type="checkbox" value=""></td>
						<td>${r.date}</td>
						<td>${r.code}</td>
						<td>${r.amount}</td>
						<td>${r.nowamount}</td>
						<td>${r.uname}</td>
						<td>${r.address}</td>
						<td>${r.addrname}</td>
						<c:if test="${r.status==0}">
						  <c:if test="${r.assessstatus==0}">
 						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.status_name}</span></td>
 						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						  <c:if test="${r.assessstatus==1}">
 						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.status_name}</span></td>
 						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						<td class="td-manage"><a style="text-decoration:none;"   onClick="order_waitpay()" href="javascript:;" title="未支付"><i class="Hui-iconfont">&#xe688;</i></a></td>
						</c:if>
						<c:if test="${r.status==1}">
						  <c:if test="${r.assessstatus==0}">
						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.status_name}</span></td>
						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						  <c:if test="${r.assessstatus==1}">
 						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.status_name}</span></td>
 						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						 <td class="td-manage"><a style="text-decoration:none;"   onClick="order_send()" href="javascript:;" title="发货"><i class="Hui-iconfont">&#xe634;</i></a></td>
						</c:if>
						<c:if test="${r.status==2}">
						  <c:if test="${r.assessstatus==0}">
						<td class="td-status"><span class="label label-primary radius" id="mainContent${r.id}">${r.status_name}</span></td>
						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						  <c:if test="${r.assessstatus==1}">
 						<td class="td-status"><span class="label label-primary radius" id="mainContent${r.id}">${r.status_name}</span></td>
 						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						 <td class="td-manage"><a style="text-decoration:none;"   onClick="order_waittake()" href="javascript:;" title="已发货"><i class="Hui-iconfont">&#xe656;</i></a></td>
						</c:if>
						<c:if test="${r.status==3}">
						  <c:if test="${r.assessstatus==0}">
						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.status_name}</span></td>
						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						  <c:if test="${r.assessstatus==1}">
 						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.status_name}</span></td>
 						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						 <td class="td-manage"><a style="text-decoration:none;"   onClick="order_warn()" href="javascript:;" title="提醒评价"><i class="Hui-iconfont">&#xe656;</i></a></td>
						</c:if>
						<c:if test="${r.status==4}">
						  <c:if test="${r.assessstatus==0}">
						<td class="td-status"><span class="label label-warning radius" id="mainContent${r.id}">${r.status_name}</span></td>
						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						  <c:if test="${r.assessstatus==1}">
 						<td class="td-status"><span class="label label-warning radius" id="mainContent${r.id}">${r.status_name}</span></td>
 						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if> 
						 <td class="td-manage" id="content${r.id}"><a id="${r.id}" style="text-decoration:none;"   onClick="order_agree(this,${r.id})" href="javascript:;" title="审核通过"><i class="Hui-iconfont">&#xe6e1;</i></a>
						<a id="${r.id}1" style="text-decoration:none;"   onClick="order_refuse(this,${r.id})" href="javascript:;" title="审核不通过"><i class="Hui-iconfont">&#xe6dd;</i></a></td>
						</c:if>
						<c:if test="${r.status==5}">
						  <c:if test="${r.assessstatus==0}">
						<td class="td-status"><span class="label label-danger radius" id="mainContent${r.id}">${r.status_name}</span></td>
						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						  <c:if test="${r.assessstatus==1}">
 						<td class="td-status"><span class="label label-danger radius" id="mainContent${r.id}">${r.status_name}</span></td>
 						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						 <td class="td-manage"><a style="text-decoration:none;"   onClick="order_return()" href="javascript:;" title="已退货"><i class="Hui-iconfont">&#xe688;</i></a></td>
						</c:if>
						
						<c:if test="${r.status==6}">
						  <c:if test="${r.assessstatus==0}">
						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.status_name}</span></td>
						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						  <c:if test="${r.assessstatus==1}">
 						<td class="td-status"><span class="label label-disabled radius" id="mainContent${r.id}">${r.status_name}</span></td>
 						<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.assessstatus_name}</span></td>
						  </c:if>
						 <td class="td-manage"><a style="text-decoration:none;"   onClick="order_refused()" href="javascript:;" title="已拒绝申请"><i class="Hui-iconfont">&#xe661;</i></a></td>
						</c:if>
						
						
						
						
						
									
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

$('.table-sort').dataTable({
	"aaSorting": [[ 0, "desc" ]],//默认第几个排序
	"bStateSave": false,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8,9]}// 制定列不参与排序
	]
});

function order_waitpay() {
	layer.msg('等待用户支付!',{icon:1,time:1000});
}
function order_waittake() {
	layer.msg('等待用户收货!',{icon:1,time:1000});
}
function order_return() {
	layer.msg('用户已退货!',{icon:1,time:1000});
}

function order_refused() {
	layer.msg('已拒绝申请!',{icon:1,time:1000});
}

function order_agree(obj,id){
	layer.confirm('确认同意退货吗？',function(index){
		var url = "agree?id="+id;
		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : url,
			timeout:1000,
			success:function(dates){
			$('#mainContent'+dates[0].id).html(dates[0].status_name);
			$('#mainContent'+dates[0].id).css("background-color","#DD514C");
			$("#"+id).remove();
			$("#1"+id).remove();
			$('#content'+id).append(("<a style='text-decoration:none;'onClick='order_return()' href='javascript:;' title='已退货'><i class='Hui-iconfont'>&#xe688;</i></a>"));
			//$('#mainContent'+dates[0].id).remove($(".remove"));
			layer.msg('已同意退货!',{icon:1,time:1000});
			},
			error: function() {
	           // alert("失败，请稍后再试！");
	        }
		});
	});
}

function order_refuse(obj,id){
	layer.confirm('确认拒绝退货吗？',function(index){
		var url = "refuse?id="+id;
		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : url,
			timeout:1000,
			success:function(dates){
			$('#mainContent'+dates[0].id).html(dates[0].status_name);
			$('#mainContent'+dates[0].id).css("background-color","#999999");
			$("#"+id).remove();
			$("#1"+id).remove();
			$('#content'+id).append(("<a style='text-decoration:none;'   onClick=''order_refused()' href='javascript:;' title='已拒绝申请'><i class='Hui-iconfont'>&#xe661;</i></a>"));
			//$('#mainContent'+dates[0].id).remove($(".remove"));
			layer.msg('已同意退货!',{icon:1,time:1000});
			},
			error: function() {
	           // alert("失败，请稍后再试！");
	        }
		});
	});
}
/*产品-查看*/
function product_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}


function product_see(title,url) {
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

</script>
</body>
</html>
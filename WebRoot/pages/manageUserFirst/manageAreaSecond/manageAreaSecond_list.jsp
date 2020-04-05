<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>二级管辖域信息列表</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
<script type="text/javascript">
/*
 *_contextPath:上下文路径
 *_modulePath: 模块路径
 */
var  _contextPath="<%=path%>";
var  _modulePath=_contextPath+"/sys/";
$(document).ready(function(){
  $(".clicks").click(function(){
   _open(_modulePath+"textures_open.action?view=add");
  });
});
</script>

<script type="text/javascript">
	//删除
	$(function(){
		var id;
		$(".tablelinkdelete").click(function(){
		 	id = $(this).attr("idValue");
		  	$(".tip").fadeIn(300);
		 });
		  
	  	$(".tiptop a").click(function(){
	  	$(".tip").fadeOut(200);
	});
		
	$(".sure").click(function(){
		$(".tip").fadeOut(100);
		$.post("<%= basePath%>/sys/manageAreaSecond_delete.action", {asId:id}, function(data){
			var url = "<%=basePath%>/sys/ManageAreaSecond_findByPage.action?ufId=${userCode}";
			if(data.targ == true){
				$("#delete").html("<font color='#00FF00'>删除成功！</font>");
				setTimeout(function(){
					window.location.href = url;
				}, 1000);
			}else{
				window.location.href = url;
				$("#delete").html("<font color='#FF0000'>该用户信息不存在！</font>");
			}
		});
	});
		
  	$(".cancel").click(function(){
 		$(".tip").fadeOut(100);
	});
	});
</script>

<style type="text/css">
.tablelinkdelete{color:#056dae;}
</style>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">一级管辖员</a></li>
    <li><a href="#">二级管辖域管理</a></li>
    </ul>
    </div>
<div class="formbody">
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson">
        
     	<form action="<%= basePath%>/sys/ManageAreaSecond_findByPage.action?ufId=${userCode}" method="post" target="rightFrame">
    	<ul class="seachform">
    	    <li><label>搜索</label><input class="scinput" name="userName" placeholder="请输入姓名"/></li>
            <li><input name="" type="submit" class="scbtn" value="搜索"/></li>
            	<li class="clickk"><a href="<%= basePath%>/sys/ManageAreaSecond_toManageAreaSecondAddPage.action?ufId=${userCode}"><span><img src="<%=path%>/images/t01.png" /></span> 添加</a></li>
            <li>
            	<font color="#00FF00">${res.t=='update'?"修改成功！":"" }</font>
            	<span id="delete"></span>
            </li>
        </ul>
        </form> 
    <table class="tablelist">
    	<thead>
	    	<tr>
		        <th>二级管辖域编号</th>
		        <th>名称</th>
		        <th>二级管辖员编号</th>
		        <th>一级管辖域名称</th>
		        <th>操作</th>
	        </tr>
        </thead>
        <tbody>
	        <s:iterator value="pageResult.data" id="id">
	        <tr>
		        <td>${asId}</td>
		        <td>${asName}</td>
		        <td>${usId}</td>
		        <td>${af.afName}</td>
		        <td>&nbsp;
	        		<a href="javascript:;" class="tablelinkdelete" idValue="${asId}">删除</a>&nbsp;&nbsp;
	        		<a href="<%=basePath%>/sys/ManageAreaSecond_toManageAreaSecondUpdatePage.action?asId=${asId}&&ufId=${userCode}" class="tablelink">修改</a>&nbsp;&nbsp;
	        		<a href="<%= basePath%>/sys/InstallPoint_findByPage2.action?asId=${asId}" class="tablelink">安装点管理</a>
		        </td>
	        </tr> 
	        </s:iterator>
        </tbody>
    </table>
  </div>  
</div>
    
    <!-- 分页菜单组件--------------------------开始 -->
<%
//查询的url地址，统一写
String listActionURL = basePath+"/sys/ManageAreaSecond_findByPage.action";
%>
 
    <script type="text/javascript">
//分页组件
function change(){
  	
 	var textfield=document.getElementById("textfield").value;
 	var totalPage=${pageResult.totalPage};
 	var pageNum = 0;
 	if(textfield <= totalPage ){
 		pageNum = textfield; 
 		window.location.href="<%=listActionURL%>?page="+pageNum;
 	}else{
 		pageNum = totalPage; 
 		alert("当前只有"+totalPage+"页");
 	}
  	
  }
</script>
<script type="text/javascript">
var url = "<%=basePath%>/sys/ManageAreaSecond_findByPage.action";                 //获取表单url
//首页
function first(){
	
   window.location.href  = url+"?page=1";
}
//上一页
function previous(){
    window.location.href  = url+"?page=${pageResult.previousPageNumber}";
}
//下一页
function next(){
    window.location.href  = url+"?page=${pageResult.nextPageNumber}";
}
//尾页
function last(){
  window.location.href  = url+"?page=${pageResult.totalPage}";
}
</script>
    <div class="pagin">
    	<div class="message">共<i class="blue">${pageResult.total}</i>条记录 	<i class="blue">${pageResult.totalPage}</i>页， 	当前显示第&nbsp;<i class="blue">${pageResult.page}</i>页</div>
        <ul class="paginList">
           <c:choose>
			   <c:when test="${pageResult.isFirst==true}"><li class="paginItem current"><a href="javascript:;">首页</a></li></c:when>
		       <c:otherwise>
			       <li class="paginItem"><a href="javascript:first()" target="rightFrame">首页&nbsp;</a></li>
		       </c:otherwise>
		   </c:choose>
           <c:choose>
		      <c:when test="${pageResult.isFirst==true}"><li class="paginItem current"><a href="javascript:;">上一页</a></li></c:when>
		      <c:otherwise>
			      <li class="paginItem"><a href="javascript:previous()" target="rightFrame">上一页&nbsp;</a></li>
		      </c:otherwise>
		   </c:choose>
           <c:choose>
			   <c:when test="${pageResult.hasNext==true}">
				   <li class="paginItem"><a href="javascript:next()" target="rightFrame">下一页&nbsp;</a></li>
			   </c:when>
		       <c:otherwise><li class="paginItem current"><a href="javascript:;">下一页</a></li></c:otherwise>
		   </c:choose>
           <c:choose>
			   <c:when test="${pageResult.isLast==true}"><li class="paginItem current"><a href="javascript:;">尾页</a></li></c:when>
		       <c:otherwise>
			       <li class="paginItem"><a href="javascript:last()" target="rightFrame">尾页&nbsp;</a></li>
		       </c:otherwise>
		   </c:choose>
        <li class="paginItem-page">
           跳转到：&nbsp;
           <input name="textfield" type="text" size="4" class="page-input" id="textfield" onkeyup="change()"/>&nbsp;页
        </li>
        </ul>
    </div>
<!-- 分页菜单组件--------------------------结束 -->
<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</div>
	  <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
        <span><img src="<%= basePath%>images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认删除信息 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    </div>
</body>
</html>

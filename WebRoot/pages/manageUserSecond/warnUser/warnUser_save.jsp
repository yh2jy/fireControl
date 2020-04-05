<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加报警联系人信息</title>
<link href="<%=path %>/css/select.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
 <script type="text/javascript" src="<%=path %>/js/common.js"></script> 
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">二级管辖员</a></li>
    <li><a href="#">安装点管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>用户基本信息</span></div>
    <form method="post" id="fm" >
	    <ul class="forminfo">
	    	<!-- <li>
		    	<label>报警联系人工号：</label>
			    <input name="userId" id="userId" type="text" required class="dfinput"/>
			    <i><font color="#FF0000">*必填</font><font id="insCode1">输入提示</font></i>
		    </li> -->
		    <li>
		    	<label>姓名：</label>
			    <input name="userName" id="userName" type="text" required class="dfinput"/>
			    <i><font color="#FF0000">*必填</font><font id="userName1">2-8个字符组成</font></i>
		    </li>
		    <li>
		    	<label>用户名：</label>
			    <input name="loginName" id="loginName" type="text" required class="dfinput" />
			    <i><font color="#FF0000">*必填</font><forn id="loginName1">2-8个字符组成</forn></i>
		    </li>
		    <li>
		    	<label>密码：</label>
			    <input name="loginPwd" id="loginPwd" type="text" required class="dfinput" />
			    <i><font color="#FF0000">*必填</font><forn id="loginPwd1">4-16个字符或数字组成</forn></i>
		    </li>
		    <li>
		    	<label>电话：</label>
			    <input name="userPhone" id="userPhone" type="text" required class="dfinput" />
			    <i><font color="#FF0000">*必填</font><forn id="userPhone1">11个数字组成</forn></i>
		    </li>
		    <li>
		    	<label>安装点：</label>
		    	<select class="dfinput" name="point.insId">
	    	        <c:forEach items="${installPoint}" var="i">
	    	             <option value="${i.insId}">${i.insName}</option>
	    	        </c:forEach>
    	    	</select>
		    </li>
		    
		    <li><label>&nbsp;</label>
		    	<input id="btn" type="button" value="确认" class="btn">
		    	<input class="btn" type="button" value="返回" onclick="window.location.href='<%= basePath%>/sys/WarnUser_findByPage.action'">
		    </li>
	    </ul>
    </form>
    </div>
    <script>
	//表单提交
	$("#btn").click(function(e){
		var userName = $("#userName").val(),
			loginName = $("#loginName").val(),
			loginPwd = $("#loginPwd").val(),
			userPhone = $("#userPhone").val();
		if(userName.length<2 || userName.length>8){
			$("#userName1").css("color", "red");
			return false;
		}else{
			$("#userName1").removeAttr("style");
		}
		if(loginName.length<2 || loginName.length>8){
			$("#loginName1").css("color", "red");
			return false;
		}else{
			$("#loginName1").removeAttr("style");
		}
		if(loginPwd.length<4 || loginPwd.length>16){
			$("#loginPwd1").css("color", "red");
			return false;
		}else{
			$("#loginPwd1").removeAttr("style");
		}
		if(isNaN(Number(userPhone)) || userPhone.length != 11){	//如果不为数字
			$("#userPhone1").css("color", "red");
			return false;
		}else{
			$("#userPhone1").removeAttr("style");
		}
		var params = $("#fm").serialize();
		$.post("<%=basePath%>/sys/warnUser_save.action", params, function(data){
			if(data.targ == true){
				window.location.href = "<%=basePath%>/sys/WarnUser_findByPage.action?targ='save'";
			}else{
				$("#loginName1").css("color", "red").text("该名称已存在！");
			}
		});
	});
</script>
    
</body>
</html>

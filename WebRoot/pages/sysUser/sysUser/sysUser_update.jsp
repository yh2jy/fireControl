<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑人员信息</title>
	<link href="<%=path %>/css/select.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">系统管理员</a></li>
    <li><a href="#">人员信息管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>用户基本信息</span></div>
    
    <form method="post" id="fm">
    
	    <ul class="forminfo">
		    <li>
		    	<label>编号：</label>
			    <input name="userId" id="userId" type="text" value="${user.userId }" readonly required class="dfinput"/>
		    </li>
		    <li>
		    	<label>工号：</label>
			    <input name="userCode" id="userCode" type="text" value="${user.userCode }" readonly required class="dfinput"/>
		    </li>
		    <li>
		    	<label>姓名：</label>
			    <input name="userName" id="userName" type="text" value="${user.userName }" required class="dfinput"/>
			    <i><font id="userName1">2-5个字符组成</font></i>
		    </li>
		    <li>
		    	<label>用户名：</label>
			    <input name="loginName" id="loginName" type="text" value="${user.loginName }" required class="dfinput"/>
			    <i><font id="loginName1">4-16位字母、数字或下滑线组成</font></i>
		    </li>
		    <li>
		    	<label>密码：</label>
			    <input name="loginPwd" id="loginPwd" type="text" value="${user.loginPwd }" required class="dfinput" />
			    <i><forn id="loginPwd1">6-16位字母、数字或下滑线组成</forn></i>
		    </li>
		    <li>
		    	<label>电话：</label>
			    <input name="userPhone" id="userPhone" type="text" value="${user.userPhone }" required class="dfinput" />
			    <i><forn id="userPhone1">11位数字组成</forn></i>
		    </li>
		    <li>
		    	<label>用户类型：</label>
		    	<input type="radio" value="1" name="userType" checked/> 系统管理员&nbsp;&nbsp;
		    	<input type="radio" value="2" name="userType"/> 设备安装员&nbsp;&nbsp;
		    	<input type="radio" value="3" name="userType"/> 单位管理员&nbsp;&nbsp;<br/><br/>
		    	<input type="radio" value="4" name="userType"/> 一级管辖员&nbsp;&nbsp;
		    	<input type="radio" value="5" name="userType"/> 二级管辖员&nbsp;&nbsp;
		    	<input type="radio" value="6" name="userType"/> 报警联系人&nbsp;&nbsp;
		    </li>
		    
		    <li><label>&nbsp;</label>
		    	<!-- <input id="btn" type="button" value="确认" class="btn"> -->
		    	<input class="btn" type="button" value="返回" onclick="window.location.href='<%= basePath%>/sys/SysUser_findByPage.action'">
		    </li>
	    </ul>
    </form>
    </div>
    <script>
    	$("#btn").click(function(){
    		var userName = $("#userName").val(),
			loginName = $("#loginName").val(),
			loginPwd = $("#loginPwd").val(),
			userPhone = $("#userPhone").val();
			if(userName.length<2 || userName.length>5){
				$("#userName1").css("color", "red").css("font-size", "15px");
				return false;
			}else{
				$("#userName1").removeAttr("style");
			}
			if(loginName.length<4 || loginName.length>16){
				$("#loginName1").css("color", "red").css("font-size", "15px");
				return false;
			}else{
				$("#loginName1").removeAttr("style");
			}
			if(loginPwd.length<6 || loginPwd.length>16){
				$("#loginPwd1").css("color", "red").css("font-size", "15px");
				return false;
			}else{
				$("#loginPwd1").removeAttr("style");
			}
			if(isNaN(Number(userPhone)) || userPhone.length != 11){	//如果不为数字
				$("#userPhone1").css("color", "red").css("font-size", "15px");
				return false;
			}else{
				$("#userPhone1").removeAttr("style");
			}
    		$.post("<%=basePath%>/sys/sysUser_update.action", $("#fm").serialize(), function(data){
    			if(data.targ == true){
    				window.location.href = "<%=basePath%>/sys/SysUser_findByPage.action?t=update";
    			}else{
    				$("#loginName1").css("color", "red").text("该用户名不存在！");
    			}
    		});
    	});
    </script>
</body>
</html>
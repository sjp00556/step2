<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新书籍信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="css/common.css" rel="stylesheet" media="screen">

  </head>
  
  <body>
	<div class="wrapper" id="body">

		<div class="logo">
			<img src="img/logo.png" width="270" height="129">
		</div>
		<div class="nav-top">
			<a href="">网站首页</a> 
		</div>
		<div class="search">
			<div class="s-wrap">
				<form action="search">
					<input type="text" class="s-t" name="author" class="s-t"
						maxlength="100" autocomplete="off"
						style="font-family: 'Microsoft Yahei', STHeiti;"> <span
						class="btn_wr s_btn_wr bg" id="s_btn_wr"><input
						type="submit" value="搜索作者" id="su" class="btn self-btn bg s_btn"></span>
				</form>
			</div>
		</div>
		<div style="margin: 12px 0 15px 0;height: 20px;"></div>
  <h1>更新书籍信息</h1>
  <form action="update" method="post" style="text-align:left;width: 300px;margin: 0 auto;">
  <input type="hidden" name="book.id" value="<s:property value="book.id"/>" />
  	<div class="item">书&nbsp;&nbsp;&nbsp;&nbsp;名:&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="book.name"/>
  	</div>
  	  	<div class="item" >简&nbsp;&nbsp;&nbsp;&nbsp;介:&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="book.description"/>
  	</div>
  	  	<div class="item">作&nbsp;&nbsp;&nbsp;&nbsp;者:<select name="book.aid">
  	<s:iterator value="aus" var="c">
							<option value=<s:property value="#c.aid"/>><s:property value="#c.author"/></option>
		</s:iterator></select>
  	</div>


  	<div class="item">出版日:<input name="book.pubtime" class="input"  value="<s:property value="book.pubtime"/>"/>
  	</div>
  	<div class="item">出版社:<input name="book.whopub" class="input"  value="<s:property value="book.whopub"/>"/>
  	</div>
  	<div class="item">售&nbsp;&nbsp;&nbsp;&nbsp;价:&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="book.price"/>
  	</div>
  	<input type="submit" class="submit" value="更新书籍" /> 
  </form>
</div>

  </body>
</html>

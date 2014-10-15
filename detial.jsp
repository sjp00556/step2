<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>书籍详细信息eeeeee</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="css/common.css" rel="stylesheet" media="screen">

</head>
fffffffffff
<body>
	<div class="wrapper" id="body">

		<div class="logo">
			<img src="img/logo.png" width="270" height="129">
		</div>
		<div class="nav-top">
			<a href="">网站首页</a> <a style="cursor: pointer;" title="添加书籍"
				onclick="showdiv();">添加书籍</a> <a style="cursor: pointer;"
				title="添加作者" onclick="showdiv2();">添加作者</a>
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

		<h1>书籍详细信息</h1>
		<div class="item2">
			书&nbsp;&nbsp;&nbsp;&nbsp;名:&nbsp;&nbsp;&nbsp;&nbsp;
			<s:property value="book.name" />
		</div>

		<div class="item2">
			简&nbsp;&nbsp;&nbsp;&nbsp;介:&nbsp;&nbsp;&nbsp;&nbsp;
			<s:property value="book.description" />
		</div>
		<div class="item2">
			出版日:&nbsp;&nbsp;&nbsp;&nbsp;
			<s:property value="book.pubtime" />
		</div>
		<div class="item2">
			出版社:&nbsp;&nbsp;&nbsp;&nbsp;
			<s:property value="book.whopub" />
		</div>
		<div class="item2">
			售&nbsp;&nbsp;&nbsp;&nbsp;价:&nbsp;&nbsp;&nbsp;&nbsp;
			<s:property value="book.price" />
		</div>
		<div style="margin: 12px 0 15px 0;height: 20px;"></div>

		<h1>作者资料</h1>
		<div class="item2">
			作&nbsp;&nbsp;&nbsp;&nbsp;者:&nbsp;&nbsp;&nbsp;&nbsp;
			<s:property value="book.author" />
		</div>
		<div class="item2">
			年&nbsp;&nbsp;&nbsp;&nbsp;龄:&nbsp;&nbsp;&nbsp;&nbsp;
			<s:property value="book.age" />
		</div>
		<div class="item2">
			国&nbsp;&nbsp;&nbsp;&nbsp;籍:&nbsp;&nbsp;&nbsp;&nbsp;
			<s:property value="book.country" />
		</div>
	</div>


	<div class="clear"></div>
	<div id="xxshow" class="add">
		<a style="cursor: pointer;" title="添加书籍" onclick="hidediv();"
			class="r">关闭x</a>
		<div class="clean"></div>
		<h1>添加新书</h1>
		<form action="add" method="post" style="text-align:left;">
			<div class="item">
				书&nbsp;&nbsp;&nbsp;&nbsp;名:<input name="book.name" class="input" />
			</div>
			<div class="item">
				作&nbsp;&nbsp;&nbsp;&nbsp;者: <select name="book.aid">
					<s:iterator value="aus" var="c">
						<option value=<s:property value="#c.aid"/>><s:property
								value="#c.author" /></option>
					</s:iterator>
				</select>
			</div>
			<div class="item">
				简&nbsp;&nbsp;&nbsp;&nbsp;介:
				<textarea name="book.description" class="input"
					style="height:80px;margin-left:57px;width:300px;"></textarea>
			</div>
			<div class="item">
				出版日:<input name="book.pubtime" class="input" />
			</div>
			<div class="item">
				出版社:<input name="book.whopub" class="input" />
			</div>
			<div class="item">
				售&nbsp;&nbsp;&nbsp;&nbsp;价:<input name="book.price" class="input" />
			</div>
			<input type="submit" class="submit" value="发布书籍" />
		</form>
	</div>
	<div id="xxshow2" class="add">
		<a style="cursor: pointer;" title="添加作者" onclick="hidediv2();"
			class="r">关闭x</a>
		<div class="clean"></div>

		<h1>添加作者</h1>
		<form action="addau" method="post" style="text-align:left;">
			<div class="item">
				姓&nbsp;&nbsp;&nbsp;&nbsp;名:<input name="book.author" class="input" />
			</div>
			<div class="item">
				年&nbsp;&nbsp;&nbsp;&nbsp;龄:<input name="book.age" class="input" />
			</div>
			<div class="item">
				国&nbsp;&nbsp;&nbsp;&nbsp;籍:<input name="book.country" class="input" />
			</div>
			<input type="submit" class="submit" value="添加作者" />
		</form>
	</div>
	<div class="clear"></div>
	<div class="bottom">©2014 Shuku 1120310211 孙佳朋</div>
	<script>
		//弹出框
		function showdiv() {
			document.getElementById("xxshow").style.display = "block";
			document.getElementById("body").style.opacity = "0.2";
		}
		function hidediv() {
			document.getElementById("xxshow").style.display = "none";
			document.getElementById("body").style.opacity = "1.0";
		}
	</script>
	<script>
		//弹出框
		function showdiv2() {
			document.getElementById("xxshow2").style.display = "block";
			document.getElementById("body").style.opacity = "0.2";
		}
		function hidediv2() {
			document.getElementById("xxshow2").style.display = "none";
			document.getElementById("body").style.opacity = "1.0";
		}
	</script>
</body>
</html>

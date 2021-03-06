<%@page import="net.ihypo.work.Work"%>
<%@page import="java.util.Iterator"%>
<%@page import="net.ihypo.work.WorkGroup"%>
<%@page import="net.ihypo.user.User"%>
<%@page import="net.ihypo.db.DbDriver" %>
<%@ page import ="net.ihypo.count.WorkNumFromSQL" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	User user = (User)session.getAttribute("user");
	if(user == null){
%>
<script type="text/javascript">
<!--
	window.location="../login/index.jsp";
	alert("请登录");
//-->
</script>
<%}else{%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>个人中心 - SpongeTime，你的时间管家</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../js/html5shiv.min.js"></script>
      <script src="../js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="../person/index.jsp">SpongeTime 个人中心</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">通知</a></li>
            <li><a href="#">设置</a></li>
            <li><a href="#">帮助</a></li>
            <li><a href="../login/logout.jsp">注销</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="查找...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="../person/index.jsp">概观</span></a></li>
            <li class="active"><a href="index.jsp">任务进度<span class="sr-only">(current)</a></li>
            <li><a href="#">时间线</a></li>
            <li><a href="#">计划月历</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="../person/work/addwork.jsp">添加事件</a></li>
            <li><a href="../person/work/manage.jsp">管理事件</a></li>
            <li><a href="../person/task/addtask.jsp">添加事件组</a></li>
            <li><a href="../person/task/manage.jsp">管理事件组</a></li>
            <li><a href="">计划规划</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="../team/index.jsp">创建团队</a></li>
            <li><a href="../team/joinTeam.jsp">加入团队</a></li>
            <li><a href="">团队计划</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">任务进度</h1>
			<div class="panel panel-default">
  				<div class="panel-body">
  				<h4>所有事件完成进度</h4>
			<div class="progress">
			<%
				int allWork = (int) (new WorkNumFromSQL().getRate(user.getId()) * 100.0);
			%>
			  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: <%=allWork%>%">
			    <span class="sr-only">100% Complete</span>
			   <%=allWork%>%
			  </div>
			</div>
			  </div>
		</div>
		<div class="well">
			<h4 class="page-header">事件组完成进度</h4>
		</div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../js/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
<%}%>
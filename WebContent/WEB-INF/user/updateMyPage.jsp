<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Danceple - Template</title>

<!-- Bootstrap Core CSS -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../resources/css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

</head>
<body>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index.jsp">Danceple</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
						</li>
						<li><a href="#"><i class="fa fa-fw fa-envelope"></i>
								Inbox</a></li>
						<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="#"><i class="fa fa-fw fa-power-off"></i> Log
								Out</a></li>
					</ul></li>
			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="../info/menu"><i class="fa fa-fw fa-edit"></i> Info Page(도영)</a>
                    </li>
                    <li>
                        <a href="../manage/menu"><i class="fa fa-fw fa-edit"></i> Manage Page(주연)</a>
                        <ul id="team" class="collapse in" aria-expanded="true">
							<li><a href="../manage/menu#team">팀 관리</a></li>
							<li><a href="../manage/menu#grere">장르 관리</a></li>
							<li><a href="../manage/menu#grade">등급 관리</a></li>
						</ul>
                    </li>
                    <li class="active">
                        <a href="insertApply"><i class="fa fa-fw fa-edit"></i> Apply Page(현정)</a>
                    </li>
                    <li>
                        <a href="../member/menu"><i class="fa fa-fw fa-edit"></i> Member Page(민철)</a>
                        <ul id="team" class="collapse in" aria-expanded="true">
							<li><a href="../member/login">로그인</a></li>
							<li><a href="../member/memberInsert">회원가입</a></li>
						</ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="glyphicon glyphicon-check"></i> My Page
						</h3>
					</div>
				</div>
				<!-- /.row -->
				<div class="panel-body">
				<h1>업데이트 페이지 입니다.</h1>
				</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->

		<!-- jQuery -->
		<script src="../js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="../js/bootstrap.min.js"></script>

		<!-- Morris Charts JavaScript -->
		<script src="../js/plugins/morris/raphael.min.js"></script>
		<script src="../js/plugins/morris/morris.min.js"></script>
		<script src="../js/plugins/morris/morris-data.js"></script>
</body>
</html>
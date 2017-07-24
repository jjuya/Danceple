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

<link rel="shortcut icon" href="../favicon.ico" />

	<!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<c:url value="/resources/css/plugins/morris.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    
    <!-- jQuery -->
    <script src="<c:url value="/resources/js/jquery.js" />"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

	<!-- Morris Charts JavaScript -->
	<script src="<c:url value="/resources/js//plugins/morris/raphael.min.js" />"></script>
	<script src="<c:url value="/resources/js//plugins/morris/morris.min.js" />"></script>
	<script src="<c:url value="/resources/js//plugins/morris/morris-data.js"/>"></script>

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
                        <a href="<c:url value="/info/adminInfo" />"><i class="fa fa-fw fa-edit"></i> 신청 현황</a>
                    </li>
                    <li>
                        <a href="<c:url value="/admin/basic" />"><i class="fa fa-fw fa-edit"></i> 일반 관리</a>
                        <ul class="collapse in" aria-expanded="true">
							<li><a href="<c:url value="/admin/basic#team" />">팀 관리</a></li>
							<li><a href="<c:url value="/admin/basic#genre" />">장르 관리</a></li>
						</ul>
					</li>
					<li class="active">
                        <a href="<c:url value="/admin/season" />"><i class="fa fa-fw fa-edit"></i> 시즌 관리</a>
                        <ul class="collapse in" aria-expanded="true">
							<li><a href="<c:url value="/admin/season#season" />">시즌 관리</a></li>
							<li class="active"><a href="<c:url value="/admin/season#project" />">프로젝트 관리</a></li>
							<li><a href="<c:url value="/admin/duesCheck" />">회비 관리</a></li>
							
						</ul>
					</li>
					<li>
                        <a href="<c:url value="/admin/user" />"><i class="fa fa-fw fa-edit"></i> 회원 관리</a>
                        <ul class="collapse in" aria-expanded="true">
							<li><a href="<c:url value="/admin/user#user" />">회원 관리</a></li>
							<li><a href="<c:url value="/admin/user#grade" />">등급 관리</a></li>
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
                           프로젝트 수정 페이지
                        </h3>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                	<div class="col-lg-7">
						<form action="projectUpdateAction" method="post">
						
							<div class="form-group">
								<div class="col-lg-2">
                                	<label> 프로젝트 번호 </label>
                                </div>
                                <div class="col-lg-10">
                                	<p class="navbar-text">${projectVO.projectNo}</p>
                                	<input type="hidden" id="projectNo" name="projectNo" class="form-control" value="${projectVO.projectNo}" />
                                </div>
                            </div>
						
							<div class="form-group">
								<div class="col-md-2">
									<label> 프로젝트 명 </label>
								</div>
								<div class="col-md-10">
									<input type="text" id="projectTitle" name="projectTitle" class="form-control" value="${projectVO.projectTitle}" />
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-md-2">
									<label> 날짜 </label>
								</div>
								<div class="col-md-10">
									<fmt:parseDate value="${projectVO.projectDate}" var="projectDate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<input type="text" id="projectDate" name="projectDate" class="form-control" value="<fmt:formatDate value="${projectDate}" pattern="yyyy/MM/dd"/>"/>
									<p class="help-block">YYYY/MM/DD 형식으로 입력해 주세요.</p>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-md-2">
									<label> 설명 </label>
								</div>
								<div class="col-md-10">
									<input type="text" id="projectDesc" name="projectDesc" class="form-control" value="${projectVO.projectDesc}" />
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-md-2">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
						</form>

					</div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>

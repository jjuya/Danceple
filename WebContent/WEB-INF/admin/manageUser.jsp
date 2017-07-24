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
			<!-- ì¼ìª½ ì Danceple-->
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
					<li>
                        <a href="<c:url value="/admin/season" />"><i class="fa fa-fw fa-edit"></i> 시즌 관리</a>
                        <ul class="collapse in" aria-expanded="true">
							<li><a href="<c:url value="/admin/season#season" />">시즌 관리</a></li>
							<li><a href="<c:url value="/admin/season#project" />">프로젝트 관리</a></li>
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

				<!-- Team Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							관리 목록 <small>전체 목록입니다.</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				
				<section id="user">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="glyphicon glyphicon-list"></i> 회원 목록
									</h3>
								</div>
								
								<div class="panel-body">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>아이디</th>
												<th>이름</th>
												<th>나이</th>
												<th>성별</th>
												<th>연락처</th>
												<th>이메일</th>
												<th>패널티</th>
												<th>등급</th>
											</tr>
										</thead>
	
										<tbody>
											<c:forEach items="${userList}" var="user">
												<tr>
													<td>${user.userId}</td>
													<td>${user.userName}</td>
													<td>
														${user.age}
													</td>
													<td>${user.gender}</td>
													<td>${user.phone}</td>
													<td>${user.email}</td>
													<td>${user.penalty}</td>
													<td>
														<select id="gradeId" name="gradeId" class="form-control">
															<c:forEach items="${gradeList}" var="grade">
																<c:when test="${user.gradeId == grade.gradeId}">
																	<option value="${grade.gradeId}" selected="selected">${grade.gradeName}</option>
																</c:when>
																<c:otherwise>
																	<option value="${grade.gradeId}">${grade.gradeName}</option>
																</c:otherwise>
															</c:forEach>
														</select>
													</td>
													<td>
														<a href="userGradeUpdate?userId=${user.userId}" class="btn btn-outline-primary">수정</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</section>
				
				<section id="grade">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="glyphicon glyphicon-list"></i> 등급 목록
										<a href="gradeInsert" class="btn btn-primary">추가</a>
									</h3>
								</div>
								<div class="panel-body">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>등급 아이디</th>
												<th>등급 이름</th>
											</tr>
										</thead>
			
										<tbody>
											<c:forEach items="${gradeList}" var="grade">
												<tr>
													<td>${grade.gradeId}</td>
													<td>${grade.gradeName}</td>
													<td>
													<a href="gradeUpdate?gradeId=${grade.gradeId}" class="btn btn-outline-primary">수정</a>
													<a href="gradeDelete?gradeId=${grade.gradeId}" class="btn btn-mini btn-danger">삭제</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</section>
				

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>

</html>

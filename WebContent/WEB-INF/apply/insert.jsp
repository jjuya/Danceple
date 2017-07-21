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

<script type="text/javascript">
	function changepage(page) {
	    location.href="insertApply?page="+page;
	}
	</script>

<title>Danceple - Template</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
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
							<i class="glyphicon glyphicon-check"></i> 시즌 신청
						</h3>
					</div>
				</div>
				<!-- /.row -->

				<!-- session check -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<c:if test="${empty user}">
									<h3>세션 확인 폼</h3>
									세션 확인 테스트 끝나면 사라질 폼
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<!-- apply form -->
				<div class="row">
					<div class="col-lg-7">
						<form action="insertApplyAction">

							<div class="form-group">
								<div class="col-lg-2">
									<label>팀 명</label>
								</div>

								<div class="col-lg-10">
									<select id="teamId" name="teamId" class="form-control">
										<c:forEach items="${teamlist}" var="team">
											<c:choose>
												<c:when test="${team.teamId == page}">
													<option value="${team.teamId}" selected="selected">${team.teamName}
														| ${team.teamDay} | ${team.location} | ${team.mainTime}</option>
												</c:when>
												<c:otherwise>
													<option value="${team.teamId}">${team.teamName}|
														${team.teamDay} | ${team.location} | ${team.mainTime}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>

								<div class="col-lg-12">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>팀 아이디</th>
												<th>팀 이름</th>
												<th>팀 날짜</th>
												<th>위치</th>
												<th>정규 시간</th>
												<th>준비 시간</th>
												<th>팀 소개</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>${teamList.teamId}</td>
												<td>${teamList.teamName}</td>
												<td>${teamList.teamDay}</td>
												<td>${teamList.location}</td>
												<td>${teamList.mainTime}</td>
												<td>${teamList.preTime}</td>
												<td>${teamList.teamUrl}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-2">
									<label>추 가</label>
								</div>
								<div class="col-lg-10">
									<input type="text" name="others" class="form-control" />
									<p class="help-block">콤마(,)로 구분하여 작성하여 주시길 바랍니다.</p>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-2">
									<label>1지망</label>
								</div>
								<div class="col-lg-10">
									<select name="genrelist1" id="genrelist1" class="form-control">
										<c:forEach var="genre" items="${genrelist}">
											<option value="${genre.genreId}" selected="selected">${genre.genreName}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-2">
									<label>2지망</label>
								</div>
								<div class="col-lg-10">
									<select name="genrelist2" id="genrelist2" class="form-control">
										<c:forEach var="genre" items="${genrelist}">
											<option value="${genre.genreId}" selected="selected">${genre.genreName}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-2">
									<label>3지망</label>
								</div>
								<div class="col-lg-10">
									<select name="genrelist3" id="genrelist3" class="form-control">
										<c:forEach var="genre" items="${genrelist}">
											<option value="${genre.genreId}" selected="selected">${genre.genreName}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-2">
									<input type="submit" value="완료" class="btn btn-primary" />
								</div>
							</div>
						</form>
					</div>
				</div>

					<!--				
	<form action="insertApplyAction">
		<div class="applyform">
			<label> <select id="teamlists" onchange="changepage(value)">
					<option>팀명</option>
					<c:forEach var="team" items="${teamlist}">
						<c:choose>
							<c:when test="${team.teamId == page}">
								<option value="${team.teamId}" selected="selected">${team.teamName}</option>
							</c:when>
							<c:otherwise>
								<option value="${team.teamId}">${team.teamName}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</select>

				<td>추가</td>
				<td><input type="text" name="others" /></td>
				<td>콤마(,)로 구분하여 작성하여 주시길 바랍니다.</td>
			</label>
		</div>
		<div>

			<p>장르</p>

			<p>
				1지망 
				<select id="genrelist">
					<c:forEach var="genre" items="${genrelist}">
						<option value="${genre.genreId}" selected="selected">${genre.genreName}</option>
					</c:forEach>
				</select>
			</p>

			<p>
				2지망 
				<select id="genrelist">
					<c:forEach var="genre" items="${genrelist}">
						<option value="${genre.genreId}" selected="selected">${genre.genreName}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				3지망
				<select id="genrelist">
					<c:forEach var="genre" items="${genrelist}">
						<option value="${genre.genreId}" selected="selected">${genre.genreName}</option>
					</c:forEach>
				</select>
			</p>
    </div>
	<div id="clear">
		<label> <input type="submit" value="완료" />
		</label>
	</div>
</form>
-->
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
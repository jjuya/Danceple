<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Danceple - Template</title>

<!-- Bootstrap core CSS -->
<link href="${context}/resources/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="${context}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${context}/resources/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="${context}/resources/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"
	href="${context}/resources/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="${context}/resources/css/style.css" rel="stylesheet">
<link href="${context}/resources/css/style-responsive.css"
	rel="stylesheet">

</head>

<body>
	<section id="container">
		<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
		<!--header start-->

		<header class="header black-bg">
			<div class="sidebar-toggle-box">
				<div class="fa fa-bars tooltips" data-placement="right"
					data-original-title="Toggle Navigation"></div>
			</div>
			<!--logo start-->
			<a href="${context}/index.jsp" class="logo"><b>DANCEPEL</b></a>
			<!--logo end-->

			<div class="top-menu">
				<ul class="nav pull-right top-menu">
					<li><a class="logout" href="${context}/logout">Logout</a></li>
				</ul>
			</div>
		</header>

		<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu" id="nav-accordion">

					<p class="centered">
						<a href="${context}/member/confirmUser"><img
							src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a>
					</p>
					<h5 class="centered">Marcel Newman</h5>

					<li class="mt"><a href="${context}/info/userInfo"> <i
							class="fa fa-desktop"></i> <span>신청현황</span>
					</a></li>

					<li class="mt"><a href="${context}/apply/insertApply"> <i
							class="fa fa-desktop"></i> <span>신청</span>
					</a></li>

					<li class="mt"><a href="${context}/member/confirmUser"> <i
							class="fa fa-desktop"></i> <span>마이페이지</span>
					</a></li>

				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
	</section>
	<section id="main-content">
		<section class="wrapper">
			<h3>
				<i class="fa fa-angle-right"></i> 신청
			</h3>
			<div class="row mt">
				<div class="col-lg-12">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> Apply insert
						</h4>
						<form action="Applied" method="post"
							class="form-horizontal style-form">
							
							<div class="form-group">
								<label class="col-lg-2 col-sm-2 control-label">신청인 아이디</label>

								<div class="col-sm-10">
									${userVO.userId}
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-lg-2 col-sm-2 control-label">신청인</label>

								<div class="col-sm-10">
									${userVO.userName}
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-lg-2 col-sm-2 control-label">핸드폰 번호</label>

								<div class="col-sm-10">
									${userVO.phone}
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-lg-2 col-sm-2 control-label">팀 명</label>

								<div class="col-sm-10">
									${teamVO.teamName}
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-2 col-sm-2 control-label">추 가</label>

								<div class="col-sm-10">
									${temaOther}
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-2 col-sm-2 control-label">1지망</label>

								<div class="col-sm-10">
									${genreVO1.genreName}
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-2 col-sm-2 control-label">2지망</label>

								<div class="col-sm-10">
									${genreVO2.genreName}
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-2 col-sm-2 control-label">3지망</label>

								<div class="col-sm-10">
									${genreVO3.genreName}
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-2">
									<input type="submit" value="완료" class="btn btn-primary" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="${context}/resources/js/jquery.js"></script>
	<script src="${context}/resources/js/jquery-3.2.1.js"></script>
	<script src="${context}/resources/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="${context}/resources/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="${context}/resources/js/jquery.scrollTo.min.js"></script>
	<script src="${context}/resources/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script src="${context}/resources/js/jquery.sparkline.js"></script>

	<!--common script for all pages-->
	<script src="${context}/resources/js/common-scripts.js"></script>

	<script type="text/javascript"
		src="${context}/resources/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript"
		src="${context}/resources/js/gritter-conf.js"></script>

</body>

</html>


<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="glyphicon glyphicon-check"></i> 시즌 신청 확인
				</h3>
			</div>
		</div>
		<!-- /.row -->

		<!-- apply form -->
		<div class="row">
			<div class="col-lg-7">
				<form action="applied"></form>
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
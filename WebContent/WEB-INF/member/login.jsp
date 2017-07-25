<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인</title>

	<!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/full-width-pics.css" />" rel="stylesheet">

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
	<!-- Full Width Image Header Blank -->
	<!-- Image backgrounds are set within the full-width-pics.css file. -->
	<header class="image-bg-fluid-height">
		<aside class="image-bg-fixed-height"></aside>
	</header>

	<!-- Content Section -->
	<section>
		<div class="container">
			<div class="wrapper">
				<div class="row">
					<div class="col-lg-6">
						<form action="testLogin.jsp" method="post" name="frm" class="form-signin">
							<div class="col-lg-12">
								<input type="text" name="user_id" id="user_id" value="${userid}" class="form-control" placeholder="ID" required="required" autofocus="autofocus" />
							</div>
							<div class="col-lg-12">
								<input type="password" name="user_pw" id="user_pw" class="form-control"	placeholder="Password" required="required" /> 
							</div>
							<div class="col-lg-12">
								<label class="checkbox">
									<input type="checkbox" name="save_id" > 아이디 기억
								</label>
							</div>
							<div class="col-lg-12">
								<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-7">
									<p class="help-block">아이디/비밀번호를 잃어버리셨습니까?</p>
								</div>
								<div class="col-lg-5">
									<input type="button" value="아이디/비밀번호 찾기" onclick="" class="btn btn-sm btn-secondary btn-block">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-7">
									<p class="help-block">아직 회원이 아니시라면 가입하세요.</p>
								</div>
								<div class="col-lg-5">
									<input type="button" value="회원가입" onclick="location.href='memberInsert'" class="btn btn-sm btn-secondary btn-block">
								</div>
								
							</div>
							
							<div class="col-lg-12">
								${message}
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>

</html>

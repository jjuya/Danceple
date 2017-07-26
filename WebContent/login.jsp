<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="${context}/resources/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="${context}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="${context}/resources/css/style.css" rel="stylesheet">
    <link href="${context}/resources/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div id="login-page">
	  	<div class="container">
	  		<div class="login-container">
	  		<c:if test="${sessionScope.loginUser == null}">
		      <form action="loginAction" method="post" name="frm" class="form-login">
		        <h2 class="form-login-heading">sign in now</h2>
		        <div class="login-wrap">
		            <input type="text" name="userId" id="userId" value="${userid}" class="form-control" placeholder="User ID" required="required" autofocus="autofocus" />
		            <br>
		            <input type="password" name="userPwd" id="userPwd" class="form-control" placeholder="Password" required="required">
		            
		            <label class="checkbox">
		                <span class="pull-right">
		                    <input type="checkbox" name="save_id" > Remember ID
		                </span>
		            </label>
		            
		            <button class="btn btn-custom btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
		            <hr>
		            
		             <div class="form-group">
		                ID/비밀번호가 기억 안날 때,
		                <span class="pull-right">
		               		<a class="btn btn-custom btn-xs" href="#'">
		                    	ID/비밀번호 찾기
		                	</a>
		                </span>
		            </div>
		            <div class="form-group">
		                
		                아직 회원이 아니시라면,
		                <span class="pull-right">
		               		<a class="btn btn-custom btn-xs" href="memberInsert">
		                    	회원가입
		                	</a>
		                </span>
		            </div>
		
		        </div>
		
		          <!-- Modal -->
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Forgot Password ?</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p>Enter your e-mail address below to reset your password.</p>
		                          <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
		                          <button class="btn btn-theme" type="button">Submit</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
		
		      </form>	  	
	  		</c:if>
	  		</div>
	  	</div>
	  </div>

	 <!-- js placed at the end of the document so the pages load faster -->
    <script src="${context}/resources/js/jquery.js"></script>
    <script src="${context}/resources/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="${context}/resources/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("${context}/resources/img/login/main.jpg", {speed: 500});
    </script>

</body>

</html>

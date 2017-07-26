<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <link href="${context}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="${context}/resources/css/style.css" rel="stylesheet">
    <link href="${context}/resources/css/style-responsive.css" rel="stylesheet">

<script  type="text/javascript">
 // 아이디 검색창 띄우기
function winOpen(){
	$(document).ready(function(){
		var idchecked = -1;	// -1:확인요망, 1:id존재함, 0:사용가능
		
		$('#memberId').change(function(){	// 아이디 중복 체크 메시지
			idcheck = -1;
			$('#check_id_result').html('아이디 중복체크를 하세요');
		});
		
		$('#check_id').click(function(){	// 아이디 중복 체크 처리
			var memberId = $('#memberId').val().trim();
		
			if (memberId === '') {
				alert('체크할 아이디를 입력하세요');
				$('#user_id').focus();
				return;
			}
			
			$.getJSON('checkID',{"memberId":memberId},
				function(data){
					console.log(data);
					console.log('id  : ' + data.id);
					console.log('cnt : ' + data.cnt);
					console.log('msg : ' + data.msg);
					$('#check_id_result').html(data.msg);
					idchecked = 0;
				}		
			);
		});
		
		$('#regist_form').bind('submit',function(){	// 회원가입 완료 처리
			if ($('#memberId').val().length === 0) {
				alert('가입할 아이디를 입력하세요');
				$('#user_id').focus();
				return false;
			}
			//idchecked = 0 인지 확인
			//이름, 비밀번호 비어있는지 확인...
			$('#regist_form').attr('action', 'registAction')
			                 .attr('method', 'POST');
			$('#regist_form').submit();	
		});
	});
 }
  </script>


<script language="javascript">
 function memChk() // 데이터 입력유무 확인 스크립트
{
   var f = document.frm;
   f.phone.value = f.memMobile01.value + f.memMobile02.value + f.memMobile03.value;
   
   if(f.memberId.value == "")
   {
    alert("아이디를 입력하세요")
    f.memberId.focus();
    return false;
   }
   
/*    if(f.memberId.value != "idCheck"){
       alert("아이디 중복체크를 해주세요.");
       return false;
   } */

   if(f.memberPwd.value == "")
   {
    alert("비밀번호를 입력하세요")
    f.memberPwd.focus();
    return false;
   }
  if(f.memberPwdchk.value == "")
   {
    alert("비밀번호를 다시한번 입력해주세요")
    f.memberPwdChk.focus();
    return false;
   } 
if(f.memberPwd.value != f.memberPwdchk.value) 
   {
    alert("비밀번호가 다릅니다.");
    f.memberPwd.value = ""; 
    f.memberPwdChk.value = ""; 
    f.memberPwd.focus(); 
    return false;
   } 
   
   if(f.memberName.value == "")
   {
    alert("이름이 없는건가..") 
    f.memberName.focus(); 
    return false;
   }


   if(f.birthday.value == "" )
   {
    alert("생년월일을 입력하세요.") 
    f.birthday.focus(); 
    return false;
   }
   /* if(document.frm.memSung.value == "")
   {
    alert("성별을 선택하세요") 
    return false; 
   } 라디오버튼값 체크 유무 확인 방법??*/
   if(f.email.value == "")
   {
    alert("이메일을 입력하세요") 
    f.email.focus(); 
    return false;
   }
   // 메일 수신은 수신동의 selected
   
   if (f.memMobile01.value == "Not")
   {
    alert("핸드폰번호를 선택하세요")
    return false;
   }
   if (f.memMobile02.value == "")
   {
    alert("핸드폰번호를 입력하세요")
   f.memMobile02.focus();
    return false;
   }
   if (f.memMobile03.value == "")
   {
    alert("핸드폰번호를 입력하세요")
    f.memMobile03.focus();
    return false;
   }

		   if (f.imgUrl.value == "")
				   {
				    alert("사진을 등록하세요")
				    f.imgUrl.focus();
				    return false;
				   }
  f.submit(); // 버튼으로 쓸 땐 return true; 대신 이걸 쓰고 form시작 구문에 onsubmit="return memChk()" 는 불필요하여 삭제

 } 
  </script>
</head>
<body>

	<section id="container">
		<header class="header black-bg">
			<div class="top-menu">
				<ul class="nav pull-center top-menu">
					<a href="${context}/login" class="logo"><b>DANCEPEL</b></a>
				</ul>
			</div>
		</header>
	</section>
	
	<section id="main-content" class="container">
		<section class="wrapper site-min-heigth">
			<h3><i class="fa fa-angle-right"></i> 회원가입</h3>
			<div class="container">
				<div class="row mt">
					<div class="col-sm-12">
						<div class="form-panel">
							<h4 class="mb"> * 표시 항목은 필수 입력 항목입니다.</h4>
							<form action="member/memberInsertAction" method="post" class="form-horizontal style-form">
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label"> 아이디 </label>
								
									<div class="col-sm-8">
										<input type="text" name="memberId" class="form-control"> 
										<p class="help-block">
											아이디는 영문,숫자 조합으로 하셔야 합니다.[4자리이상 12자리이하] 아이디는 소문자로 저장
											됩니다.
										</p>
									</div>
								
									<div class="col-sm-2">
										<input type="button" id="check_id" value="중복 체크" onClick="winOpen()" class="btn btn-custom-gray btn-block"/>
										<span id="check_id_result"></span>
									</div>
									
									
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">비밀번호</label>
									
									<div class="col-sm-10">
										<input type="password" name="memberPwd" class="form-control" />
										<p class="help-block">비밀번호는 4자리이상 12자리이하로 입력해주세요.</p>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">비밀번호 확인</label>
									
									<div class="col-sm-10">
										<input type="password" name="memberPwdchk" class="form-control">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">이름</label>
									
									<div class="col-sm-10">
										<input type="text" name="memberName" class="form-control">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">생년월일</label>
									
									<div class="col-sm-10">
										<input type="text" name="birthday" class="form-control">
										<p class="help-block">ex)1992/06/11</p>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">성별</label>
									
									<div class="col-sm-10">
										<label class="radiobox">
											<input type="radio" name="gender" value="man">남자
											<input type="radio" name="gender" value="woman">여자
										</label>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">E mail</label>
									
									<div class="col-sm-10">
										<input type="email" name="email" class="form-control">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">핸드폰</label>
									
									<div class="col-sm-10">
									
										<select name="memMobile01" class="form-control">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="019">019</option>
											<option value="070">070</option>
										</select>
										-
									
										<input type="text" name="memMobile02" size="5" maxlength="4" class="form-control">
										-
										
										<input type="text" name="memMobile03" size="5" maxlength="4" class="form-control">

										
										<input type="hidden" name="phone" />
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">사진</label>
									
									<div class="col-sm-10">
										<input name="imgUrl" type="file" />
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">자기소개</label>
									
									<div class="col-sm-10">
										<textarea name="memIntro" class="form-control"></textarea>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">개인정보 동의</label>
									
									<div class="col-sm-8">
										<p class="navbar-text">회원님의 개인정보는 댄스플동아리카페에서 회원수집 목적으로만 사용됩니다.</p>
										
									</div>
									
									<div class="col-sm-2">
										<label class="radiobox">
											<input type="radio" name="yes" value="yes">동의
											<input type="radio" name="no" value="no">거부
										</label>
									</div>
								</div>
								
								<div class="form-group">
									<span class="pull-right">
										<div class="col-sm-12"> 
											<input type="submit" value="등록" class="btn btn-custom-gray"/>
											<input type="button" value="취소" onclick="memChk()" class="btn btn-default" />
										</div>
									</span>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>

	
	<!-- js placed at the end of the document so the pages load faster -->
    <script src="${context}/resources/js/jquery.js"></script>
    <script src="${context}/resources/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="${context}/resources/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="${context}/resources/js/jquery.scrollTo.min.js"></script>
    <script src="${context}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="${context}/resources/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="${context}/resources/js/jquery-ui-1.9.2.custom.min.js"></script>

</body>
</html>
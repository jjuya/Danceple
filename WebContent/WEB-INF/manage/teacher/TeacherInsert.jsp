<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<!-- Bootstrap -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	<title>강사 추가 페이지</title>

</head>
<body>
<div class="container"> 

<form action="teacherInsertAction" method="post">

	<label> 강사 추가 페이지 </label>
	
	<div class="form-group row">
		<label for="teamId" class="col-2 col-form-label">팀 아이디</label>
		<select id="teamId" name="teamId" class="selectpicker">
			<c:forEach items="${teamList}" var="team">
				<option value="${team.teamId}">${team.teamName}</option>
			</c:forEach>
		</select>
	</div>
	
	<div class="form-group row">
		<label for="genreId" class="col-2 col-form-label">장르 아이디</label>
		
		<select id="genreId" name="genreId" class="selectpicker">
		 	<c:forEach items="${genreList}" var="genre">
				<option value="${genre.genreId}">${genre.genreName}</option>
			</c:forEach>
		</select>
	</div>
	
	<div class="form-group row">
		<label for="teamName" class="col-2 col-form-label"> 강사 이름 </label>
		<input type="text" id="teacherName" name="teacherName" />
	</div>
	
	<div class="form-group row">
		<label for="teamName" class="col-2 col-form-label"> 시즌 </label>
		<select id="seasonId" name="seasonId" class="selectpicker">
		 	<c:forEach items="${seasonList}" var="season">
		 		<c:choose>
		 			<c:when test="${seasonVO.seasonId == 0}">
						<option value="${season.seasonId}" selected="selected">${season.snMonth}</option>
					</c:when>
					<c:otherwise>
						<option value="${season.seasonId}">${season.snMonth}</option>
					</c:otherwise>
		 		</c:choose>
			</c:forEach>
		</select>
	</div>
	
	
	
	
	<button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>

</body>
</html>
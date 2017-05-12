<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register cite</title>
</head>
<h2>Register</h2>
<body onload="document.frm.reset();">
	<form method="post" name="frm" class="frmm">
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				class="form-control" id="exampleInputEmail1" name="title">
		</div>
		<div class="content">
			<label for="exampleInputEmail1">내용</label>
			<textarea class="form-control" rows="3" name="content"></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">글쓴이</label> <input type="text"
				class="form-control" id="exampleInputPassword1" name="writer">
		</div>
		<button type="submit" class="btn btn-default">제출</button>

	</form>
	<form action="/list" method="get">
		<button class="btn btn-default">취소</button>
	</form>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function(e) {
			var result = '${fail}';
			if (result == 'fail') {
				alert("빈칸을 등록해주세요.");

			}

		})
		
		
	</script>
</body>
</html>
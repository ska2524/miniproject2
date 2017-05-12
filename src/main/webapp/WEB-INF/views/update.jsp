<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
</head>
<body>
	<title>Update</title>
</head>
<body>

	<style>
.form-control1 {
	width: auto;
	height: 50px;
}
</style>
	<h2>Update</h2>
	<form method="get" action="/view">
		<div>
			<input type="hidden" id="uinput" name="page" value="${cri.page}">
			<input type="hidden" id="uinput" name="bno" value="${vo.bno}">
			<input type="hidden" id="uinput" name="type" value="${cri.type}">
			<input type="hidden" id="uinput" name="keyword"
				value="${cri.keyword}">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				class="form-control" id="exampleInputEmail1" name="title"
				value="${view.title}">
		</div>
		<div class="content">
			<label for="exampleInputEmail1">내용</label> <input type="text"
				class="form-control" id="exampleInputPassword1" name="content"
				value="${view.content}">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">글쓴이</label> <input type="text"
				class="form-control" id="exampleInputPassword1" name="writer"
				value="${view.writer}">
		</div>
		<button type="submit" class="btn btn-default">제출</button>
	</form>

	<form action="/view" method="get" class="form">
		<input type="hidden" id="uinput" name="page" value="${cri.page}">
		<input type="hidden" id="uinput" name="bno" value="${vo.bno}">
		<input type="hidden" id="uinput" name="type" value="${cri.type}">
		<input type="hidden" id="uinput" name="keyword" value="${cri.keyword}">
		<button type="submit" class="btn">취소</button>
	</form>







	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script>
		$(".btn").on("click", function(e) {

			$(".form").submit();

		})
	</script>
</body>

</html>
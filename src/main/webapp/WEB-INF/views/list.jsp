<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
td{
border-left-style: inset;
}

br {
	content: "";
	display: block;
	margin-bottom: -4px;
}

.meta {
	background-color: green;
	color: white;
	text-align: center;
	font-size: 20px;
}

.pro {
	text-align: center;
	margin: 0 auto;
	font-size: 20px;
}

.active {
	text-decoration: none;
	background: gray;;
}

.active a {
	color: white;
	text-decoration: none;
}

.page {
	float: left;
	overflow: hidden;
	width: 512px;
	text-align: center;
	align-content: center;
	margin: 0 auto;
	font-size: 20px;
}

.page ul {
text-align: center;
	align-content: center;
	margin: 0;
	padding: 0;
}

.page ul li {

	text-align: center;
	list-style: none;
	padding-top: 2px;
	width: 37px;
	height: 29px;
	float: left;
	overflow: hidden;
	margin-left: 3px;
	border: 1px solid #333333;
}



.page ul a {
text-align: center;
	align-content: center;
	width: 30px;
	height: 30px;
	color: green;;
	text-decoration: none;
	vertical-align: middle;
}
</style>
<body>
	<div class="panel panel-default" >
		<div class="panel-heading">
			<h2 style="text-align: center;">List Page</h2>
		</div>
		<table class="table" style="margin-top: 50px">
			<tr class="meta">
				<td width="10%">bno</td>
				<td width="40%">title</td>
				<td width="20%">writer</td>
				<td width="15%">regdate</td>
				<td width="15%">updatedate</td>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr class="pro">
					<td>${list.bno}</td>
					<td><a class="tt" href="${list.bno}">${list.title}</a></td>
					<td>${list.writer}</td>
					<td>${list.regdate}</td>
					<td>${list.updatedate}</td>
					</br>
				<tr />
			</c:forEach>
		</table>
	</div>
	
	<div class="page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<a href="${pageMaker.start-1}">이전</a>
			</c:if>

			<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}"
				var="pagege">
				<a href="${pagege}">
				<li class='${pagege == pageMaker.current?"active":""}'>${pagege}</li></a>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<a href="${pageMaker.end+1}">다음</a>
			</c:if>
		</ul>
	</div>

	<div>
		<form class="form" method="get" action="/list">
			<input class="hopage" type="hidden" name="page"value="${pageMaker.current}"> 
				<input class="view"type="hidden" name="bno"> 
				<select name="type" class="type">
				<option value="n" ${cri.type eq null?'selected':''}>---</option>
				<option value="t" ${cri.type eq 't'?'selected':''}>title</option>
				<option value="c" ${cri.type eq 'c'?'selected':''}>content</option>
				<option value="w" ${cri.type eq 'w'?'selected':''}>writer</option>
			</select> 
			<input type="text" class="text" name="keyword"
				value="${cri.keyword}">
			<button id="btnn" class="btn btn-info">Search</button>

		</form>
	</div>

	<div>
		<form action="/list">
			<button class="btn btn-default" style="position: relative; left: 650px ">HOME</button>
		</form>
	</div>


	</div>
	<form action="/register" method="get">
		<button id="btn" class="btn btn-success" style="position: relative; left: 1450px ">Register</button>
	</form>
	</div>
	</div>




	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(e) {
			history.pushState(null, null);

			var result1 = '${pageMaker.total}'
			if (result1 == 0) {
				alert("검색조건이 없습니다.");
				$(".form").attr("action", "/re").submit();
			}

			var result2 = '${delete}';
			if (result2 == "success") {
				history.pushState(null, null, "/list");
				alert("삭제처리되었습니다.");

				window.onpopstate = function(e) {
					history.go(1);
				};
			}

			var result3 = '${msg}';
			if (result3 == "success") {
				history.pushState(null, null);
				alert("새글이 등록되었습니다.");
				window.onpopstate = function(e) {
					history.go(1);
				};
			}

			$(".page a").on("click", function(e) {

				e.preventDefault();

				$(".hopage").val($(this).attr("href"));

				$(".form").submit();
			})

			$(".tt").on("click", function(e) {

				e.preventDefault();

				$(".view").val($(this).attr("href"));

				$(".form").attr("action", "/view").submit();
			})

			$("#btnn").on("click", function(e) {
				e.preventDefault();
				$(".hopage").val("1");
				$(".form").submit();

			})

		});
	</script>
</body>
</html>
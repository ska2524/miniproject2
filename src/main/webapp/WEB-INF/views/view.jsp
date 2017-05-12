<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<style>
.replyLi{
list-style: none;
}

.btnDiv{
float: right;
padding: 10px;
position: relative;
margin: 0 auto;
}

form{
padding: 10px;
}
.btn btn-warning{
 align-items: center

}
.buModal{
float: right;
}

.rere{
background-color: aqua;
font-size: 30px;
text-align: center;

}

	
.meta {
	background-color: green;
	color: white;
	text-align: center;
	font-size: 20px;
}

.metaa {
	text-align: center;
	font-size: 20px;
}

.metaaa {
	background-color: green;
	color: white;
	text-align: center;
	font-size: 20px;
	width: 100%;
}

.metaaaa {
	float :left;
	text-align: ;
	font-size: 20px;
}

.reply {
	background-color: white;
	height: 200px;
	width: 100%;
}

.rebtn{
float: right;
}
</style>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 style="text-align: center;">View Page</h2>
		</div>
		<table class="table" style="margin-top: 50px">
			<tr class="meta">
				<td>글번호</td>
				<td>글제목</td>
				<td>글내용</td>
				<td>글쓴이</td>
				<td>등록일</td>
				<td>수정일</td>
			</tr>
			<tr class="metaa">
				<td>${view.bno}</td>
				<td>${view.title}</td>
				<td>${view.content}</td>
				<td>${view.writer}</td>
				<td>${view.regdate}</td>
				<td>${view.updatedate}</td>
			</tr>
		</table>
	</div>
	
	<div class="btnDiv">
		<form id="dform" method="post" action="/view" style="width:-10px;float:left;">
			<input type="hidden" name='delete'> <input type="hidden"
				id="uinput" name="page" value="${pageMaker.current}"> <input
				type="hidden" id="uinput1" name="bno" value="${view.bno}"> <input
				type="hidden" id="uinput" name="type" value="${cri.type}"> <input
				type="hidden" id="uinput" name="keyword" value="${cri.keyword}">
			<input type="hidden" id="uinput" name="writer" value="${view.writer}">
			<button type='button' class='btn btn-success' id="dbtn">Delete</button>

		</form>
	
	
		<form id="uform" action="/update" method="get" style="width:-10px;float:left;">
			<input type="hidden" id="uinput" name="page"
				value="${pageMaker.current}"> <input type="hidden"
				id="uinput" name="bno" value="${view.bno}"> <input
				type="hidden" id="uinput" name="type" value="${cri.type}"> <input
				type="hidden" id="uinput" name="keyword" value="${cri.keyword}">
			<button type='button' class='btn btn-info' id="ubtn">Update</button>

		</form>
</div>	
<div style="height: 100px;"></div>
<div style="height: 50px;" class="rere">Reply</div>
<div class="rebtn">
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-warning"
		data-toggle="modal" data-target="#myModal">Register</button>
		</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					content<input type="text" name=content id="newCountent">
					writer<input type="text" name=writer id="newWriter">
					<form id="rform" action="/view" method="get">
						<input type="hidden" id="uinput" name="page" value="${cri.page}">
						<input type="hidden" id="uinput" name="bno" value="${view.bno}">
						<input type="hidden" id="uinput" name="type" value="${cri.type}">
						<input type="hidden" id="uinput" name="keyword"
							value="${cri.keyword}">
						<button id="rbtn">등록</button>
					</form>

				</div>
			</div>

		</div>
	</div>
	<!--end reigeter modal  -->
	
	<!-- Button trigger modal -->


	<div>
		<table class="table">
			<tr class="metaaaa">


			</tr>
		</table>

	</div>
<!-- Modal -->

<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class='modal-title'></div>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">댓글 수정/삭제</h4>
      </div>
      <div class="modal-body">
       <input type="text" name=content id="newCountent11">
      </div>
      <div>
      <button type="button" id="replyModBtn">수정</button>
      <button type="button" id="replyDelBtn">삭제</button>
     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="modbtn">Close</button>
       
      </div>
    </div>
  </div>
</div>


	<!-- <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div> -->



	<div class="panel-footer">


		<div>
			<form id="form" action="/list" method="get">
				<input type="hidden" id="uinput" name="page" value="${cri.page}">
				<input type="hidden" id="uinput" name="bno" value="${vo.bno}">
				<input type="hidden" id="uinput" name="type" value="${cri.type}">
				<input type="hidden" id="uinput" name="keyword"
					value="${cri.keyword}">
				<button type='button' class='btn btn-primary btn-lg' id="btnn">Return to List</button>
			</form>
		</div>
	</div>








	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script>
		$(document)
				.ready(
						function(e) {

							var result1 = '${update}';

							if (result1 == "success") {
								history.pushState(null, null);

								alert("글이 수정되었습니다.");

								window.onpopstate = function(e) {
									history.go(1);
								};

							}

							$("#btnn").on("click", function(e) {

								e.preventDefault();

								$("#form").submit();

							})

							$("#dbtn").on("click", function(e) {

								e.preventDefault();
								if (confirm('삭제하시겠습니까?') == true) {
									$("#dform").submit();
								}

							})

							$("#ubtn").on("click", function(e) {

								e.preventDefault();

								$("#uform").submit();

							})

							getList()

							function getList() {
								var bno = $("#uinput1").val();
								$
										.getJSON(
												"/reply/view/" + bno,
												function(data) {

													console.log(data.length);
													var str = "";

													$(data).each(

													function() {
													str += 
													
													"<li data-rno='"+this.rno+"' class='replyLi'>"
																				
													
													+"<h4>번호 "+" : "+ this.rno+","+"writer "+" : "+ this.writer+""+"</h4>"
																				
																				
													+"<h4>글내용 "+" : "+ this.content+"</h4>"
																				
																			
												  + "<button type='button' class='btn btn-primary float-right' data-toggle='modal' data-target='#myModal1' >"
								                  +"<h4>MOD</h4>"
										          +"</button>"
										          
																				  
												 + "</li>";
												
												}

												);
													$(".metaaaa").html(str)
												});
							}

							$("#rbtn").on("click", function() {

								var content = $("#newCountent").val();
								var writer = $("#newWriter").val();
								var bno = $("#uinput1").val();

								$.ajax({

									type : 'post',
									url : '/reply',
									headers : {
										"Content-Type" : "application/json"
									},
									dataType : 'text',
									data : JSON.stringify({
										bno : bno,
										writer : writer,
										content : content

									}),
									success : function(result) {

										if (result == 'SUCCESS') {
											alert("등록되었습니다.")
											getList();

											$(".rform").submit();

										}
									}

								})
							})

							$(".metaaaa").on("click", ".replyLi button",
									function() {
										
										var reply = $(this).parent();
										console.log(reply);
										var rno = reply.attr("data-rno");
										var content = reply.text();
										
										$(".modal-title").html(rno);
										

									})
									
							$("#replyDelBtn").on("click",function(e){
								
								var rno = $(".modal-title").html();
								var content	= $("#newWriter").val();
								
								$.ajax({
									
									type : 'delete',
									url : '/reply/'+rno,
									headers : {
										"Content-Type" : "application/json"
									},
									dataType : 'text',
									
									success : function(result) {
										console.log("result"+result);
										if(result =='SUCCESS'){
											alert("삭제되었습니다.");
											$("#modbtn").trigger("click");
											getList();
											
										}
									}
									
									
									
									
								})
								
								
								
							})
							
								$("#replyModBtn").on("click",function(e){
								
								var rno = $(".modal-title").html();
								var content	= $("#newCountent11").val();
								
								$.ajax({
									
									type : 'put',
									url : '/reply/'+rno,
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override": "PUT"},
										data : JSON.stringify({
											content : content

										}),
									dataType : 'text',
									success : function(result) {
										console.log("result"+result);
										if(result =='SUCCESS'){
											alert("수정되었습니다..");
											$("#modbtn").trigger("click");
											getList();
											$("#newCountent11").val("");
											
											
										}
									}
									
									
									
									
								})
								
								
								
							})

						})
	</script>
</body>
</html>
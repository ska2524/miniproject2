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
.success{
width: 100px
}



.replyLi{
list-style: none;
vertical-align: middle;
padding-bottom: 10px;
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

.pagination{
margin: auto;
}

.rere{
border-top-color : green;
border-bottom-style :dotted;
color:black;
border-bottom-color : green;
font-size: 30px;
text-align: center;

}

	


.metaaa {
	background-color: green;
	color: white;
	text-align: center;
	font-size: 20px;
	width: 100%;
}



.metaaaa li{
	list-style-type:square;
    padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 15px;
    margin: 0px;
    
}

.reply {
	background-color: white;
	height: 200px;
	width: 100%;
}

.rebtn{
float: right;
padding: 10px;
}
</style>


	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 style="text-align: center;">View Page</h2>
		</div>
		<div style="height: 50px">
		
		</div>
		<table   cellspacing="0" class="table" style= width: 1000px;">
			<tr class="meta">
				<td class="success">글번호</td>
				<td class="active">${view.bno}</td>
			</tr>
			<tr class="meta">
				<td class="success">글제목</td>
				<td class="active">${view.title}</td>
			</tr>
			<tr class="meta">
				<td class="success" >글내용</td>
				<td class="active">${view.content}</td>
			</tr>
			<tr class="meta">
				<td class="success">글쓴이</td>
				<td class="active">${view.writer}</td>
			</tr>
			<tr class="meta">
				<td class="success">등록일</td>
				<td class="active">${view.regdate}</td>
			</tr>
			<tr class="meta">
				<td class="success">수정일</td>
				<td class="active">${view.updatedate}</td>
			
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
<div>
<table class="table">
<tr>
<td class="info" style="text-align: center; font-size: 20px">Reply</td>
</tr>
</table></div>
<div class="rebtn" style="height: 100px;">
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-warning"
		data-toggle="modal" data-target="#myModal">Register</button>
		</div>
<div style="height: 100px";></div>


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
					<h4 class="modal-title" id="myModalLabel">Reply Register</h4>
				</div>
				<div class="modal-body">
					<label>content</label><input type="text" name=content id="newCountent" class="form-control">
					<label>writer</label><input type="text" name=writer id="newWriter" class="form-control">
					<form id="rform" action="/view" method="get">
						<input type="hidden" id="uinput" name="page" value="${cri.page}">
						<input type="hidden" id="uinput" name="bno" value="${view.bno}">
						<input type="hidden" id="uinput" name="type" value="${cri.type}">
						<input type="hidden" id="uinput" name="keyword"
							value="${cri.keyword}">
						<button id="rbtn" class="btn btn-warning" >등록</button>
					</form>

				</div>
			</div>

		</div>
	</div>
	<!--end reigeter modal  -->
	
	<!-- Button trigger modal -->

	<!--댓글 리스트  -->
	
	<div>
		
			<ul class="metaaaa">
				

			</ul>
		
		

	</div>
	
	<!--댓글페이징  -->
	<div>
	<ul class="pagination">
	
	</ul>
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
      
       <label>수정내용</label><input type="text" name=content id="newCountent11" class="form-control">
      </div>
      <div>
      <form style="width:-10px;float:right;">
      <button type="button" id="replyDelBtn" class="btn btn-success">Delete</button>
      <button type="button" id="replyModBtn" class="btn btn-info">Update</button>
      </form>
     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="modbtn"  style="float: left;">Close</button>
       
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
		$(document).ready(function(e) {

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
							
							var replyPage = 1;
							
							$(".pagination").on("click","li a", function(e){
								
								e.preventDefault();
								
								replyPage = $(this).attr("href");
								
								getList(replyPage);
								
								
							})
							

							getList(replyPage)

							function getList(replyPage) {
								var bno = $("#uinput1").val();
								var page = replyPage;
								$.getJSON(
												"/reply/view/" +bno+"/"+page,
												function(data) {

													console.log(data);
													var str = "";

													$(data.list).each(

													function() {
													str += 
													
													"<li data-rno='"+this.rno+"' data-con='"+this.content+"' class='replyLi'>"
																				
													
													+"글쓴이 "+" : "+this.writer+" "+" " 
																			
													+"내용 "+" : "+this.content
																				
																			
												  + "<button style='float: right' type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal1'>"
								                  +"MOD"
										          +"</button>"
										          
																				  
												 + "</li>"+"</br>";
												
												}

												);
													$(".metaaaa").html(str)
													
													printPaging(data.pageMaker)
												});
							}
							
							function printPaging(pageMaker){
								
								var str ="";
								
								if(pageMaker.prev){
									
									str+="<li><a href='"+(pageMaker.start-1)+"'> << </a><li>";
								}
								
								for(var i = pageMaker.start, len = pageMaker.end; i<=len; i++){
									
									var strClass = pageMaker.cri.page == i?'class=active':'';
									str+= "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>" 
									
								}
								
								if(pageMaker.next){
									
									str+="<li><a href='"+(pageMaker.end+1)+"'> << </a><li>";
								}
								
								$(".pagination").html(str);
								
								
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
										var content = reply.attr("data-con");
										var writer = $("#newWriter").val();
										
										$(".modal-title").html(rno);
										$("#newCountent11").val(content)
										

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
											getList(replyPage);
											
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
											alert("수정 되었습니다..");
											$("#modbtn").trigger("click");
											getList(replyPage);
											$("#newCountent11").val("");
											
											
										}
									}
									
									
									
									
								})
								
								
								
							})

						})
	</script>
</body>
</html>
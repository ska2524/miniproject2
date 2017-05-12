<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>ajax</h2>
<div>
<input type="text" name = content id="newCountent">
<input type="text" name = writer id="newWriter">
<button id="btnn">등록</button>

</div>
<ul id="replies">

</ul>





<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
		
<script>
var bno =33;
function getList(){
	$.getJSON("/reply/view/" + bno,function(data){
			
		console.log(data.length);
		var str = "";
		 
		$(data).each(
				
		function(){
			str += "<li data-rno='"+this.rno+"' class='replyLi'>"
			+ this.rno+":"+this.content +"<button>MOD</button>"+"</li>";
			
		}
		
		);
		$("#replies").html(str) 
	});
	}
	
$("#btnn").on("click",function(){
	
	var content = $("#newCountent").val();
	var writer = $("#newWriter").val();
	
	$.ajax({
		
		
		type:'post',
		url:'/reply',
		headers:{
			"Content-Type" :"application/json"
		},
		dataType : 'text',
		data : JSON.stringify({
			bno : bno,
			writer : writer,
			content : content
			
		}),
		success : function(result){
			
			if(result=='SUCCESS'){
				alert("등록되었습니다.")
				getList();
			}
		}
		
	})
})





</script>
</body>
</html>
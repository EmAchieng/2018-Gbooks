<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap">
<script src="http://code.jquery.com/jquery-1.10.1.min.js">
</script>
<script src="js/bootstrap.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>
	var request=new XMLHttpRequest();
	
	function searchFunction(){
		request.open("Post", "./UserSearchServlet?userName="+encodeURIComponent(document.getElementById("userName").value),true");
		request.onreadystatechange=searchProcess;
		request.send(null);
	}
	function searchProcess() {
		var table=document.getElementById("bookTable");
		table.innerHTML="";
		if(request.readyState==4 && request.status==200) {
			var object=eval('('+request.responseText+')');
			var result=object.result;
			for(var i=0; i<result.length; i++) {
				var row=table.insertRow(0);
				for(var j=0; j<result[i].length; j++){
					var cell=row.insertCell(j);
					cell.innerHTML=result[i][j].value;
				}
			}
		}
	}
	
</script>
</head>

<body>
	<br />
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="userName" onkeyup="searchFunction()" type="text" size="20">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
			</div>
		</div>
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thread>
				<tr>
					<th style="background-color: #fafafa; text-align:center;">ID</th>
					<th style="background-color: #fafafa; text-align:center;">Title</th>
					<th style="background-color: #fafafa; text-align:center;">Author</th>
					<th style="background-color: #fafafa; text-align:center;">Price</th>
					<th style="background-color: #fafafa; text-align:center;">Quantity</th>
				</tr>
			</thread>
			<tbody id="bookTable">
				<tr>
					<td>1</td>
					<td>business</td>
					<td>경영전략</td>
					<td>15,000</td>
					<td>1</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>
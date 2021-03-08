<%@page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%
//Insert function

if (request.getParameter("itemCode") != null)
 {
	
 	Item itemObj = new Item();
 	String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
 	request.getParameter("itemName"),
 	request.getParameter("itemPrice"),
 	request.getParameter("itemDesc"));
 	session.setAttribute("statusMsg", stsMsg);
 	
 }


//Delete Function

if (request.getParameter("itemID") != null)
 {
	
 	Item itemObj = new Item();
 	String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
 	session.setAttribute("statusMsg", stsMsg);
 	
 }
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="Views/bootstrap.min.css">
		<title>Items Management</title>
	</head>
	<body>
		<div class="container">
 			<div class="row">
 				<div class="col">
					<h1>Items Management</h1>
					<form method="post" action="items.jsp">

						<div class="form-group row">
  							<div class="col-xs-2">
    							<label for="l1">Item code: </label>
    							<input name="itemCode" type="text" class="form-control" id="l1"><br>
 							</div>
							<div class="col-xs-3">
    							<label for="l2">Item name: </label>
 								<input name="itemName" type="text" class="form-control" id="l2"><br>
 							</div>
							<div class="col-xs-2">
    							<label for="l3"> Item price: </label>
 								<input name="itemPrice" type="text" class="form-control" id="l3"><br>
 							</div>
							<div class="col-xs-2">
    							<label for="l4">Item description: </label>
 								<input name="itemDesc" type="text" class="form-control" id="l4"><br>
 							</div>
 						</div>
 						<input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
  
					</form>
					<%
 						out.print(session.getAttribute("statusMsg"));
					%>
					<br>

					<%
	 					Item itemObj = new Item();
 						out.print(itemObj.readItems());
					%>

				</div>
 			</div>
		</div>

	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Employee Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>

	function validateForm() {

		if (document.getElementById("name").value == "") {
			return "Insert your First Name.";
		}

		if (document.getElementById("country").value == "") {
			return "Insert your Last Name.";
		}
		
		if (document.getElementById("email").value == "") {
			return "Insert your email address";
		} else {
			var regExpression = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			if (!regExpression.test(document.getElementById("email").value)) {
				return "Email is not valid";
			}
		}

		return true;
	}

	function formValudation() {
		var x = validateForm();
		console.log(x);
		if (x == true) {
			alert("success");
			window.location.href = "http://localhost:8080/employeeManagement/list";
		} else {
			alert(x);
		}
	}

	
	</script>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="http://localhost:8080/employeeManagement/" class="navbar-brand"> Employee Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Employees</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${employee != null}">
					<form id="form" name="form" onsubmit="submitForm(event)" action="update" method="post">
				</c:if>
				<c:if test="${employee == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${employee != null}">
            			Edit Employee
            		</c:if>
						<c:if test="${employee == null}">
            			Add New Employee
            		</c:if>
					</h2>
				</caption>

				<c:if test="${employee != null}">
					<input type="hidden" name="id" id = "id" value="<c:out value='${employee.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>User Name</label> <input type="text"
						value="<c:out value='${employee.name}' />" class="form-control"
						name="name" id = "name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>User Email</label> <input type="text"
						value="<c:out value='${employee.email}' />" class="form-control"
						name="email" id="email">
				</fieldset>

				<fieldset class="form-group">
					<label>User Country</label> <input type="text"
						value="<c:out value='${employee.country}' />" class="form-control"
						name="country" id="country">
				</fieldset>

				<button name="submit" id="submit" type="submit" onclick="formValudation()" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
	<title>Employee List</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		.colorChange{
			color:#9932CC;
			text-decoration:underline;
			font-size: 25px
			font-family: "Lucida Console", "Courier New", monospace;
		}
		
		.foot{
			background-color: #5F9EA0;
			color:black;
			text-align:center;
			height: 35px;
			padding-top:5px
			margin-bottom:0;
		}
	</style>
</head>
<body>
	<div class="container">
	<br/>
		<h2>Employee Management Sheet <span class="colorChange">By Naveen N</span> </h2>
		<br/>
		<p>A simple Employee management project developed using Java, Spring Boot, Hibernate, JPA, Thymeleaf, Spring MVC, MySQL.
		The main main was to understand how spring boot works with Thymeleaf.
		This project includes all the CRUD operations GET, POST, PUT, DELETE.
		</p>
		<hr/>

		<a th:href="@{/employees/showFormForAdd}" class="btn btn-primary btn-sm mb-3">
			Add Employee
		</a>

		<table class="table table-bordered table_striped">
			<thead class="table-dark">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<tr th:each = "tempEmployee : ${employees}">
					<td th:text="${tempEmployee.firstName }"/>
					<td th:text="${tempEmployee.lastName }"/>
					<td th:text="${tempEmployee.email }"/>
					<td>
						<a th:href="@{/employees/showFormForUpdate(employeeId = ${tempEmployee.id })}" class="btn btn-info btn-sm">
							Update
						</a>
						<a th:href="@{/employees/delete(employeeId = ${tempEmployee.id })}" class="btn btn-danger btn-sm" onclick="if (!(confirm ('Are you sure ant to delete the employee'))) return false ">
							Delete
						</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<footer class="foot">&copy; Copyright 2024 Naveen N</footer>
</body>
</html>

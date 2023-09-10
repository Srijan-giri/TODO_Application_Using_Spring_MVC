<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title><c:out value="${page }"></c:out></title>
</head>
<body>
	<div class="container mt-3">
		<h1 class="text-center">Welcome To TODO Manager</h1>
		<div class="row mt-5">
			<div class="col-md-2">
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active"
						aria-current="true">Menu</button>
					<a href='<c:url value='/add' ></c:url>'
						class="list-group-item list-group-item-action">Add TODO</a> <a
						href='<c:url value='/home' ></c:url>'
						class="list-group-item list-group-item-action">View TODO</a>
					<!-- <button type="button"
						class="list-group-item list-group-item-action">A fourth
						button item</button> -->

				</div>
			</div>
			<div class="col-md-10">
				<!-- <h3 class="text-center">Content</h3> -->
				<c:if test="${page== 'home' }">
					<h1 class="text-center">All TODOS</h1>
					<c:forEach items="${todos }" var="item">
                             <div class="card mt-2 " style="width: 100 %">
							<div class="card-body">
								<h5 class="card-title">Name : ${item.todoTitle }</h5>
								<h6 class="card-subtitle mb-2 text-muted">Date : ${item.todoDate }</h6>
								<p class="card-text">${item.todoContent }</p>
							</div>
						</div>
                           
						

					</c:forEach>
				</c:if>
				<c:if test="${page=='add' }">
					<h1 class="text-center">Add TODO</h1>
					<br>
					<form:form action="saveTodo" method="post" modelAttribute="Todo">
						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter your todo title" />
						</div>
						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control mt-2"
								placeholder="Enter your todo content" cssStyle="height:300px;" />
						</div>
						<div class="container text-center mt-2">
							<button class="btn btn-outline-success">Add ToDo</button>
						</div>
					</form:form>
				</c:if>
			</div>

		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
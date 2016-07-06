<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@requestUtil" var="requestUtil"/>
		<div class="page-title">
			
			<div class="title-env">
				<h1 class="title">main</h1>
				<p class="description">main</p>
			</div>
		
		</div>

	<div class="jumbotron">
		<h1>메인화면</h1>
	</div>
			<p><c:out value="${pageContext.request}"></c:out></p>
			<p><c:out value="${pageContext.request.contextPath}"></c:out></p>
			<p><c:out value="${pageContext.request.requestURI}"></c:out></p>
			<p><c:out value="${pageContext.request.requestURL}"></c:out></p>
			<br/>
			<p><c:out value="${requestUtil.menuPath}"></c:out></p>
			

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title><tiles:getAsString name="title"/></title>
    <tiles:insertTemplate template="/WEB-INF/template/basic/css.jsp" flush="true"/>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js"></script>
</head>
<body class="page-body skin-aero">
<!--[if lt IE 8]>
<![endif]-->
    <tiles:insertAttribute name="header" flush="true"/>
    
    <div class="page-container">
	    <tiles:insertAttribute name="sidebar" flush="true"/>
	    <div class="main-content">
			<tiles:insertAttribute name="content" flush="true"/>
	    </div>
    </div>

    <tiles:insertAttribute name="footer" flush="true"/>
    
	<!-- Page Loading Overlay -->
<!-- 	<div class="page-loading-overlay"> -->
<!-- 		<div class="loader-2"></div> -->
<!-- 	</div> -->
	
    <tiles:insertTemplate template="/WEB-INF/template/basic/js.jsp" flush="true"/>
</body>
</html>

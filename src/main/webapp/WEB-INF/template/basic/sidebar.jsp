<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:eval expression="@requestUtil" var="requestUtil"/>

<div class="sidebar-menu toggle-others fixed">
		
	<div class="sidebar-menu-inner">
		
		<header class="logo-env">
			
				<!-- logo -->
				<div class="logo">
					<a href="dashboard-1.html" class="logo-expanded">
						<img src="${requestUtil.contextPath}/assets/images/logo@2x.png" width="80" alt="" />
					</a>
	
					<a href="dashboard-1.html" class="logo-collapsed">
						<img src="${requestUtil.contextPath}/assets/images/logo-collapsed@2x.png" width="40" alt="" />
					</a>
				</div>
	
				<!-- 이부분이 모바일 LEFT 메뉴 구성 -->
				<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
				<div class="mobile-menu-toggle visible-xs">
					<a href="#" data-toggle="user-info-menu">
						<i class="fa-bell-o"></i>
						<span class="badge badge-success">7</span>
					</a>
	
					<a href="#" data-toggle="mobile-menu">
						<i class="fa-bars"></i>
					</a>
				</div>
	
				<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
				<div class="settings-icon">
					<a href="#" data-toggle="settings-pane" data-animate="true">
						<i class="linecons-cog"></i>
					</a>
				</div>
			
		</header>
				
		<ul id="main-menu" class="main-menu">
		
			<c:if test="${requestUtil.menuPath eq 'place'}">
			<li ${requestUtil.servletPath eq '/place/placeList' ? 'class="active"' : ''}>
				<a href="./placeList">
					<i class="linecons-cog"></i>
					<span class="title">현장목록</span>
				</a>
			</li>
			<li ${requestUtil.servletPath eq '/place/placeDaily' ? 'class="active"' : ''}>
				<a href="./placeDaily">
					<i class="linecons-cog"></i>
					<span class="title">현장일지</span>
				</a>
			</li>
			<li ${requestUtil.servletPath eq '/place/placeEstimate' ? 'class="active"' : ''}>
				<a href="./estimate">
					<i class="linecons-cog"></i>
					<span class="title">견적서</span>
				</a>
			</li>
			<li ${requestUtil.servletPath eq '/place/placeWorkerManage' ? 'class="active"' : ''}>
				<a href="./placeWorkerManage">
					<i class="linecons-cog"></i>
					<span class="title">인부관리</span>
				</a>
			</li>
			</c:if>
			
			<c:if test="${requestUtil.menuPath eq 'stock'}">
			<li ${requestUtil.servletPath eq '/stock/stockList' ? 'class="active"' : ''}>
				<a href="./stockList">
					<i class="linecons-cog"></i>
					<span class="title">재고목록</span>
				</a>
			</li>
			</c:if>
			
			<c:if test="${requestUtil.menuPath eq 'purchase'}">
			<li ${requestUtil.servletPath eq '/purchase/purchaseOfficeList' ? 'class="active"' : ''}>
				<a href="./purchaseOfficeList">
					<i class="linecons-cog"></i>
					<span class="title">구매처목록</span>
				</a>
			</li>
			</c:if>
			
			<c:if test="${requestUtil.menuPath eq 'as'}">
			<li ${requestUtil.servletPath eq '/as/asPresentList' ? 'class="active"' : ''}>
				<a href="./asPresentList">
					<i class="linecons-cog"></i>
					<span class="title">A/S현황</span>
				</a>
			</li>
			<li ${requestUtil.servletPath eq '/as/asCompleteList' ? 'class="active"' : ''}>
				<a href="./asCompleteList">
					<i class="linecons-cog"></i>
					<span class="title">A/S완료</span>
				</a>
			</li>
			</c:if>
			
		</ul>
		
	</div>
	
	<script>
	
// 		var menuNm = document.location.href.split('/');
	
// 	alert(menuNm[4]);
	
	</script>
		
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 	<div class="page-title"> -->
		
<!-- 		<div class="title-env"> -->
<!-- 			<h1 class="title">현장목록</h1> -->
<!-- 			<p class="description">현장을 관리</p> -->
<!-- 		</div> -->
		
<!-- 		<div class="breadcrumb-env"> -->
<!-- 			<ol class="breadcrumb bc-1" > -->
<!-- 				<li> -->
<!-- 					<a href="#"><i class="fa-home"></i>현장관리</a> -->
<!-- 				</li> -->
<!-- 				<li> -->
<!-- 					<strong>현장목록</strong> -->
<!-- 				</li> -->
<!-- 			</ol> -->
<!-- 		</div> -->
		
<!-- 	</div> -->
	
	<div class="row">
		<div class="col-md-12">
			
			<!-- Default panel -->
			<div class="panel panel-default">
				<div class="panel-heading">현장목록
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-white btn-sm" id="btnPlaceAdd">추가</button>
						<button class="btn btn-white btn-sm" id="btnPlaceDel">삭제</button>
					</div>
				</div>
			</div>
				
				<div class="panel-body">
					
					<table id="example3" class="ui celled table hover">
					<thead>
				      <tr>
				         <th class="dt-head-center sorting_disabled" style="width: 20px;">
				         	<input name="select_all" value="all" type="checkbox" class="cbr">
				         </th>
				         <th class="dt-head-center">현장명</th>
				         <th>전화번호</th>
				         <th>주소</th>
				         <th>이메일</th>
				         <th>현장소장</th>
				         <th>상태</th>
				      </tr>
				   </thead>
					</table>
					
				</div>
			</div>
			
		</div>
	</div>

	<script>
	$(document).ready(function (){
		// Array holding selected row IDs
		var rows_selected = [];
		var table = $('#example3').DataTable({
		   ajax: 'https://api.myjson.com/bins/1us28',
		   pagingType: 'simple_numbers', 
		   'columnDefs': [{
		      'targets': 0,
		      'searchable':false,
		      'orderable':false,
		      'width':'1%',
		      'className': 'dt-body-center',
		      'mRender': function (data, type, full, meta){
		          return '<input type="checkbox" class="cbr">';
		      }
		   }],
		   'order': [1, 'asc'],
		   sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>>rt<'row'<'col-xs-6'i><'col-xs-6'p>>"
		});
		
		$('#btnPlaceAdd').on('click', function() {
			document.location.href = './placeWrite';
		});
	});
	
	
	</script>
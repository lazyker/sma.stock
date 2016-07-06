<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<head>
	<title>dataTable</title>
	<jsp:include page="/WEB-INF/views/common/common-css.jsp" />
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/datatables/css/semantic.min.css"/> --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/datatables/css/semantic.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/datatables/css/dataTables.semanticui.min.css" />
 
	<jsp:include page="/WEB-INF/views/common/common-js.jsp" />
	
	<script src="${pageContext.request.contextPath}/resources/js/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.semanticui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/datatables/semantic.min.js"></script>
<!-- 	<script src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js" /></script> -->
	
	<script>
	
	$(function() { 
		//example1
		$('#example').DataTable({
			language: {
				paginate:{
					previous: "이전",
					next: "다음"
				}
			}
		});
		
		//example2
		var t = $('#example2').DataTable({
			processing : true, 
			ajax: { url: "./jsonViewTest" }, 
			columns: [
							{ title: 'No', data: 'idx',},
// 							{ title: 'No', data: null,},
					      	{ title: '제목', data: 'title', orderable: false}, 
					      	{ title: '등록날짜', data: 'createDate' }, 
// 					      	{	title: '업무기록', 
// 					      		data: null, 
// 					      		mRender: function(o) {return '<span class="badge badge-primary">'+ o.recCnt +'</span>'}
// 					      	},
// 					      	{ title: '수정 날짜', data: "modDate", visible: false, searchable: false },
// 					      	{ title: '작성자 아이디', data: "userId", "visible": false, searchable: false },
					      	{ title: 'idx', data: "idx", "visible": false }
						    ],
			language: {
				paginate:{
					previous: "◀",
					next: "▶"
				}
			},
			order: [ [1, "desc"] ]
//자동 No 등록, sort가 안된다. 
// 			fnDrawCallback: function(oSettings) {
// 	            if ( oSettings.bSorted || oSettings.bFiltered )
// 	            {
// 	                for ( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ )
// 	                {
// 	                    $('td:eq(0)', oSettings.aoData[i].nTr ).html( i+1 );
// 	                }
// 	            }
// 			},
		});
		
		//row click event
// 		$('#customerList tbody').on('click', 'tr', function() {
// 			var rowData = $('#customerList').DataTable().row(this).data();
			
// 			window.location.href = "./customerEdit?custSeq=" + rowData.custSeq
// 		});
		
// 		/* 등록 화면 이동 */
// 		$('#btnCreCustomer').on('click', function() {
// 			window.location.href = "./customerEdit";
// 		});
		
	});
	</script>
	
</head>
<body>
<h1>
	DataTable
</h1>

<div style="width: 50%; padding-left: 20px;">
	<!-- 기본 테이블 -->
	<table id="example" class="ui celled table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Position</th>
				<th>Office</th>
				<th>Age</th>
				<th>Start date</th>
				<th>Salary</th>
			</tr>
		</thead>
			<tbody>
				<tr>
					<td>Tiger Nixon</td>
					<td>System Architect</td>
					<td>Edinburgh</td>
					<td>61</td>
					<td>2011/04/25</td>
					<td>$320,800</td>
				</tr>
			</tbody>
	</table>
</div>
<br/><br/><br/>

<div style="width: 50%; padding-left: 20px;">
	<table id="example2" class="ui celled table hover">
	</table>
</div>
<br/><br/><br/>

<div style="width: 50%; padding-left: 20px;">
<form id="frm-example3" action="${pageContext.request.contextPath}/dataTableTest" method="post">
<p><button>삭제</button></p>
<pre id="example3-console"></pre>
	<table id="example3" class="ui celled table hover">
	<thead>
      <tr>
         <th class="dt-head-center sorting_disabled" style="width: 20px;">
         	<input name="select_all" value="1" type="checkbox">
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
	<script>
	$(document).ready(function (){
		// Array holding selected row IDs
		var rows_selected = [];
		var table = $('#example3').DataTable({
		   'ajax': 'https://api.myjson.com/bins/1us28',
		   'columnDefs': [{
		      'targets': 0,
		      'searchable':false,
		      'orderable':false,
		      'width':'1%',
		      'className': 'dt-body-center',
		      'render': function (data, type, full, meta){
		          return '<input type="checkbox">';
		      }
		   }],
		   'order': [1, 'asc']
// 		   'rowCallback': function(row, data, dataIndex){
// 		      // Get row ID
// 		      var rowId = data[0];

// 		      // If row ID is in the list of selected row IDs
// 		      if($.inArray(rowId, rows_selected) !== -1){
// 		         $(row).find('input[type="checkbox"]').prop('checked', true);
// 		         $(row).addClass('selected');
// 		      }
// 		   }
		});
		
// 		//cells 클릭시 체크박스 선택 이벤트
// 		$('#example3').on('click', 'tbody td, thead th:first-child', function(e){
// 		   $(this).parent().find('input[type="checkbox"]').trigger('click');
// 		});
		
		$('#example3 tbody').on('click', 'input[type="checkbox"]', function(e){
		   var $row = $(this).closest('tr');

		   // Get row data
		   var data = table.row($row).data();

		   // Get row ID
		   var rowId = data[0];

		   // Determine whether row ID is in the list of selected row IDs 
		   var index = $.inArray(rowId, rows_selected);

		   // If checkbox is checked and row ID is not in list of selected row IDs
		   if(this.checked && index === -1){
		      rows_selected.push(rowId);

		   // Otherwise, if checkbox is not checked and row ID is in list of selected row IDs
		   } else if (!this.checked && index !== -1){
		      rows_selected.splice(index, 1);
		   }

		   if(this.checked){
		      $row.addClass('selected');
		   } else {
		      $row.removeClass('selected');
		   }

		   // Update state of "Select all" control
		   updateDataTableSelectAllCtrl(table);

		   // Prevent click event from propagating to parent
		   e.stopPropagation();
		});
	
		// Handle click on "Select all" control
		$('thead input[name="select_all"]').on('click', function(e){
		   if(this.checked){
		      $('#example3 tbody input[type="checkbox"]:not(:checked)').trigger('click');
		   } else {
		      $('#example3 tbody input[type="checkbox"]:checked').trigger('click');
		   }
	
		   e.stopPropagation();
		});
		
		function updateDataTableSelectAllCtrl(table){
			var $table					= table.table().node();
			var $chkbox_all			= $('tbody input[type="checkbox"]', $table);
			var $chkbox_checked	= $('tbody input[type="checkbox"]:checked', $table);
			var chkbox_select_all	= $('thead input[name="select_all"]', $table).get(0);

			// If none of the checkboxes are checked
			if($chkbox_checked.length === 0){
			   chkbox_select_all.checked = false;
			   if('indeterminate' in chkbox_select_all){
			      chkbox_select_all.indeterminate = false;
			   }

			// If all of the checkboxes are checked
			} else if ($chkbox_checked.length === $chkbox_all.length){
			   chkbox_select_all.checked = true;
			   if('indeterminate' in chkbox_select_all){
			      chkbox_select_all.indeterminate = false;
			   }

			// If some of the checkboxes are checked
			} else {
			   chkbox_select_all.checked = true;
			   if('indeterminate' in chkbox_select_all){
			      chkbox_select_all.indeterminate = true;
			   }
			}
		}
		
		// Handle table draw event
		table.on('draw', function(){
		   // Update state of "Select all" control
		   updateDataTableSelectAllCtrl(table);
		});
		
		// Handle form submission event 
		$('#frm-example3').on('submit', function(e){
		   var form = this;

		   // Iterate over all selected checkboxes
		   $.each(rows_selected, function(index, rowId){
		      // Create a hidden element 
		      $(form).append(
		          $('<input>')
		             .attr('type', 'hidden')
		             .attr('name', 'id')
		             .val(rowId)
		      );
		   });

		   // FOR DEMONSTRATION ONLY
		   form.submit();
		   
		   // Output form data to a console     
		   $('#example3-console').text($(form).serialize());
		   console.log("Form submission", $(form).serialize());
		    
		   // Remove added elements
		   $('input[name="id\[\]"]', form).remove();
		   
		    
		   // Prevent actual form submission
		   e.preventDefault();
		});
		
	});
	</script>
</form>
</div>
</body>
</html>

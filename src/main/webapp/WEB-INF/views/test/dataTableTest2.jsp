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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/datatables/css/jquery.dataTables.css"/>
	<link rel="stylesheet" href="https://cdn.datatables.net/select/1.1.2/css/select.dataTables.min.css" />
	
	<jsp:include page="/WEB-INF/views/common/common-js.jsp" />
	
	<script src="${pageContext.request.contextPath}/resources/js/datatables/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js" /></script>
	
	<style type="text/css">
	table.dataTable.select tbody tr,
	table.dataTable thead th:first-child {
	  cursor: pointer;
	}
	</style>
	
	<script>
		$(function() { 
			//example1
			$('#example').DataTable( {
	        columnDefs: [ {
	            orderable: false,
	            className: 'select-checkbox',
	            targets:   0
	        } ],
	        select: {
	            style:    'os',
	            selector: 'td:first-child'
	        },
	        order: [[ 1, 'asc' ]]
	    	} );
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
					<td></td>
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
	<table id="example3" class="display">
   <thead>
      <tr>
         <th><input name="select_all" value="1" type="checkbox"></th>
         <th>Name</th>
         <th>Position</th>
         <th>Office</th>
         <th>Extn.</th>
         <th>Start date</th>
         <th>Salary</th>
      </tr>
   </thead>
   <tfoot>
      <tr>
         <th></th>
         <th>Name</th>
         <th>Position</th>
         <th>Office</th>
         <th>Extn.</th>
         <th>Start date</th>
         <th>Salary</th>
      </tr>
   </tfoot>
</table>

<script>

//
//Updates "Select all" control in a data table
//
function updateDataTableSelectAllCtrl(table){
var $table             = table.table().node();
var $chkbox_all        = $('tbody input[type="checkbox"]', $table);
var $chkbox_checked    = $('tbody input[type="checkbox"]:checked', $table);
var chkbox_select_all  = $('thead input[name="select_all"]', $table).get(0);

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
   'order': [1, 'asc'],
   'rowCallback': function(row, data, dataIndex){
      // Get row ID
      var rowId = data[0];

      // If row ID is in the list of selected row IDs
      if($.inArray(rowId, rows_selected) !== -1){
         $(row).find('input[type="checkbox"]').prop('checked', true);
         $(row).addClass('selected');
      }
   }
});

// Handle click on checkbox
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

// Handle click on table cells with checkboxes
$('#example3').on('click', 'tbody td, thead th:first-child', function(e){
   $(this).parent().find('input[type="checkbox"]').trigger('click');
});

// Handle click on "Select all" control
$('thead input[name="select_all"]', table.table().container()).on('click', function(e){
   if(this.checked){
      $('#example3 tbody input[type="checkbox"]:not(:checked)').trigger('click');
   } else {
      $('#example3 tbody input[type="checkbox"]:checked').trigger('click');
   }

   // Prevent click event from propagating to parent
   e.stopPropagation();
});

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
             .attr('name', 'id[]')
             .val(rowId)
      );
   });

   // FOR DEMONSTRATION ONLY     
   
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
</div>
</body>
</html>

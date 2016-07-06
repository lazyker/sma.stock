<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<head>
	<title>Datepicker</title>
	<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet"  />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.css" rel="stylesheet" />
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/datepicker/locales/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
	
	<script>
	$(document).ready(function() {

		var holidays = {
			'2016-04-13':{year : '2016', tooltip:'선거일'}
		};

		$('#date').datepicker({
		       format: 'yyyy-mm-dd',
		       todayHighlight: true,
		       autoclose: true,
		       language: "kr",
		       beforeShowDay: function(Date) {
		    	   var result;
// 		            var holiday = holidays[$.fn.datepicker.DPGlobal.formatDate(day, "yyyymmdd", 'en')];
// 		            var thisYear = $.fn.datepicker.DPGlobal.formatDate(day, "yyyy", 'en');
					var dateVal = {
							dd : (Date.getDate() < 10 ? '0' : '') + Date.getDate(),
							mm : (Date.getMonth()+1 < 10 ? '0' : '') + (Date.getMonth()+1),
							yyyy : Date.getFullYear()
					}

					var curr_date		= dateVal.yyyy + '-' + dateVal.mm + '-' + dateVal.dd;
					var holiday = holidays[curr_date]; 
					
					if (holiday) {
						if(dateVal.yyyy == holiday.year || holiday.year == "") {
							result = {classes: 'date-sunday', tooltip: holiday.tooltip};
						}
					}
		 
		            if(!result) {
		                switch (Date.getDay()) {
		                    case 0: // is sunday?
		                        result = {classes : 'date-sunday'}
		                        break;
		                    case 6: // is saturday?
		                    	result = {classes : 'date-saturday'}
		                    	break;
		                    default:
		                        result = true;
		                        break;
		                }
		            }
		 
		            return result;
		       }
		});
	// Element Attribute Helper
	});
	
	</script>
	
	<style>
.date-sunday { color:red; font-weight:bold; !important; }
.date-saturday { color:blue; font-weight:bold; !important; }
</style>
</head>
<body>
<h1>
	Datepicker
</h1>


<div class="row">
      <div class="modal-alerts"></div>
      <div id="datepicker" role="form" class="form-horizontal"></div>
      <label for="from" class="col-sm-1 control-label">Date</label>
         <input id="date" type="text" name="date" class="form-control "/>
</div>

</body>
</html>

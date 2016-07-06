<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<head>
	<title>datepicker</title>
	<jsp:include page="/WEB-INF/views/common/common-css.jsp" />
	<jsp:include page="/WEB-INF/views/common/common-js.jsp" />
	<script>
	var  today = "${today}";
	
	var holidays = {
		    "0209":{type:0, title:"설날", year:"2016"},
		    "0210":{type:0, title:"설날", year:"2016"},
		    "0211":{type:0, title:"설날", year:"2016"},
		    "0918":{type:0, title:"추석", year:"2016"},
		    "0919":{type:0, title:"추석", year:"2016"},
		    "0920":{type:0, title:"추석", year:"2016"},
		    "0413":{type:0, title:"선거일", year:"2016"},
		    "0517":{type:0, title:"석가탄신일", year:"2016"},
		    
		    //고정
		    "0101":{type:0, title:"신정", year:""},
		    "0301":{type:0, title:"삼일절", year:""},
		    "0505":{type:0, title:"어린이날", year:""},
		    "0606":{type:0, title:"현충일", year:""},
		    "0815":{type:0, title:"광복절", year:""},
		    "1003":{type:0, title:"개천절", year:""},
		    "1009":{type:0, title:"한글날", year:""},
		    "1225":{type:0, title:"크리스마스", year:""}
		};
	
	$(function() { 
		  $( "#datepicker" ).datepicker({
			  beforeShowDay: function(day) {
		            var result;
		            var holiday = holidays[$.datepicker.formatDate("mmdd",day )];
		            var thisYear = $.datepicker.formatDate("yy", day);

		            // exist holiday?
		            if (holiday) {
		                if(thisYear == holiday.year || holiday.year == "") {
		                    result =  [true, "date-sunday", holiday.title];
		                }
		            }
		 
		            if(!result) {
		                switch (day.getDay()) {
		                    case 0: //일요일
		                        result = [true, "date-sunday"];
		                        break;
		                    case 6: //토요일
		                        result = [true, "date-saturday"];
		                        break;
		                    default:
		                        result = [true, ""];
		                        break;
		                }
		            }
		 
		            return result;
		        }
		  });
		
		 //특수문자 제거 ex)2016-04-30 | 20160430
// 		console.log(removeSpecialChar($("#datepicker").val()));
	});
	
	</script>
	
</head>
<body>
<h1>
	Datepicker
</h1>

생년월일: <input type="text" id="datepicker">

</body>
</html>

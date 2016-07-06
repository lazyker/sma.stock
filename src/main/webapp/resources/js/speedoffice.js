/**
 * by lazyker
 */

var public_vars = public_vars || {};
;(function($, window, undefined){

	
})(jQuery, window);


//var date = function() {
//}

/**
 * 입력값에서 콤마 삭제
 */
function removeComma(input){
	return input.value.replace(/,/gi,"");
}

/**
 * 입력값에서 특수문자 제거
 */
function removeSpecialChar(input){
	if (input.length > 1){
		var pattern = /[^(0-9)]/gi;
		return input.replace(pattern,"");
	}
}

/**
 * 선택된 라디오버튼이 있는지 체크한다
 */
function hasCheckedRadio(input){
   if (input.length > 1){
         for (var inx = 0; inx < input.length; inx++){
                if (input[inx].checked) return true;
         }
   }else{
         if (input.checked) return true;
   }
   return false;
}
/**
 * 선택된 체크박스가 있는지 체크
 */
function hasCheckedBox(input){
   return hasCheckedRadio(input);
}
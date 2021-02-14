<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

 <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
</style>

<script >


function fn_pwSearch(){
	var m_id= '${loginDto.m_id}';
	var m_pw= $('#userPw').val();
	var Obj={
			'm_id':m_id
	};
	$.ajax({
		url:'memberPwSearch.member',
		type:'post',
		data: JSON.stringify(Obj),
		contentType:'application/json',
		dataType:'json',
		success:function(data){
			if(m_pw==data.result){
				alert('성공');	//지울것
				location.href='memberView.member';
			}else{
				alert('비밀번호가 틀립니다');
			}
		},
		error: function(){
			alert('실패');
		}
	});
}
</script>

	<div id="wrap">
	    <br>
	  	  <b><font size="4" color="gray">비밀번호 확인</font></b>
	    <hr size="1" width="460">
	    <br>
	    <div id="chk">
	        <form id="checkForm">
	            <input type="text" name="pwinput" id="userPw">
	            <input type="button" value="확인" id="pwcheck"onclick="fn_pwSearch()"/>
	        </form>
	    <div id="msg"></div>
	        <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
    	</div>
	</div> 
</body>
</html>


<%@ include file="../template/footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="클럽 내용 상세 보기" name="title" />
</jsp:include>

<link rel="stylesheet" href="resources/style/common.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script>
/* 	$(function() {
		$('#btn1').click(function() {
			$(this).val('탈퇴하기');
			var m_enjoy = $('input[name=m_enjoy]').val();
			var m_no = $('input[name=m_no]').val();
			
			var send = {"m_enjoy": m_enjoy, "m_no": m_no};
			
			$.ajax({
				url: 'updateStat.club',
				type: 'put',
				data: send,
				dataType: 'json',
				success: function(responseJson) {
					if(responseJson.updateResult == 1) {
						alert('성공');
						$('#btn1').val('참여하기');
					} else {
						alert('실패실패');
					}
				},
				error: function() {
					alert('실패');
				}
			});
			
			
			});
		}); */
</script>

<script type="text/javascript">
		function fn_delete(f) {
			if (confirm('정말 클럽을 해제하시겠습니까?')) {
				f.action='clubDelete.club';
				f.submit();
			}
		}
		
		function fn_update(f) {
			if (confirm('클럽 정보를 수정하시겠습니까?')) {
				f.action='clubUpdatePage.club';
				f.submit();
			}
		}
</script>

 <script>
 	var afterUpdate = ${afterUpdate};
	if (afterUpdate) {
		var afterUpdate = ${afterUpdate};
		if (afterUpdate > 0) {
			alert('수정되었습니다.');
		} else {
			alert('실패했습니다.');
		}
	} 
</script>

<form method="post">

	<div class="wrap">

		<div class="thumnail">
			<img alt="${clubDto.c_mainImg}" src="resources/images/club/${clubDto.c_mainImg}">
		</div>

		<c:if test="${clubDto.m_no ne loginDto.m_no}">
			<div class="side">

				<div class="side_content">
					<span id="content">${clubDto.c_title}</span>
				</div>

				<div class="side_content">
					<span id="content">활동 시작일 : ${clubDto.c_startDate}</span>
				</div>

				<div class="side_content">
					<span id="content">활동 종료일 : ${clubDto.c_endDate}</span>
				</div>

				<div class="side_content">
					<c:if test="${empty clubListDto.cl_no}">
						<input type="button" value="참여하기" id="btn1"/>
					</c:if>
					
					<c:if test="${not empty clubListDto.cl_no}">
						<input type="button" value="탈퇴하기" id="btn1" />
					</c:if>
					
				</div>
			</div>
		</c:if>

		<c:if test="${clubDto.m_no eq loginDto.m_no}">
			<div class="side">

				<div class="side_content">
					<span id="content">${clubDto.c_title}</span>
				</div>

				<div class="side_content">
					<span id="content">활동 시작일 : ${clubDto.c_startDate}</span>
				</div>

				<div class="side_content">
					<span id="content">활동 종료일 : ${clubDto.c_endDate}</span>
				</div>

				<%-- hidden --%>
				<input type="hidden" name="c_no" value="${clubDto.c_no}" />
				<input type="hidden" name="c_mainImg" value="${clubDto.c_mainImg}" />
				<input type="hidden" name="c_title" value="${clubDto.c_title}" />
				<input type="hidden" name="c_min" value="${clubDto.c_min}" />
				<input type="hidden" name="c_max" value="${clubDto.c_max}" />
				<input type="hidden" name="c_startDate" value="${clubDto.c_startDate}" />
				<input type="hidden" name="c_endDate" value="${clubDto.c_endDate}" />
				<input type="hidden" name="c_content" value="${clubDto.c_content}" />

				<div class="side_content">
					<input type="button" value="장소등록하기" onclick="location.href='placeListPage.place'" /> 
					<input type="button" value="클럽수정하기" onclick="fn_update(this.form)" /> 
					<input type="button" value="클럽해제하기" onclick="fn_delete(this.form)" />
				</div>
			</div>
		</c:if>

		<div class="contents-wrap">
			<div class="content">
				<span id="title">클럽명</span> <span id="content">${clubDto.c_title}</span>
			</div>

			<div class="content">
				<span id="title">리더 소개</span> <span id="content">${memberDto.m_nick}</span>
			</div>

			<div class="content">
				<span id="title">클럽내용</span> <span id="content">${clubDto.c_content}</span>
			</div>

			<div class="content">
				<span id="content">${clubDto.c_img1}</span> <span id="content">${clubDto.c_subContent1}</span>
			</div>

			<div class="content">
				<span id="content">${clubDto.c_img2}</span> <span id="content">${clubDto.c_subContent2}</span>
			</div>

			<div class="content">
				<span id="content">${clubDto.c_img3}</span> <span id="content">${clubDto.c_subContent3}</span>
			</div>
		</div>
		
		<input type="button" value="목록으로 돌아가기" onclick="location.href='clubListPage.club'" />
	</div>

</form>

<%@ include file="../template/footer.jsp"%>
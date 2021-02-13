<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="클럽 활동 목록" name="title" />
</jsp:include>
<link rel="stylesheet" href="resources/style/common.css" />
<link rel="stylesheet" href="resources/style/club/clubList.css" />

<script>

var afterInsert = ${afterInsert};
if (afterInsert) {  
	var insertResult = ${insertResult};
	if (insertResult > 0) {   
		alert('삽입되었습니다.');
	} else {
		alert('실패하였습니다.');
	}
}

var afterDelete = ${afterDelete};
if (afterDelete) {
	var afterDelete = ${afterDelete};
	if (afterDelete > 0) {
		alert('삭제되었습니다.');
	} else {
		alert('실패했습니다.');
	}
} 

</script>

<form method="get">
	<div class="body_wrap">
		<span id="title">정기 활동</span>
		<div id="btn_create">
			<c:if test="${loginDto ne null}">
				<input type="button" id="btn_create" value="새 클럽 등록하기"
					onclick="location.href='clubInsertPage.club'" />
			</c:if>
		</div>
	</div>

	<c:if test="${empty list}">
		<div id="none_content">등록된 클럽이 없습니다.</div>
	</c:if>

	<c:if test="${not empty list}">
		<c:forEach var="clubDto" items="${list}">
			<div class="group-list row">
				<div class="col-4">
					<a class="ns" href="clubViewPage.club?c_no=${clubDto.c_no}&m_no=${clubDto.m_no}">
						<div class="group-card" style="height: 300px;">
							<div class="group-image" style="position: relative;">
								<img class="img" alt="${clubDto.c_mainImg}" src="resources/images/club/${clubDto.c_mainImg}">
								<div class="group-desc">
									<div class="title-container" style="hegiht: 300px;"></div>
									<div class="title-content">
										<div class="title inline">${clubDto.c_title}</div>
										<p class="twoline">${clubDto.c_desc}</p>
									</div>
								</div>
							</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</c:if>
</form>

<%@ include file="../template/footer.jsp"%>

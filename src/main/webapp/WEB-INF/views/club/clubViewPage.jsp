<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="클럽 내용 상세 보기" name="title" />
</jsp:include>

<link rel="stylesheet" href="resources/style/common.css" />
<link rel="stylesheet" href="resources/style/club/clubView.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

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
		
		function fn_joinClub(f) {
			if (confirm('해당 클럽을 참여하시겠습니까?')) {
				f.action = 'joinClub.club';
				f.submit();
			}
		}
			
		function fn_chkOut(f) {
			if (confirm('해당 클럽을 탈퇴하시겠습니까?')) {
				f.action = 'chkOutClub.club';
				f.submit();
			}
		}
		
		function fn_likeClub(f) {
				f.action = 'likeClub.club';
				f.submit();
		}
		
		function fn_unlikeClub(f) {
				f.action = 'unLikeClub.club';
				f.submit();
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
	
	var afterJoin = ${afterJoin};
	if (afterJoin) {
		var joinResult = ${joinResult};
		if (joinResult > 0) {
			alert('클럽에 가입되었습니다.');
		} else {
			alert('실패했습니다.');
		}
	}
	
	var afterChkOut = ${afterChkOut};
	if (afterChkOut) {
		var chkOutResult = ${chkOutResult};
		if (chkOutResult > 0) {
			alert('클럽을 탈퇴했습니다.');
		} else {
			alert('실패했습니다.');
		}
	} 
	
</script>

<form method="post">

	<div class="body_wrap">

		<div class="left_side">
			<div class="thumnail">
				<img alt="${clubDto.c_mainImg}" src="resources/images/club/${clubDto.c_mainImg}">
			</div>
		
			<div class="contents">
				<span id="title">클럽명</span> 
				<div id="content">${clubDto.c_title}</div>
			</div>

			<div class="contents">
				<span id="title">한 줄 설명</span> 
				<div id="content">${clubDto.c_desc}</div>
			</div>
	
			<div class="contents">
				<span id="title">리더 소개</span> 
				<div id="content">${memberDto.m_nick}</div>
			</div>

			<div class="contents">
				<span id="title">클럽내용</span> 
				<div id="content">${clubDto.c_content}</div>
			</div>

			<div class="contents">
				<span id="content">${clubDto.c_img1}</span>
				 <div id="content">${clubDto.c_subContent1}</div>
			</div>

			<div class="contents">
				<span id="content">${clubDto.c_img2}</span>
				<div id="content">${clubDto.c_subContent2}</div>
			</div>

			<div class="contents">
				<span id="content">${clubDto.c_img3}</span> 
				<div id="content">${clubDto.c_subContent3}</div>
			</div>
			
			<div class="contents">
				<div id="content">${clubDto.c_postDate}</div>
			</div>
			
		</div>
		
		<div class="right_side">
			<c:if test="${clubDto.m_no ne loginDto.m_no}">

				<div class="side_content">
					<span id="content">${clubDto.c_title}</span>
				</div>
				
				<br/><br/>
				
				<div class="side_content">
					<span id="content">활동 시작일 : ${clubDto.c_startDate}</span>
				</div>

				<br/>

				<div class="side_content">
					<span id="content">활동 종료일 : ${clubDto.c_endDate}</span>
				</div>
				
				<br/><br/>

				<input type="hidden" name="c_no" value="${clubDto.c_no}" />
				<input type="hidden" name="m_no" value="${loginDto.m_no}" />

				<div class="side_content">
					<c:if test="${clubListDto.m_no ne loginDto.m_no}">
						<input type="button" value="참여하기" id="btn1" onclick="fn_joinClub(this.form)" />
					</c:if>
					
					<c:if test="${clubListDto.m_no eq loginDto.m_no}">
						<input type="button" value="탈퇴하기" id="btn1" onclick="fn_chkOut(this.form)"/>
					</c:if>
					
					<c:if test="${wishListDto.m_no ne loginDto.m_no}">
						<input type="button" value="♥" id="btn2" onclick="fn_likeClub(this.form)" />
					</c:if>
					
					<c:if test="${wishListDto.m_no eq loginDto.m_no}">
						<input type="button" value="♡" id="btn2" onclick="fn_unlikeClub(this.form)"/>
					</c:if>
					
				</div>
			</c:if>
		</div>

		<c:if test="${clubDto.m_no eq loginDto.m_no}">
			<div class="right_side">

				<div class="side_content">
					<span id="content">${clubDto.c_title}</span>
				</div>
				
				<br/><br/>
				
				<div class="side_content">
					<span id="content">활동 시작일 : ${clubDto.c_startDate}</span>
				</div>

				<br/>

				<div class="side_content">
					<span id="content">활동 종료일 : ${clubDto.c_endDate}</span>
				</div>
				
				<br/><br/>

				<%-- hidden --%>
				<input type="hidden" name="c_no" value="${clubDto.c_no}" />
				<input type="hidden" name="m_no" value="${loginDto.m_no}" />
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
		
	</div>
	
		<input type="button" value="목록으로 돌아가기" onclick="location.href='clubListPage.club'" />
	

</form>

<%@ include file="../template/footer.jsp"%>

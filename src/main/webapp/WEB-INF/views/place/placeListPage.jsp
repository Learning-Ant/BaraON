<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param value="BaraON :: 공간목록" name="title"/>
</jsp:include>

<link rel="stylesheet" href="resources/style/place/place-list.css">

<script>
	let imgList = JSON.parse('${imgList}');
	let categoryNo = '${param.categoryNo}';
	$(function(){
		$.each(imgList, function(idx, img){
			$.each(img, function(i, placeImg){
				let imgTag = '<img class="list-thumbnail" alt="'+placeImg+'" src="resources/images/PlaceImages/'+placeImg+'">';
				if (i==0){
					$('.thumbnail-box').eq(idx).append($(imgTag).css('display', 'block'));
				} else {
					$('.thumbnail-box').eq(idx).append($(imgTag).css('display', 'none'));
				}
			}); 
		});
		if(categoryNo != ''){
			$('div.category').eq(categoryNo-1).css('background','rgba(95, 158, 160, 1)');
		}
	})

	
</script>

<h1 class="title">어떤 공간을 찾고 있나요?</h1>

<div class="category-wrap">
	<div class="category-list">
		<c:if test="${categoryList eq null}" >
			<h4>아직 카테고리가 없네요!</h4>
		</c:if>
		<c:if test="${categoryList ne null}">
			<c:forEach var="categoryDto" items="${categoryList}" >
				
				<div class="category" >
					<a href="placeListPage.place?categoryNo=${categoryDto.pc_no}">
					<strong>${categoryDto.pc_name}</strong>
					</a>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>

<div class="list-wrap">
	<h3 class="subtitle">공간 목록</h3>
	<c:if test="${isSeller}">
		<a id="insert-btn" href="placeInsertPage.place">공간등록하기</a>
	</c:if>
	<c:if test="${empty list}">
		<div class="empty-list-box" >등록된 공간이 없어요!</div>
	</c:if>
	<c:if test="${not empty list}">
		<div class="place-list-wrap">
		<c:forEach var="placeList" items="${list}" >
			<article class="place-list">

				<a href="placeViewPage.place?no=${placeList.p_no}">
					<div class="thumbnail-box">
					</div>
					<div class="place-list-info" >
						<h3>${placeList.p_title}</h3>
						<div class="place-list-detail">
							<span id="place-list-addr"><i class="fas fa-map-marker-alt"></i>${placeList.p_bname}</span>
							<span id="place-list-category"># ${placeList.pc_name}</span><br/>

						</div>
						<div id="info-price">
							<strong class="place-price" >${placeList.minPrice}</strong>
							<span class="txt-unit" >원/일</span>
						</div>
						<div id="info-people-reviews">
							<span>
								<i class="fas fa-user-friends"></i>최대 ${placeList.maxPeople}인
							</span>
							<span>
								<i class="fas fa-comment-dots"></i>${placeList.rvCount}
							</span>
						</div>
					</div>
				</a>
			</article>
		</c:forEach>
		</div>	
	</c:if>
</div>

<%@ include file="../template/footer.jsp" %>
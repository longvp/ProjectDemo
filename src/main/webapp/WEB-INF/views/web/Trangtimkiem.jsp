<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>	TÌM KIẾM</title>

<jsp:include page="/resources/web/common/lib.jsp" />

</head>
<body>

	<jsp:include page="/resources/web/common/header.jsp" />
		
	<main style="background-color: white;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1 p-0 bg-light"></div>
				<div class="col-md-11 p-0">
					 <ul class="breadcrumbs">
                        <li><a href="/home">Trang chủ</a></li>
                        <li><span>Tìm kiếm</span></li>
                    </ul>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-md-12">
					<h5 class="text-center mb-5" style="color: #323b3d;">Tìm thấy ${soKetQua } kết quả của từ khóa "<span style="color: red;">${tenSearch }</span>"</h5>
					<div id="tab" class="row product">
						<c:forEach var="item" items="${listsanphamtheoten }">
							<div class="col-md-3 col-sm-6">
								<div class="sp p-5">
									<a href="/chitiet/${item.id }"><img src="<c:url value="/resources/web/imgs/${item.danhMuc.maDanhMuc }/${item.hinhSanPham }" />" alt="" width="100%"></a>
									<a href="/chitiet/${item.id }" class="name-sp">${item.tenSanPham }</a>
									<div class="price">
									<fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.giaTien }" />								
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<%-- <ul class="pagination pagination-sm mt-5 d-flex justify-content-center">
						<c:forEach var="i" begin="1" end="${totalPage }">
							<c:choose>
								<c:when test="${i == 1 }">
									<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
								</c:when>
								<c:when test="${i > 1 }">
									<li class="page-item"><a class="page-link" href="#">${i }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul> --%>
				</div>
			</div>
		</div>
	</main>
	<!-- Body end -->
	
	<jsp:include page="/resources/web/common/footer.jsp" />

</body>
</html>
<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>

<jsp:include page="/resources/web/common/lib.jsp" />


</head>
<body>

	<%-- <%@include file="/resources/web/common/header.jsp" %> --%>
	<jsp:include page="/resources/web/common/header.jsp" />

	<!-- Body -->
	<main>
		<div class="container-fluid p-0">
			<div class="row">
				<div class="col-md-12">
					<div id="carouselExampleInterval" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="3000">
								<img
									src="<c:url value="/resources/web/imgs/banner/banner-5.png"/>"
									class="d-block w-100" alt="">
								<div class="caption-group" data-aos="fade-up"
									data-aos-anchor-placement="center-center"
									data-aos-duration="2000">
									<h2 class="caption title">
										Hot <span class="primary">Smart <strong>Phone</strong></span>
									</h2>
									<h4 class="caption subtitle">Dual SIM</h4>
									<a class="caption button-radius" href="#"><span
										class="icon"></span>Shop now</a>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="3000">
								<img src="/resources/web/imgs/banner/banner-6.png"
									class="d-block w-100" alt="">
								<div class="caption-group">
									<h2 class="caption title">
										iPhone <span class="primary">6 <strong>Plus</strong></span>
									</h2>
									<h4 class="caption subtitle">Dual SIM</h4>
									<a class="caption button-radius" href="#"><span
										class="icon"></span>Shop now</a>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="3000">
								<img src="/resources/web/imgs/banner/banner-7.png"
									class="d-block w-100" alt="">
								<div class="caption-group">
									<h2 class="caption title">
										by one, get one <span class="primary">50% <strong>off</strong></span>
									</h2>
									<h4 class="caption subtitle">school supplies & backpacks.*</h4>
									<a class="caption button-radius" href="#"><span
										class="icon"></span>Shop now</a>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="3000">
								<img src="/resources/web/imgs/banner/banner-8.png"
									class="d-block w-100" alt="">
								<div class="caption-group">
									<h2 class="caption title">
										Apple <span class="primary">Store <strong>Ipod</strong></span>
									</h2>
									<h4 class="caption subtitle">Select Item</h4>
									<a class="caption button-radius" href="#"><span
										class="icon"></span>Shop now</a>
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleInterval"
							role="button" data-bs-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleInterval"
							role="button" data-bs-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Next</span>
						</a>
					</div>
					
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row mb-5">
				<div class="col-md-1 p-0"></div>
				<div class="col-md-10 p-0 d-flex justify-content-center">
					<div class="sp-title sp-new sp-active ts">
						<span>Sản phẩm mới nhất</span> <i class="fas fa-caret-down"></i>
					</div>
					<div class="sp-title sp-pop ts">
						<span>Sản phẩm nổi bật</span> <i class="fas fa-caret-down"></i>
					</div>
					<div class="sp-title sp-buys ts">
						<span>Sản phẩm mua nhiều</span> <i class="fas fa-caret-down"></i>
					</div>
				</div>
				<div class="col-md-1 p-0"></div>
			</div>
		</div>
		<div class="container mt-5">
			<div class="show-sp-moi ls">
				<div class="row">
					<c:forEach var="item" items="${listsanpham }">
						<c:if test="${item.news == '1' }">
							<div class="col-md-3 col-sm-6">
								<div class="sp">
									<a href="/chitiet/${item.id }"><img
										src="<c:url value="/resources/web/imgs/${item.danhMuc.maDanhMuc }/${item.hinhSanPham }" />"
										alt="" width="100%"></a> <span class="new">NEW</span> <a
										href="/chitiet/${item.id }" class="name-sp">${item.tenSanPham }</a>
									<div class="price"><fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.giaTien }" /></div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="show-sp-noi-bat ls">
				<div class="row">
					<c:forEach var="item" items="${listsanpham }">
						<c:if test="${item.hots == '1' }">
							<div class="col-md-3 col-sm-6">
								<div class="sp">
									<a href="/chitiet/${item.id }"><img
										src="<c:url value="/resources/web/imgs/${item.danhMuc.maDanhMuc }/${item.hinhSanPham }" />"
										alt="" width="100%"></a> <span class="hot">HOT</span> <a
										href="/chitiet/${item.id }" class="name-sp">${item.tenSanPham }</a>
									<div class="price"><fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.giaTien }" /></div>
									
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="show-sp-mua-nhieu ls">
				<div class="row">
					<c:forEach var="item" items="${listsanpham }">
						<c:if test="${item.buys == '1' }">
							<div class="col-md-3 col-sm-6">
								<div class="sp">
									<a href="/chitiet/${item.id }"><img
										src="<c:url value="/resources/web/imgs/${item.danhMuc.maDanhMuc }/${item.hinhSanPham }" />"
										alt="" width="100%"></a> <a href="/chitiet/${item.id }"
										class="name-sp">${item.tenSanPham }</a>
									<div class="price"><fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.giaTien }" /></div>
									
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>

		<c:forEach var="itemdanhmuc" items="${listdanhmuc }">
			<c:set var="iddanhmuc" value="${itemdanhmuc.id }" />

			<div class="container mt-5" >
				<div class="row">
					<div class="col-md-12 ">
						<div class="header-title">
							<a href="<c:url value="/danh-muc/${itemdanhmuc.id }" />">${itemdanhmuc.tenDanhMuc }</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 ad">
						<a href="<c:url value="/danh-muc/${itemdanhmuc.id }" />"><img
							src="<c:url value="/resources/web/imgs/${itemdanhmuc.maDanhMuc }/${itemdanhmuc.hinhQuangCao }" />"
							alt="" width="100%"></a>
					</div>
					<div class="col-md-9">
						<div class="row product">
							<c:forEach var="itemsanpham" items="${listsanphamlimit }">
								<c:if test="${itemsanpham.danhMuc.id == iddanhmuc}">
									<div class="col-md-3 col-sm-6">
										<div class="sp">
											<a href="/chitiet/${itemsanpham.id }"><img
												src="<c:url value="/resources/web/imgs/${itemsanpham.danhMuc.maDanhMuc }/${itemsanpham.hinhSanPham }" />"
												alt="" width="100%"></a> <a
												href="/chitiet/${itemsanpham.id }" class="name-sp">${itemsanpham.tenSanPham}</a>
											<div class="price"><fmt:formatNumber type = "number" groupingUsed = "true" value = "${itemsanpham.giaTien }" /></div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

		<!-- CÁC THƯƠNG HIỆU -->
		<div class="container-fluid mt-5 mr-0 p-0"
			style="background-color: white;">
			<div class="row">
				<div class="col-md-12 brand">
					<ul>
						<c:forEach var="item" items="${listthuonghieulimit }">
							<li><a href="#"><img
									src="<c:url value="/resources/web/imgs/thuonghieu/${item.hinhThuongHieu }" />"
									alt=""></a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</main>
	<!-- Body end -->

	<jsp:include page="/resources/web/common/footer.jsp" />
	<script>
		$(".sp-new").click(function() {
			$(".sp-pop").removeClass("sp-active");
			$(".sp-buys").removeClass("sp-active");
			$(".sp-new").addClass("sp-active");
			$(".show-sp-moi").fadeIn();
			$(".show-sp-mua-nhieu").hide();
			$(".show-sp-noi-bat").hide();
		})
		$(".sp-pop").click(function() {
			$(".sp-new").removeClass("sp-active");
			$(".sp-buys").removeClass("sp-active");
			$(".sp-pop").addClass("sp-active");
			$(".show-sp-moi").hide();
			$(".show-sp-mua-nhieu").hide();
			$(".show-sp-noi-bat").fadeIn();
		})
		$(".sp-buys").click(function() {
			$(".sp-pop").removeClass("sp-active");
			$(".sp-new").removeClass("sp-active");
			$(".sp-buys").addClass("sp-active");
			$(".show-sp-moi").hide();
			$(".show-sp-mua-nhieu").fadeIn();
			$(".show-sp-noi-bat").hide();
		})

		AOS.init();
	</script>

</body>
</html>
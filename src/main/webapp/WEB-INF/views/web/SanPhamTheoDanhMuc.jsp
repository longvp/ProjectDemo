<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${tendanhmuc }</title>

<jsp:include page="/resources/web/common/lib.jsp" />

</head>
<body>

	<jsp:include page="/resources/web/common/header.jsp" />

	<!-- Body -->
	<main style="background-color: white;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1 p-0 bg-light"></div>
				<div class="col-md-11 p-0">
					 <ul class="breadcrumbs">
                        <li><a href="/home">Trang chủ</a></li>
                        <li><span>${tendanhmuc }</span></li>
                    </ul>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<h3 class="ten-thiet-bi" data-iddanhmuc="${iddanhmuc }">${tendanhmuc }</h3>
				</div>
				<div class="col-md-9">
					<div class="sort-product">
						<span>Sắp xếp theo:</span> <select name="" id="">
							<option value="">Mặc định</option>
							<option value="">Giá tăng dần</option>
							<option value="">Giá giảm dần</option>
						</select> 
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<div>
						<h3 class="brand-title">THƯƠNG HIỆU</h3>
						<ul class="list-brand">
							<c:forEach var="item" items="${listthuonghieutheodanhmuc }">
								<li class="brand-name" style="text-transform: uppercase;">
									<a class="tenthuonghieu" data-idthuonghieu = "${item.id }" href="#">${item.tenThuongHieu }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div>
						<h3 class="product-title mt-5 mb-0">SẢN PHẨM MỚI</h3>
						<ul class="list-sp-moi">
							<c:forEach var="item" items="${listsanpham }">
								<c:if test="${item.news == '1' }">
									<li>
										<div class="sp">
											<div>
												<a href="/chitiet/${item.id }"><img
													src="<c:url value="/resources/web/imgs/${item.danhMuc.maDanhMuc }/${item.hinhSanPham }" />"
													alt="" width="100%"></a>
											</div>
											<div>
												<a href="/chitiet/${item.id }" class="name-sp">${item.tenSanPham }</a> 
												<span class="price"><fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.giaTien }" /></span>
											</div>
										</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-9">
					<div id="tab" class="row product">
						<c:forEach var="item" items="${listsanphamlimit }">
							<div class="col-md-3 col-sm-6">
								<div class="sp">
									<a href="/chitiet/${item.id }"><img src="<c:url value="/resources/web/imgs/${item.danhMuc.maDanhMuc }/${item.hinhSanPham }" />" alt="" width="100%"></a>
									<a href="/chitiet/${item.id }" class="name-sp">${item.tenSanPham }</a>
									<div class="price"><fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.giaTien }" /></div>
									
								</div>
							</div>
						</c:forEach>
					</div>
					<ul class="pagination pagination-sm mt-5 d-flex justify-content-center">
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
					</ul>
				</div>
			</div>
		</div>
	</main>
	<!-- Body end -->


	<jsp:include page="/resources/web/common/footer.jsp" />
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			/* PHAN TRANG */
			$("body").on("click", ".page-item", function() {
				$(".page-item").removeClass("active");
				$(this).addClass("active");
				var currentPage =  $(this).text();
				var iddanhmuc = $(".ten-thiet-bi").attr("data-iddanhmuc");
				$.ajax({
					url : "/api/laysanphamlimit",
					type : "GET",
					data : {
						iddanhmuc: iddanhmuc,
						currentPage : currentPage
					},
					success : function(value) {
						var tbodysanpham = $("#tab");
						tbodysanpham.empty();
						tbodysanpham.append(value);
					}
				})
			})

			
			$("body").on("click", ".tenthuonghieu", function(){
				$(".tenthuonghieu").removeClass("active-thuonghieu");
				$(this).addClass("active-thuonghieu"); 
				$(".pagination").addClass("hide-paging");
				var idthuonghieu = $(this).attr("data-idthuonghieu");
				var iddanhmuc = $(".ten-thiet-bi").attr("data-iddanhmuc");
				$.ajax({
					url : "/api/laysanphamtheothuonghieu",
					type : "GET",
					data : {
						idthuonghieu : idthuonghieu,
						iddanhmuc: iddanhmuc
					},
					success : function(value) {
						var tbodysanpham = $("#tab");
						tbodysanpham.empty();
						tbodysanpham.append(value);
					}
				})
			}) 

		})
	</script>
</body>
</html>
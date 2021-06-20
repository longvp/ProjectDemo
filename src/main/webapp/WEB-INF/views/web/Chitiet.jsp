<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHI TIẾT</title>
<jsp:include page="/resources/web/common/lib.jsp" />
</head>
<body>

	<jsp:include page="/resources/web/common/header.jsp" />


	<!-- Body -->
	<main style="background-color: white;">
		<div class="container">
			<div class="row">
				<!-- <div class="col-md-1"></div> -->
				<div class="col-md-4 mt-5">
					<div class="row">
						<div style="border: 1px solid #e1e1e1;">
							<img class="img-big" src="<c:url value="/resources/web/imgs/${sanpham.danhMuc.maDanhMuc }/${sanpham.hinhSanPham}" />"
								alt="" width="100%">
						</div>
					</div>
					
				</div>
				<div class="col-md-6 mt-5">
					<div class="row">
						<div class="col-md-12">
							<div class="product-info" style="margin-left: 100px !important;">
								<div class="ten mb-3" data-idsanpham="${sanpham.id }">${sanpham.tenSanPham }</div>
								<div class="thuong-hieu mb-3">
									<span>Thương hiệu :</span><span style="text-transform: uppercase;">${sanpham.thuongHieu.tenThuongHieu }</span>
								</div>
								<div class="gia mb-3">${sanpham.giaTien }</div>
								<div class="d-flex so-luong mb-3">
									<div>
										<input class="soluong" type="number" value="1" min="1">
									</div>
									<div>
										<a href="#" class="btn-giohang"><i class="fas fa-cart-plus"></i><span>Thêm
												vào giỏ hàng</span></a>
									</div>
								</div>
								<div class="share">
									<p>Chia sẻ:</p>
									<div class="fb-like fb_iframe_widget"
										data-href="http://t0202.store.chi tiet.vn/samsung-galaxy-s8-p14882315.html"
										data-layout="button_count" data-action="like"
										data-size="small" data-show-faces="true" data-share="true"
										fb-xfbml-state="rendered"
										fb-iframe-plugin-query="action=like&amp;app_id=&amp;container_width=458&amp;href=http%3A%2F%2Ft0202.store.chi tiet.vn%2Fsamsung-galaxy-s8-p14882315.html&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true&amp;show_faces=true&amp;size=small">
										<span
											style="vertical-align: bottom; width: 150px; height: 28px;"><iframe
												name="f2f7248bcc76e14" width="1000px" height="1000px"
												data-testid="fb:like Facebook Social Plugin"
												title="fb:like Facebook Social Plugin" frameborder="0"
												allowtransparency="true" allowfullscreen="true"
												scrolling="no" allow="encrypted-media"
												src="https://www.facebook.com/v2.12/plugins/like.php?action=like&amp;app_id=&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df126a071da36f5c%26domain%3Dt0202.store.chi tiet.vn%26origin%3Dhttp%253A%252F%252Ft0202.store.chi tiet.vn%252Ff3fc05ec03655a%26relation%3Dparent.parent&amp;container_width=458&amp;href=http%3A%2F%2Ft0202.store.chi tiet.vn%2Fsamsung-galaxy-s8-p14882315.html&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true&amp;show_faces=true&amp;size=small"
												style="border: none; visibility: visible; width: 150px; height: 28px;"
												class=""></iframe></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2 p-0 mt-5">
					<ul class="service">
						<li class="item-service"><i class="fas fa-truck"></i>
							<p>Miễn phí vận chuyển với đơn hàng lớn hơn 1.000.000 đ</p></li>
						<li class="item-service"><i class="fas fa-history"></i>
							<p>Giao hàng ngay sau khi đặt hàng (áp dụng với Hà Nội & HCM)</p>
						</li>
						<li class="item-service"><i class="fas fa-exchange-alt"></i>
							<p>Đổi trả trong 3 ngày, thủ tục đơn giản</p></li>
						<li class="item-service"><i class="far fa-calendar-check"></i>
							<p>Nhà cung cấp xuất hóa đơn cho sản phẩm này</p></li>
					</ul>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</main>
	<!-- Body end -->

	<div class="container mt-5">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
		    <li class="nav-item">
		      <a class="nav-link active" href="#thongsokythuat">THÔNG SỐ KỸ THUẬT</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#motachitiet">MÔ TẢ CHI TIẾT</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#danhgia">ĐÁNH GIÁ</a>
		    </li>
		 </ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="thongsokythuat" class="container tab-pane active">
				<br>
				<h3>THÔNG SỐ KỸ THUẬT</h3>
			</div>
			<div id="motachitiet" class="container tab-pane fade">
				<br>
				<h3>MÔ TẢ CHI TIẾT</h3>
				<p>${sanpham.moTa }</p>
			</div>
			<div id="danhgia" class="container tab-pane fade">
				<h5 class="mt-5 mb-5">${soLuongBinhLuan } bình luận</h5>
				<form id="form-binhluan" data-iduser=${LoginInfo.id }>
					<textarea id="binhluan" name="textBinhLuan" required="required" class="p-3" rows="3" cols="100" placeholder="Thêm bình luận"></textarea> <br>
					<button type="button" id="btn-binhluan" class="mt-3 mb-3 btn btn-primary">Bình luận</button>
				</form>
				<c:forEach var="item" items="${listBinhLuan }">
					<c:if test="${item.sanPham.id == sanpham.id }">
						<ul class="d-flex p-0 m-0" style="list-style-type: none;">
							<li> 
								<img class="img-big" src="<c:url value="/resources/web/imgs/user/user-img.jpg" />"
									alt="" width="50px">
							</li>
							<li class="p-2">
								<span style="color: black; font-weight: bold; margin-right: 20px;">${item.user.tenDangNhap }</span> 
								<span style="color: blue;">${item.ngayBinhLuan }</span>		
								<p>${item.textBinhLuan }</p>
							</li>
						</ul>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>

	<jsp:include page="/resources/web/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			$(".img-small").each(function() {
				$(this).click(function() {
					var srcImg = $(this).attr("src");
					$(".img-big").attr("src", srcImg);
				})
			})

			/* TAB */
			$(".nav-tabs a").click(function() {
				$(this).tab('show');
			});
			
			$(".btn-giohang").click(function(){
				var idSanPham = $(".ten").attr("data-idsanpham");
				var hinhSanPham = $(".img-big").attr("src");
				var tenSanPham = $(".ten").text();
				var giaTien = $(".gia").text();
				var soLuong = $(".soluong").val();
				
				$.ajax({
					url : "/api/themgiohang",
					type : "GET",
					data : {
						idSanPham: idSanPham,
						hinhSanPham: hinhSanPham,
						tenSanPham: tenSanPham,
						giaTien: giaTien,
						soLuong: soLuong
					},
					success : function(value) {
						$(".cart").find("span").addClass("quantity");
						$(".cart").find("span").text(value);
						alert("Đã thêm vào giỏ hàng.");
					}
				}) 
				
				location.reload();
				
			});
			
			
			$("#btn-binhluan").click(function(){
				var idSanPham = $(".ten").attr("data-idsanpham");
				var idUser = $("#form-binhluan").attr("data-iduser");
				var textBinhLuan = $("#binhluan").val();
				if(idUser > 0){
					$.ajax({
						url : "/api/binhluan",
						type : "GET",
						data : {
							idSanPham: idSanPham,
							idUser: idUser,
							textBinhLuan: textBinhLuan
						},
						success : function(value) {
							location.reload();
						}
					}) 
					
				} else{
					alert("Hãy đăng nhập để bình luận");
				}
				
			}) 
			

		})
	</script>

</body>
</html>
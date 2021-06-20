<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/web/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HÓA ĐƠN</title>

<jsp:include page="/resources/web/common/lib.jsp" />

</head>
<body>
	
		<div class="container">
		<div class="row">
			<div class="col-md-12 text-center mt-3">
				<a href="<c:url value="/home" />">
					<img src="<c:url value="/resources/web/imgs/logo/logos.jpg"/>" width="200px" alt="">
				</a><br>			
			</div>
			<c:if test="${LoginInfo == null }">
				<div class="text-center mt-5">
					<a class="btn btn-danger" href="/dangnhap">Hãy đăng nhập để đặt hàng</a>
				</div>
			</c:if>
		</div>
		<c:if test="${LoginInfo != null }">
		<div class="row mt-5">
			<div class="col-md-12">
				<c:if test="${soluongsanphamgiohang <= 0 }">
					<div class="text-center">
        				<h1 class="m-5">GIỎ HÀNG CỦA BẠN TRỐNG</h1>
        				<a class="btn btn-danger" href="/home">Tiếp tục mua sắm</a>
        			</div>
				</c:if>
				<c:if test="${soluongsanphamgiohang > 0 }">
				<form method="post" action=""  id="thanhtoan">
					<div class="col-md-6">
						<h2>THÔNG TIN GIAO HÀNG</h2>
	
						<div class="thongtingiaohang">
							<input type="text" required="required" id="hoten" name="hoTen" value="${LoginInfo.hoTen }" placeholder="Họ và tên" style="width: 100%;"> <br>
							<div class="forminline d-flex">
								<input type="text" required="required" id="email" name="email" value="${LoginInfo.email }" placeholder="Email">
								<input type="text" required="required" id="sodienthoai" name="soDienThoai" value="${LoginInfo.soDienThoai }" placeholder="Số điện thoại"> <br>
							</div>
							<input type="text" required="required" id="diachi" name="diaChi" value="${LoginInfo.diaChi }" placeholder="Địa chỉ">
						</div>
	
						<h2>PHƯƠNG THỨC THANH TOÁN</h2>
	
						<div class="radio">
							<label>
								<input type="radio" name="phuongThucThanhToan" value="Thanh toán tại nhà" checked>
								Thanh toán tại nhà
							</label>
						</div>
	
						<div class="radio">
							<label>
								<input type="radio" name="phuongThucThanhToan" value="Thanh toán tại cửa hàng">
								Thanh toán tại cửa hàng
							</label>
						</div>					
						<div id="back">
							<a href="<c:url value="/giohang" />"><i class="fas fa-arrow-circle-left"></i>Giỏ hàng</a>
						</div>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-5 mb-5">
						<table class="sp-table">
							<c:forEach var="item" items="${listgiohang }">
								<tr>
									<td>
										<img src="${item.hinhSanPham }" alt=""> 
										<span class="sl-sp">${item.soLuong }</span>
									</td>
									<td class="ten-sp" data-idsanpham = "${item.idSanPham }"> ${item.tenSanPham }</td>
									<td class="gia-sp">
										<fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.giaTien * item.soLuong }" />
									</td>
								</tr>
							</c:forEach>
						</table>
						<hr>
						<textarea name="ghiChu" id="ghichu" re  placeholder="Ghi chú" cols="" rows="5"></textarea>
						<hr>
						<div class="foot-right text-center">
							<span>TỔNG CỘNG:</span> 
							<span><fmt:formatNumber type = "number" groupingUsed = "true" value = "${tongtien }" /></span> <br>
							<button id="btn-dathang" type="submit">Đặt hàng</button>
						</div>
					</div>
				</form>
				</c:if>
			</div>
		</div>
		</c:if>
	</div>
	
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$("#btn-dathang").click(function(){
				alert("Đặt hàng thành công");
			})
			
		})
	
	</script>
	
	
</body>
</html>
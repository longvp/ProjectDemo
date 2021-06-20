<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GIO HANG</title>
</head>

<jsp:include page="/resources/web/common/lib.jsp" />

<body>
	
	<jsp:include page="/resources/web/common/header.jsp"/>
	
	 <main style="background-color: white;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1 p-0 bg-light"></div>
                <div class="col-md-11 p-0">
                    <ul class="breadcrumbs">
                        <li><a href="/home">Trang chủ</a></li>
                        <li><span>Giỏ hàng</span></li>
                    </ul>
                </div>
            </div>
        </div>
        <c:if test="${soluongsanphamgiohang <= 0 || soluongsanphamgiohang == null}">
        	<div class="text-center">
        		<h1 class="m-5">GIỎ HÀNG CỦA BẠN TRỐNG</h1>
        		<a class="btn btn-danger" href="/home">Tiếp tục mua sắm</a>
        	</div>
        </c:if>
        <c:if test="${soluongsanphamgiohang > 0 }">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">
                    <table class="gio-hang">
                        <tr>
                            <th>Ảnh sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Xóa</th>
                        </tr>
                        <c:forEach var="item" items="${giohangs }">
                        	<tr>
	                            <td class="d-flex justify-content-center">
	                           		 <img class="img-big" src="<c:url value="${item.hinhSanPham }" />" width="100%">          
	                            </td>
	                            <td class="tensanpham" data-idsanpham = "${item.idSanPham }">
	                                ${item.tenSanPham }
	                            </td>
	                            <td class="giatien">
	                            	<fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.giaTien }" />
	                            </td>
	                            <td>
	                                <input type="number" class="soluong" value="${item.soLuong }" min="1" max="5000">
	                            </td>
	                            <td class="thanhtien" data-giatien="${item.giaTien}">
	                            	<%-- <fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.giaTien}" /> --%>
	                            	${item.giaTien}
	                            </td>
	                            <td>
	                                <a class="btn-xoa" title="Xóa" href="#">
	                                    <span><span><i class="far fa-trash-alt"></i></span></span>
	                                </a>
	                            </td>
                        	</tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-md-4"></div>
                <div class="col-md-4 text-center">
                    <div class="total">
                        <span>Tổng tiền:</span>
                        <span id="tongtien"></span>
                    </div>
                    <button id="btn-thanhtoan">Thanh toán</button>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
        </c:if>
    </main>
	
	<jsp:include page="/resources/web/common/footer.jsp"/>
	
	<script type="text/javascript">
		$(document).ready(function(){
		
			tongTienGioHang();
			
			function tongTienGioHang(isEventChange){
				var tongtien = 0;
				$(".thanhtien").each(function(){
					var giatien = $(this).closest("tr").find(".thanhtien").attr("data-giatien");
					var soluong = $(this).closest("tr").find(".soluong").val();
					var thanhtien = parseInt(giatien)*soluong;				
					if(!isEventChange){
						$(this).html(thanhtien);
					}
					tongtien = tongtien + thanhtien;
					$(".total").find("#tongtien").html(tongtien + "");
				})
			}
			
			$(".soluong").change(function(){
				var soluong = $(this).val();
				var giatien = $(this).closest("tr").find(".thanhtien").attr("data-giatien");
				var thanhtien = parseInt(giatien)*soluong;
				$(this).closest("tr").find(".thanhtien").html(thanhtien + "");
				
				tongTienGioHang(true);
				
				var idsanpham = $(this).closest("tr").find(".tensanpham").attr("data-idsanpham");
				
				$.ajax({
					url : "/api/capnhatsoluonggiohang",
					type : "GET",
					data : {
						idsanpham: idsanpham,
						soluong: soluong
					},
					success : function(value) {
						
					}
				}) 
				
			})
			
			// XOA
			$(".btn-xoa").click(function(){
				var self = $(this);				
				var idsanpham = $(this).closest("tr").find(".tensanpham").attr("data-idsanpham");			
				$.ajax({
					url : "/api/xoagiohang",
					type : "GET",
					data : {
						idsanpham: idsanpham,
					},
					success : function(value) {
						self.closest("tr").remove();
						tongTienGioHang(true);
						location.reload();
					}
				}) 
										
			})
			
			$("#btn-thanhtoan").click(function(){
				window.location.href="/hoadon";
			}) 
			
		})
	
	</script>
	
</body>
</html>
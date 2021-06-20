<%@ include file="/resources/admin/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUẢN LÝ HÓA ĐƠN</title>

<jsp:include page="/resources/admin/common/lib.jsp" />

</head>
<body class="sb-nav-fixed">

	<jsp:include page="/resources/admin/common/header.jsp"/>
        
        <div id="layoutSidenav">
        
           <jsp:include page="/resources/admin/common/menu.jsp"/>
           
            <div id="layoutSidenav_content">
                <main>
                	<c:if test="${LoginInfoAdmin == null }">
                		<div class="text-center mt-5">
                			<a class="btn btn-primary" href="/admindangnhap">Đăng nhập để tiếp tục</a>
                		</div>
                	</c:if>
                	<c:if test="${LoginInfoAdmin != null }">
                		<h5 class="text-center m-5">HÓA ĐƠN</h5>
                		<table class="table table-bordered text-center" id="table-sanpham" width="100%" cellspacing="0">              			
                			<thead>
                				<tr>
	                				<th>Họ tên</th>
				                    <th>SĐT</th>                             
				                    <th>Địa chỉ</th>
				                    <th>Thanh toán</th>
				                    <th>Ngày đặt</th>
				                    <th>Tên sản phẩm</th>
				                    <th>Số lượng</th>
				                    <th>Thành tiền</th>
			                    </tr>
                			</thead>
                			<tbody>
                				<c:forEach var="item" items="${listChiTietHoaDon }">
                					<tr>
                						<td>${item.hoaDon.hoTen }</td>
					                    <td>${item.hoaDon.soDienThoai }</td>                             
					                    <td>${item.hoaDon.diaChi }</td>
					                    <td>${item.hoaDon.phuongThucThanhToan }</td>
					                    <td>${item.hoaDon.ngayDatHang }</td>
					                    <td>${item.sanPham.tenSanPham }</td>
					                    <td>${item.soLuong }</td>
					                    <td><fmt:formatNumber type = "number" groupingUsed = "true" value = "${item.thanhTien }" /></td>
                					</tr>
                				</c:forEach>
                			</tbody>
                		</table>
                	 </c:if>
                </main>
            </div>
        </div>

</body>
</html>
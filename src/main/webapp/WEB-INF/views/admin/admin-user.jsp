<%@ include file="/resources/admin/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USER</title>

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
               			<h4 class="m-5 text-center">${tenChucVu }</h4>              		
                		<table class="table table-bordered text-center" id="table-sanpham" width="100%" cellspacing="0">              			
                			<thead>
                				<tr>
	                				<th>Chức vụ</th>
				                    <th>Tên đăng nhập</th>
				                    <th>Họ tên</th>                             
				                    <th>Email</th>
				                    <th>Mật khẩu</th>
				                    <th>Số điện thoại</th>
				                    <th>Địa chỉ</th>
			                    </tr>
                			</thead>
                			<tbody>
                				<c:forEach var="item" items="${listuser }">
                					<tr>
                						<td>${item.chucVu.tenChucVu }</td>
                						<td>${item.tenDangNhap }</td>
                						<td>${item.hoTen }</td>
                						<td>${item.email }</td>
                						<td>${item.matKhau }</td>
                						<td>${item.soDienThoai }</td>
                						<td>${item.diaChi }</td>
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
<%@ include file="/resources/admin/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUẢN LÝ LIÊN HỆ</title>

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
                		<h5 class="text-center m-5">LIÊN HỆ</h5>
                		<table class="table table-bordered text-center" id="table-sanpham" width="100%" cellspacing="0">              			
                			<thead>
                				<tr>
	                				<th>Họ tên</th>
				                    <th>Email</th>                             
				                    <th>SĐT</th>
				                    <th>Địa chỉ</th>
				                    <th>Nội dung</th>
				                    <th>Ngày liên hệ</th>
			                    </tr>
                			</thead>
                			<tbody>
                				<c:forEach var="item" items="${listLienHe }">
                					<tr>
                						<td>${item.hoTen }</td>
					                    <td>${item.email }</td>                             
					                    <td>${item.soDienThoai }</td>
					                    <td>${item.diaChi }</td>
					                    <td>${item.noiDung }</td>
					                    <td>${item.ngayLienHe }</td>
					                
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
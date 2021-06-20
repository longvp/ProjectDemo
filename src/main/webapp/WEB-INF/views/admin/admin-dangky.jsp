<%@ include file="/resources/admin/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ĐĂNG KÝ</title>

<jsp:include page="/resources/admin/common/lib.jsp" />

</head>
<body class="sb-nav-fixed">

	<jsp:include page="/resources/admin/common/header.jsp"/>
        
        <div id="layoutSidenav">
        
           <jsp:include page="/resources/admin/common/menu.jsp"/>
           
            <div id="layoutSidenav_content">
                <main>
                	<div class="container">
                	<div class="row">
                	<div class="col-md-2"></div>
                	<div class="col-md-8 text-center">
					<form method="post" action="">
						  <div class="form-group mt-5">	
						  		<h4>ĐĂNG KÝ</h4>
						  		<h4 style="color: red;">${message }</h4>
						  		<input type="text" name="hoTen" class="form-control" required="required" placeholder="Họ tên"> <br>			
							    <input type="text" name="email" class="form-control" required="required" placeholder="Email" > <br>
							    <input type="text" name="tenDangNhap" class="form-control" required="required" placeholder="Tên đăng nhập"> <br>
							    <input type="text" name="soDienThoai" class="form-control" required="required" placeholder="Số điện thoại"> <br>
						  		<input type="password" name="matKhau" class="form-control" required="required" placeholder="Mật khẩu"> <br>
						  		<input type="text" name="diaChi" class="form-control" required="required" placeholder="Địa chỉ"> <br>
						  </div>
					  	  <button type="submit" class="btn btn-primary">ĐĂNG KÝ</button>
					</form> 
					</div>   
					<div class="col-md-2"></div>  
					</div>
					</div>          
                </main>
            </div>
        </div>

</body>
</html>
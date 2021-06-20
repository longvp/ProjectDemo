<%@ include file="/resources/admin/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ĐĂNG NHẬP</title>

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
						  		<h4>ĐĂNG NHẬP</h4>		
							    <input type="text" name="email" class="form-control" required="required" placeholder="Email" > <br>
						  		<input type="password" name="matKhau" class="form-control" required="required" placeholder="Mật khẩu"> <br>
						 		<h5 style="color: red;" >${message }</h5>
						  </div>
					  	  <button type="submit" class="btn btn-primary">ĐĂNG NHẬP</button>
					  	  <h5 class="mt-3"> 
					  	  		<span>Chưa có tài khoản ?</span> 
					  	  		<a href="/admindangky">Đăng ký</a>
					  	  </h5>
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
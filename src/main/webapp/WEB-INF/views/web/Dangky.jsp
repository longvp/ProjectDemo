<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ĐĂNG KÝ</title>
<jsp:include page="/resources/web/common/lib.jsp"/>
</head>
<body>
	
	<jsp:include page="/resources/web/common/header.jsp"/>
	
	
	<!-- Body -->   
    <main>
    	<div class="container-fluid">
			<div class="row">
				<div class="col-md-1 p-0 bg-light"></div>
				<div class="col-md-11 p-0">
					 <ul class="breadcrumbs">
                        <li><a href="/home">Trang chủ</a></li>
                        <li><span>Đăng Ký</span></li>
                    </ul>
				</div>
			</div>
		</div>
        <div class="container">
            <div class="row mt-4">
                <div class="col-md-12 text-center m-5">
                    <h3>ĐĂNG KÝ</h3>
                    <h5 class="m-3" style="color: red;">${message }</h5>
                    <form method="post" class="dang-ky" >
                        <input type="text" name="hoTen" id="hoTen" placeholder="Họ và tên" required>
                        <input type="email" name="email" id="email" placeholder="Email" required>
                        <input type="text" name="tenDangNhap" id="tenDangNhap" placeholder="Tên đăng nhập" required>
                        <input type="text" name="soDienThoai" id="sdt" placeholder="Số điện thoại" required>
                        <input type="password" name="matKhau" id="matKhau" placeholder="Mật khẩu" required>
                        <input type="text" name="diaChi" id="diaChi" placeholder="Địa chỉ" required>
                        <br>
                        <button id="btn-dangky" type="submit">Đăng ký</button>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <!-- Body end -->
	
	
	<jsp:include page="/resources/web/common/footer.jsp"/> 
	
</body>
</html>
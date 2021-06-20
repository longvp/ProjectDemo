<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ĐĂNG NHẬP</title>
<jsp:include page="/resources/web/common/lib.jsp"/>
</head>
<body>

<jsp:include page="/resources/web/common/header.jsp"/>

	<main>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1 p-0 bg-light"></div>
				<div class="col-md-11 p-0">
					 <ul class="breadcrumbs">
                        <li><a href="/home">Trang chủ</a></li>
                        <li><span>Đăng nhập</span></li>
                    </ul>
				</div>
			</div>
		</div>
        <div class="container mt-3">
            <div class="row">           	
                <div class="col-md-6">
                    <h5 class="mb-4">ĐĂNG NHẬP</h5>
                    <form method="post" class="dang-nhap">
                        <input type="email" placeholder="Email" name="email" id="email" required>
                        <input type="password" placeholder="Password" name="matKhau" id="matkhau" required>
                        <h5>${message }</h5>
                        <button type="submit" id="btn-dangnhap" class="button mt-3 mb-3">Đăng nhập</button>
                    </form>
                    <a href="#" class="forgot"><i class="fas fa-question-circle"></i><span>Quyên mật khẩu</span></a>
                    <ul class="list-dang-nhap mt-3">
                        <li><a href="#"><i class="fab fa-facebook-f"></i><span>Facebook</span></a></li>
                        <li><a href="#"><i class="fab fa-google"></i><span>Google</span></a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <h5 class="mb-4">BẠN CHƯA CÓ TÀI KHOẢN</h5>
                    <p class="note">
                        Đăng ký tài khoản ngay để có thể mua hàng chi tiet chóng và dễ dàng hơn ! Ngoài ra còn có rất nhiều
                        chính sách và ưu đãi cho các thành viên
                    </p>
                    <a href="/dangky" class="button">Đăng ký</a>
                </div>
            </div>
        </div>
    </main>
    
    <jsp:include page="/resources/web/common/footer.jsp"/> 

</body>
</html>
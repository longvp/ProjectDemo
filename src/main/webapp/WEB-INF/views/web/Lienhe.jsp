<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liên hệ</title>

<jsp:include page="/resources/web/common/lib.jsp" />

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
                        <li><span>Liên hệ</span></li>
                    </ul>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-3"></div>
            	<div class="col-md-9">
            		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.5837157383367!2d105.81723281424496!3d21.009317693819128!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac82a92505ed%3A0xd9566ad082463e73!2zVGjDoWkgVGjhu4tuaCwgVHJ1bmcgTGnhu4d0LCDEkOG7kW5nIMSQYSwgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1624068265246!5m2!1svi!2s" width="800" height="600" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            	</div>	
            	<div class="col-md-3"></div>
            </div>
        </div>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="title-info">THÔNG TIN LIÊN HỆ</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <ul class="list-lien-he">
                        <li><i class="fas fa-map-marker-alt"></i><span>Địa chỉ: Số 102 Thái Thịnh, phường Trung Liệt, quận Đống Đa, TP Hà Nội</span></li>
                        <li><i class="fas fa-phone-alt"></i><span>Điện thoại: 0123456789</span></li>
                        <li><i class="fas fa-envelope"></i><span>Email: admin@gmail.com</span></li>
                        <li><i class="fas fa-home"></i><span>Website: tmart.com</span></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <form method="post" class="lien-he">
                        <input type="text" name="hoTen" id="" placeholder="Tên của bạn" required>
                        <input type="text" name="diaChi" placeholder="Địa chỉ của bạn" required>
                        <input type="email" name="email" placeholder="Email của bạn" required>
                        <input type="text" name="soDienThoai" placeholder="Số điện thoại của bạn" required>
                        <textarea name="noiDung" id="" placeholder="Nội dung" required></textarea>
                        <h5 class="m-3">${message }</h5>
                        <button type="submit">Gửi</button>
                    </form>
                </div>
            </div>
        </div>
    </main>

<jsp:include page="/resources/web/common/footer.jsp"/>

</body>
</html>
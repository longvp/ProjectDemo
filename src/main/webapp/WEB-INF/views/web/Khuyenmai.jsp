<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Khuyến mại</title>

<jsp:include page="/resources/web/common/lib.jsp" />

</head>
<body>

<jsp:include page="/resources/web/common/header.jsp" />

<main>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1 p-0 bg-light"></div>
                <div class="col-md-11 p-0">
                    <ul class="breadcrumbs">
                        <li><a href="/home">Trang chủ</a></li>
                        <li><span>Khuyến mại</span></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="sale-title"><i class="fas fa-tags"></i>SỰ KIỆN KHUYẾN MẠI</h3>
                </div>
            </div>
            <div class="row bg-light" style="border-top: 2px solid #DC3333; padding: 10px 0;">
                <div class="col-md-5">
                    <h5><a href="#" class="sale">Giảm giá 10% cho đơn hàng từ 200k</a></h5>
                    <a href="#"><img src="/resources/web/imgs/khuyenmai/ad.jpg" alt="" width="100%"></a>
                </div>
                <div class="col-md-7"></div>
            </div>
        </div>
    </main>

<jsp:include page="/resources/web/common/footer.jsp" />

</body>
</html>
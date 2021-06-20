<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEADER -->
<div class="container mt-5 mb-5 header">
	<div class="row">
		<div class="col-md-4">
			<div class="logo">
				<a href="<c:url value="/home" />"> <img
					src="<c:url value="/resources/web/imgs/logo/logos.jpg"/>" alt="">
				</a>
			</div>
		</div>
		<div class="col-md-5" style="position: relative;">
			<div class="assist mb-2">
				<h5>Tư vấn khách hàng:</h5>
				<h5>0123 45 67 89 - 0123 45 67 89</h5>
				<h5>Hotline:</h5>
			</div>
			<form method="post" action="/timkiem" class="search">
				<input type="search" name="tenSanPham" required="required" placeholder="Tìm kiếm...">
				<button type="submit">Tìm kiếm</button>
			</form>
			<ul class="show-item-search">
                    <li>
                        <a href="#"><img src="/resources/web/imgs/dienthoai/1.jpg" alt="" width="100px"></a>
                        <a href="#" class="name-sp">Tivi Led LG 43LH590T</a>
                        <span class="price">20,000,000</span>
                    </li>
              </ul>
		</div>
		<div class="col-md-3 mt-4">
			<div class="user-cart">
				<div class="user">
					<c:if test="${LoginInfo == null }">
						<i class="far fa-user-circle"></i> <br> <a
						href="/dangnhap">Đăng nhập</a> <span>/</span> <a
						href="<c:url value="/dangky" />">Đăng ký</a>
						
					</c:if>
					<c:if test="${LoginInfo != null }">
						<i class="far fa-user-circle"></i> <br>
						<span>${LoginInfo.tenDangNhap }</span>
					</c:if>
				</div>
				<div class="cart">
					<a href="/giohang"> <i class="fas fa-shopping-cart"></i>
						<br> Giỏ hàng 					
						<c:if test="${soluongsanphamgiohang > 0}">
							<span class="quantity">${soluongsanphamgiohang }</span>	
						</c:if>	
						<c:if test="${soluongsanphamgiohang <= 0 || soluongsanphamgiohang == null}">
							<span class="quantity">0</span>	
						</c:if>			
					</a>
				</div>
				<c:if test="${LoginInfo != null }">
					<div class="sign-out">
                     	<a href="/dangxuat">
                        	<i class="fas fa-sign-out-alt"></i> <br>
                            <span>Đăng xuất</span>
                     	</a>
                	</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<!-- Naviagtion-->
<nav class="navbar navbar-expand-lg navbar-light nav-header">
	<div class="container">
		<a class="navbar-brand logo-res" href="Home.html"> <img
			src="./imgs/logo/store_1561601507_487.jpg" alt="">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mb-2 mb-lg-0 me-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Danh mục sản phẩm </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:forEach var="value" items="${listdanhmuc }">
							<li><a class="dropdown-item" href="<c:url value="/danh-muc/${value.id }" />" ><i
								class="${value.icon }"></i><span>${value.tenDanhMuc }</span></a></li>
						</c:forEach>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link" href="/home">Trang chủ</a></li>
				<li class="nav-item"><a class="nav-link" href="/khuyenmai">Khuyến mại</a></li>
				<li class="nav-item"><a class="nav-link" href="/tintuc">Tin tức</a></li>
				<li class="nav-item"><a class="nav-link" href="/lienhe">Liên
						hệ</a></li>
			</ul>
			<ul class="navbar-nav mb-2 mb-lg-0 tk-dn-dk-gh-res">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="far fa-user-circle"></i><span>Tài khoản</span>
				</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="<c:url value="" />"><span>Đăng
									nhập</span></a></li>
						<li><a class="dropdown-item" href="<c:url value="/dang-ky" />"><span>Đăng
									ký</span></a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="/giohang">
						<i class="fas fa-shopping-cart"></i><span>Giỏ hàng</span>
				</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- Navigation END -->
<!-- Responsive -->
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<form method="post" action="/timkiem" class="search search-res">
				<input type="search" placeholder="Tìm kiếm...">
				<button type="submit">Tìm kiếm</button>
			</form>
		</div>
	</div>
</div>
<!-- HEADER END -->

<%@ include file="/resources/web/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tin tức</title>
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
                        <li><a href="./Home.html">Trang chủ</a></li>
                        <li><span>Tin tức</span></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-2 p-0">
                    <div class="danh-muc-tin-tuc">DANH MỤC TIN TỨC</div>
                    <ul class="list-ten-danh-muc">
                        <li><a href="#" id="cong-nghe">Công nghệ</a></li>
                    </ul>
                    <div class="danh-muc-tin-tuc mt-5">DANH MỤC SẢN PHẨM</div>
                    <ul class="list-ten-danh-muc">
                        <c:forEach var="item" items="${listdanhmuc }">
                        	<li><a href="/danh-muc/${item.id }">${item.tenDanhMuc }</a></li>
                        </c:forEach>
                    </ul>
                    <div class="danh-muc-tin-tuc mt-5">TIN MỚI</div>
                    <ul class="list-ten-danh-muc blog">
                    	<c:forEach var="item" items="${listTinTuc }">
                    		<li class="blog-li" data-idtintuc="${item.id }" style="cursor: pointer;">
	                            <a href="#"><img src="/resources/web/imgs/tintuc/${item.hinhTinTuc }" alt="" width="100%"></a>
	                            <div class="date"><i class="far fa-calendar-alt"></i><i>18-05-2020</i></div>
	                            <a href="#" class="name-blog">${item.tieuDe }</a>
                        </li>
                    	</c:forEach>
                    </ul>
                </div>
               <%--  <c:forEach var="item" items="${listTinTuc }">
                <div class="col-md-3">
                    <div class="blog-item" style="cursor: pointer;">
                        <div> <a href="#"><img src="/resources/web/imgs/tintuc/${item.hinhTinTuc }" alt="" width="100%"></a></div>
                        <div class="blog-name"><a href="#">${item.tieuDe }</a></div>
                        <div class="date"><i class="far fa-calendar-alt"></i><i>18-05-2021</i></div>
                        <div class="text">
                            ${item.moTaNgan }
                        </div>
                        <div class="read-more"><a href="#"><span>Đọc thêm</span><i class="fas fa-long-arrow-alt-right"></i></a></div>
                    </div>
                </div>
                </c:forEach> --%>
                <div class="col-md-9" style="display: block;">
                	<div class="row">
                	 <c:forEach var="item" items="${listTinTuc }">
		                <div class="col-md-3">
		                    <div class="blog-item" style="cursor: pointer;">
		                        <div> <a href="#"><img src="/resources/web/imgs/tintuc/${item.hinhTinTuc }" alt="" width="100%"></a></div>
		                        <div class="blog-name" data-idtintuc="${item.id }"><a href="#">${item.tieuDe }</a></div>
		                        <div class="date"><i class="far fa-calendar-alt"></i><i>18-05-2021</i></div>
		                        <div class="text">
		                            ${item.moTaNgan }
		                        </div>
		                        <div class="read-more"><a href="#"><span>Đọc thêm</span><i class="fas fa-long-arrow-alt-right"></i></a></div>
		                    </div>
		                </div>
                	</c:forEach>
                	</div>
                	<div class="row p-3">
                		<div class="col-md-12" id="tab" >   
                			<div class="content">        			
	                			<!-- <div class="text-center">
	                				<img alt="" src="/resources/web/imgs/tintuc/1.jpg">
	                			</div>
	                			<div>
	                				<h3>ĐÁNH GIÁ SAMSUNG GALAXY A7 2018</h3>
	                				<div ><i class="far fa-calendar-alt"></i><i>Ngày: 18-05-2021</i></div>
	                				<h5 style="text-align: justify;">
	                					Hồi đầu tháng 9/2018, ông DJ Koh, phụ trách mảng di động của Samsung chia sẻ hãng điện tử Hàn Quốc đang thay đổi chiến lược ở phần khúc tâm trung, ưu tiên đưa các tính năng mới và các sáng tạo công nghệ vào dòng sản phẩm này trước cả phân khúc cao cấp.
	                				</h5>
	                				<p>
	                					Mục tiêu của Samsung trong quyết định thay đổi chiến lược này là muốn vực dậy phân khúc tầm trung đang bị cạnh tranh mạnh mẽ bởi các nhà sản xuất điện thoại Trung Quốc. Chiếc Galaxy A7 2018 là sản phẩm đầu tiên ra đời từ chiến lược mới đó. Vì vậy, máy có những thứ mới mẻ lần đầu tiên xuất hiện trên điện thoại của hãng điện tử Hàn Quốc.
	                					Cụ thể, Galaxy A7 2018 là smartphone Samsung đầu tiên có 3 camera ở phía sau (gồm 1 camera góc siêu rộng để chụp phong cảnh cùng với 2 chiếc camera 24MP và camera 5MP để chụp ảnh thông thường và xóa phông) và là điện thoại dòng A đầu tiên có cảm biến vân tay trên cạnh. Một điều mới mẻ nữa là mức giá của Galaxy A7 2018 hiện tại còn rẻ hơn cả phiên bản đàn em Galaxy A6+. Có lẽ đây là lần đầu tiên Samsung định giá sản phẩm dòng A lớn hơn lại rẻ hơn dòng A đàn em.
	                				</p>
	                			</div> -->
                			</div> 
                		</div>
                	</div>
                </div>
            </div>
        </div>
    </main>


<jsp:include page="/resources/web/common/footer.jsp" />


	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$("#cong-nghe").click(function(){
				$(".blog-item").show();
				$(".content").hide();
			})
			
			$(".blog-item").click(function(){
				$(".blog-item").hide();
				$(".content").show();
				var idTinTuc = $(this).find(".blog-name").attr("data-idtintuc");
						
				$.ajax({
					url : "/api/tintuc",
					type : "GET",
					data : {
						idTinTuc : idTinTuc,
					},
					success : function(value) {
						var tbodysanpham = $(".content");
						tbodysanpham.empty();
						tbodysanpham.append(value);
					}
				})
											
			})
			
			$(".blog-li").click(function(){
				$(".blog-item").hide();
				$(".content").show();
				var idTinTuc = $(this).attr("data-idtintuc");
				$.ajax({
					url : "/api/tintuc",
					type : "GET",
					data : {
						idTinTuc : idTinTuc,
					},
					success : function(value) {
						var tbodysanpham = $(".content");
						tbodysanpham.empty();
						tbodysanpham.append(value);
					}
				})
				
			})
			
		})
	
	</script>


</body>
</html>
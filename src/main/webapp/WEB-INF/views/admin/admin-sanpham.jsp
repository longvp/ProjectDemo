<%@ include file="/resources/admin/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DANH SÁCH SẢN PHẨM</title>

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
                	<div class="container p-0">
                		<div class="row mb-5 mt-5">
                			<div class="col-md-12">
                				<div style="float: right;">
                					<button id="xoa-sanpham" class="btn btn-primary">Xóa</button>
                					<button type="button" id="btn-them" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
										Thêm sản phẩm<!-- <i class="far fa-edit"></i> -->
									</button>
                				</div>
                			</div>
                		</div>
                		<div class="row">
                			<div class="col-md-12">           				
                				<table class="table table-bordered text-center" id="table-sanpham" width="100%" cellspacing="0">
			                    	<thead>
			 							<tr>
			 								<th>
			                    	 			<div class="checkbox">
													<label><input id="checkall" type="checkbox" value="${item.id }"></label>
												</div>
			                    	 		</th>
			 								<th>Hình sản phẩm</th>
			                             	<th>Tên sản phẩm</th>
			                                <th>Giá tiền</th>                             
			                                <th>Thương hiệu</th>
			                                <th>Ngày thêm</th>
			                                <th>Sửa</th>
										</tr>
			       					 </thead>
			                    	 <tbody>
			                    	 	<c:forEach var="item" items="${listsanphams}">                      	 		                 	 	 	
			                    	 		<tr>
			                    	 			<td>
			                    	 				<div class="checkbox">
														<label><input type="checkbox" value="${item.id }"></label>
													</div>
			                    	 			</td>
			        							<td> <img alt="" width="100px" src="<c:url value="/resources/web/imgs/${item.danhMuc.maDanhMuc }/${item.hinhSanPham }" />"> </td>
				                                <td class="ten-sp" data-idsanpham = "${item.id }">${item.tenSanPham }</td>
				                                <td>${item.giaTien }</td>				                                
				                                <td style="text-transform: uppercase;">${item.thuongHieu.tenThuongHieu }</td>
				                                <td>${item.ngayThem }</td>
			                            		<td>
			                            			 <button type="button" class="btn btn-primary btn-sua" data-idsanpham="${item.id }" data-toggle="modal" data-target="#myModal">
													    <i class="far fa-edit"></i>
													 </button>
			                            		</td>
			                            	</tr>
			                    	 	</c:forEach>
			                    	 </tbody>
                   			 	</table>
                   			 	<h1>${totalItem }</h1>                 			 
                				<ul class="pagination pagination-sm mt-5 d-flex justify-content-center">
									<c:forEach var="i" begin="1" end="${totalPage }">
										<c:choose>
											<c:when test="${i == 1 }">
												<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
											</c:when>
											<c:when test="${i > 1 }">
												<li class="page-item"><a class="page-link" href="#">${i }</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
								</ul>
                			</div>
                		</div>
                	</div>
			                	
			        <div class="container">						
						  <div class="row">
						  <div class="col-md-12">
						  <div class="modal" id="myModal">
							    <div class="modal-dialog">
							      <div class="modal-content">
								        <!-- Modal body -->
								        <div class="modal-body">
								        <button type="button" class="close" style="float:right;" data-dismiss="modal">&times;</button>
								        <form id="form-sanpham" >				
										<div class="row">
											<div class="col-md-6">
												<label for="tensanpham">Tên sản phẩm</label> <br>
												<input name="tenSanPham" type="text" id="tensanpham" class="form-control" /><br>
											
												<label for="giatien">Giá tiền</label> <br>
												<input name="giaTien" type="text" id="giatien" class="form-control" /><br>
												
												<label for="danhmucsanpham">Danh mục sản phẩm: </label> <br>
												<select name="danhMuc" class="form-control" id="danhmucsanpham">
													<c:forEach var="item" items="${listdanhmuc }">
														<option value="${item.id }" >${item.tenDanhMuc }</option>
													</c:forEach>
												</select>
												
												<label for="thuonghieu" class="mt-4">Thương hiệu: </label> <br>
												<select name="thuongHieu" class="form-control" id="thuonghieu">
													<c:forEach var="item" items="${listthuonghieu }">
														<option value="${item.id }" style="text-transform: uppercase;">${item.tenThuongHieu }</option>
													</c:forEach>
												</select>
												<label for="mota" class="mt-4">Mô tả: </label> <br>
												<textarea name="moTa" id="mota" class="form-control"  rows="5"></textarea>
											</div>
											<div class="col-md-6">
												
												<label for="thongsokythuat" >Thông số kỹ thuật: </label> <br>
												<textarea name="thongSoKyThuat" id="thongsokythuat" class="form-control" rows="5"></textarea>
												
												<label for="hinhsanpham" class="mt-4">Hình ảnh: </label> <br>
												<input name="hinhSanPham" type="file" id="hinhsanpham" accept="" class="form-control"/><br>
												
												<p>
													<button type="button" id="btn-capnhat" class="btn btn-danger" >Cập nhật</button>
													 <button type="button" id="btn-themsanpham" class="btn btn-danger btn-them" >Thêm</button>
									          		 <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
												</p>	
											</div>
										</div>
															
									</form>	
								</div>
								
							    </div>
						    </div>
						 </div>	
						 </div>	
					</div>  
					</div>
                	
                	</c:if>               
                </main>
            </div>
        </div>

	<script type="text/javascript">
		
		$(document).ready(function(){
						
			/* PHAN TRANG */
			$("body").on("click", ".page-item", function() {
				$(".page-item").removeClass("active");
				$(this).addClass("active");
				var currentPage =  $(this).text();
				$.ajax({
					url : "/api-admin/laysanphamlimit",
					type : "GET",
					data : {
						currentPage : currentPage,
					},
					success : function(value) {
						var tbodysanpham = $("#table-sanpham ").find("tbody");
						tbodysanpham.empty();
						tbodysanpham.append(value);
					}
				})
			})
			
			/* CHON TAT CA SAN PHAM */
			$("#checkall").change(function(){
				if(this.checked){
					$("#table-sanpham input").each(function(){
						$(this).attr("checked", true);
					})
				}else{
					$("#table-sanpham input").each(function(){
						$(this).attr("checked", false);
					})
				}
			})
			
			/* XOA SAN PHAM */
			$("#xoa-sanpham").click(function(){
				$("#table-sanpham tbody input:checked").each(function(){
					var idsanpham = $(this).val();
					var This = $(this);
					$.ajax({
						url : "/api-admin/xoasanpham",
						type : "GET",
						data : {
							idsanpham: idsanpham,
						},
						success : function(value) {
							This.closest("tr").remove();
							alert("Đã xóa sản phẩm");
							location.reload();
						}
					})  
					
				})
			 }) 
			 
			 /* UPLOAD FILE */
			 var iddanhmuc = 0;
			 var files = [];
			 var hinhsanpham = "";
			 $("#hinhsanpham").change(function(event){
				 iddanhmuc = $("#danhmucsanpham").val();
				 files = event.target.files;
				 hinhsanpham = files[0].name;
				 forms = new FormData();
				 forms.append("file", files[0]);
				 $.ajax({
						url : "/api-admin/laymadanhmuc",
						type : "GET",
						data : {
							iddanhmuc: iddanhmuc,
						},
						success : function(value) {
							
						}
					}).done(function(){
						$.ajax({
							url : "/api-admin/uploadfile",
							type : "POST",
							data:forms,
							contentType: false,
							processData: false, 
							enctype: "multipart/form-data",
							success : function(value) {
								
							}
						})  
					})
					 
			 })
			 
			 /* THEM SAN PHAM */
			 $("#btn-themsanpham").click(function(event){
				 $("#btn-capnhat").hide();
				 event.preventDefault();		
				 var formdata = $("#form-sanpham").serializeArray();
				 json = {};				
				 $.each(formdata, function(i, field){				
					json[field.name] = field.value;
				 });
				 json["hinhSanPham"] = hinhsanpham;
				 $.ajax({
						url : "/api-admin/themsanpham",
						type : "POST",
						data : {
							dataJson: JSON.stringify(json)
						},
						success : function(value) {
							location.reload();
						}
					})
				 
			 })
			 
			 
			 var idsanpham = 0;
			 /* LAY THONG TIN SAN PHAM */
			$("body").on("click", ".btn-sua", function(event){	
				 event.preventDefault();	
				 idsanpham = $(this).attr("data-idsanpham");
				$.ajax({
						url : "/api-admin/laythongtinsanpham",
						type : "POST",
						data : {
							idsanpham: idsanpham,
						},
						success : function(value) {
							console.log(value);
							$("#tensanpham").val(value.tenSanPham);
							$("#giatien").val(value.giaTien);
							$("#mota").val(value.moTa);
							$("#thongsokythuat").val(value.thongSoKyThuat);
							$("#danhmucsanpham").val(value.danhMuc.id);
							$("#thuonghieu").val(value.thuongHieu.id);
							//$("#hinhsanpham").val(value.hinhSanPham);
						}
					})  
				 
			 }) 
			
			 /* CAP NHAT SAN PHAM */
			    $("#btn-capnhat").click(function(event){
				 event.preventDefault();	
				 var formdata = $("#form-sanpham").serializeArray();
				 json = {};				
				 $.each(formdata, function(i, field){				
					json[field.name] = field.value;
				 });
				 json["hinhSanPham"] = hinhsanpham;
				 
				 json["idsanpham"] = idsanpham;
				 console.log(json);
				$.ajax({
						url : "/api-admin/capnhatsanpham",
						type : "POST",
						data : {
							dataJson: JSON.stringify(json)
						},
						success : function(value) {
							location.reload();
						}
					})
			 }) 
			 
			 $("#btn-them").click(function(){
				 $("#btn-themsanpham").show();
				 $("#btn-capnhat").hide();
			 })
			 
			 $("body").on("click", ".btn-sua",  function(){
				 $("#btn-themsanpham").hide();
				 $("#btn-capnhat").show();
			 })
			
			
		})
	
	</script>

</body>
</html>
<%@ include file="/resources/admin/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUẢN LÝ BÌNH LUẬN</title>

<jsp:include page="/resources/admin/common/lib.jsp" />

</head>

<body class="sb-nav-fixed">

	<jsp:include page="/resources/admin/common/header.jsp"/>
        
        <div id="layoutSidenav">
        
           <jsp:include page="/resources/admin/common/menu.jsp"/>
           
            <div id="layoutSidenav_content">
                <main class="p-3">
                	<c:if test="${LoginInfoAdmin == null }">
                		<div class="text-center mt-5">
                			<a class="btn btn-primary" href="/admindangnhap">Đăng nhập để tiếp tục</a>
                		</div>
                	</c:if>
                	<c:if test="${LoginInfoAdmin != null }">
                	<h5 class="text-center m-5">BÌNH LUẬN</h5>
                	<div class="container p-0">
                		<div class="row mb-5 mt-5">
                			<div class="col-md-12">
                				<div style="float: right;">
                					<button id="btn-xoa" class="btn btn-primary">Xóa</button>
                					<button type="button" id="btn-them" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
										Thêm bình luận
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
			 								<th>Tên đăng nhập</th>
			                             	<th>Bình luận</th>
			                             	<th>Mã sản phẩm</th>
			                             	<th>Ngày bình luận</th>
			                                <th>Sửa</th>
										</tr>
			       					 </thead>
			                    	 <tbody>
			                    	 	<c:forEach var="item" items="${listBinhLuan}">                      	 		                 	 	 	
			                    	 		<tr>
			                    	 			<td>
			                    	 				<div class="checkbox">
														<label><input type="checkbox" value="${item.id }"></label>
													</div>
			                    	 			</td>
			                    	 			<td>${item.user.tenDangNhap }</td>
				                                <td>${item.textBinhLuan }</td>
				                                <td>${item.sanPham.id }</td>
				                                <td>${item.ngayBinhLuan }</td>	                                
			                            		<td>
			                            			 <button type="button" class="btn btn-primary btn-sua" data-idbinhluan="${item.id }" data-toggle="modal" data-target="#myModal">
													    <i class="far fa-edit"></i>
													 </button>
			                            		</td>
			                            	</tr>
			                    	 	</c:forEach>
			                    	 </tbody>
                   			 	</table>               			 
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
								        <form id="form" >				
										<div class="row">
											<div class="col-md-12">
												<label for="" class="mt-4">Tên đăng nhập: </label> <br>
												<select name="user" class="form-control" id="user">
													<c:forEach var="item" items="${listUser }">
														<option value="${item.id }">${item.tenDangNhap }</option>
													</c:forEach>
												</select>
												
												<label for="" class="mt-4">Mã sản phẩm: </label> <br>
												<select name="sanPham" class="form-control" id="sanPham">
													<c:forEach var="item" items="${listSanPham }">
														<option value="${item.id }">${item.id }</option>
													</c:forEach>
												</select>
												
												<label class="mt-4" for="">Bình luận:</label> <br>
												<textarea name="textBinhLuan" id="textBinhLuan" class="form-control"  rows="5"></textarea>
											</div>
											<p>
												<button type="button" id="btn-capnhat" class="btn btn-danger" >Cập nhật</button>
												<button type="button" id="btn-themsanpham" class="btn btn-danger btn-them" >Thêm</button>
									          	<button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
											</p>	
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
			
			//XOA BINH LUAN
			$("#btn-xoa").click(function(){
				$("#table-sanpham tbody input:checked").each(function(){
					var id = $(this).val();
					var This = $(this);
					$.ajax({
						url : "/api-admin/xoabinhluan",
						type : "GET",
						data : {
							id: id,
						},
						success : function(value) {
							This.closest("tr").remove();
							alert("Đã xóa bình luận.");
							location.reload();
						}
					})  
					
				})
			})
			
			//THEM BINH LUAN
			$("#btn-themsanpham").click(function(event){
				event.preventDefault();
				var formdata = $("#form").serializeArray();
				json = {};				
				 $.each(formdata, function(i, field){				
					json[field.name] = field.value;
				 });
				 console.log(json);
				 $.ajax({
						url : "/api-admin/thembinhluan",
						type : "POST",
						data : {
							dataJson: JSON.stringify(json)
						},
						success : function(value) {
							location.reload();
						}
				}) 
			})
			
			var idbinhluan = 0;
			 /* LAY THONG TIN BINH LUAN*/
			$("body").on("click", ".btn-sua", function(event){	
				 event.preventDefault();	
				 idbinhluan = $(this).attr("data-idbinhluan");
				$.ajax({
						url : "/api-admin/laythongtinbinhluan",
						type : "POST",
						data : {
							idbinhluan: idbinhluan,
						},
						success : function(value) {
							console.log(value);
							$("#user").val(value.user.id);
							$("#sanPham").val(value.sanPham.id);
							$("#textBinhLuan").val(value.textBinhLuan);
						}
					}) 
				 
			 }) 
			 
			 /* CAP NHAT BINH LUAN */
			    $("#btn-capnhat").click(function(event){
				 event.preventDefault();	
				 var formdata = $("#form").serializeArray();
				 json = {};				
				 $.each(formdata, function(i, field){				
					json[field.name] = field.value;
				 });
				 
				 json["idbinhluan"] = idbinhluan;
				 
				$.ajax({
						url : "/api-admin/capnhatbinhluan",
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
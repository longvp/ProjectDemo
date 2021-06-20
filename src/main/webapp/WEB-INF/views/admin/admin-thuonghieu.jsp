<%@ include file="/resources/admin/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUẢN LÝ THƯƠNG HIỆU</title>

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
                	<h5 class="text-center m-5">THƯƠNG HIỆU</h5>
                	<div class="container p-0">
                		<!-- <div class="row mb-5 mt-5">
                			<div class="col-md-12">
                				<div style="float: right;">
                					<button id="xoa-sanpham" class="btn btn-primary">Xóa</button>
                					<button type="button" id="btn-them" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
										Thêm danh mục<i class="far fa-edit"></i>
									</button>
                				</div>
                			</div>
                		</div> -->
                		<div class="row">
                			<div class="col-md-12">           				
                				<table class="table table-bordered text-center" id="table-sanpham" width="100%" cellspacing="0">
			                    	<thead>
			 							<tr>
			 								<%-- <th>
			                    	 			<div class="checkbox">
													<label><input id="checkall" type="checkbox" value="${item.id }"></label>
												</div>
			                    	 		</th> --%>
			 								<th>ID</th>
			                             	<th>Tên thương hiệu</th>
			                                <!-- <th>Sửa</th> -->
										</tr>
			       					 </thead>
			                    	 <tbody>
			                    	 	<c:forEach var="item" items="${listThuongHieu}">                      	 		                 	 	 	
			                    	 		<tr>
			                    	 			<%-- <td>
			                    	 				<div class="checkbox">
														<label><input type="checkbox" value="${item.id }"></label>
													</div>
			                    	 			</td> --%>
			                    	 			<td>${item.id }</td>
				                                <td class="ten-sp" data-idsanpham = "${item.id }">${item.tenThuongHieu }</td>		                                
			                            		<%-- <td>
			                            			 <button type="button" class="btn btn-primary btn-sua" data-idsanpham="${item.id }" data-toggle="modal" data-target="#myModal">
													    <i class="far fa-edit"></i>
													 </button>
			                            		</td> --%>
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
								        <form id="form-sanpham" >				
										<div class="row">
											<div class="col-md-12">
												<label for="tensanpham">Tên danh mục</label> <br>
												<input name="tenSanPham" type="text" id="tensanpham" class="form-control" /><br>
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

	
		
</body>
</html>
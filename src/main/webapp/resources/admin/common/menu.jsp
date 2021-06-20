<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                        	<a class="nav-link" href="/danhsachsanpham">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Quản lý sản phẩm
                            </a>
                            	<a class="nav-link" href="/adminbinhluan">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Quản lý bình luận
                            </a>
                        
                        	 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Quản lý người dùng
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<c:forEach var="item" items="${listchucvu }">
                                		<a class="nav-link" href="/adminuser/${item.id }">${item.tenChucVu }</a>
                                	</c:forEach>                                  
                                </nav>
                            </div>
                            
                            <!-- ------------------------------------------ -->
                      		
                        
                            <!-- <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Quản lý sản phẩm
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/danhsachsanpham">Sản phẩm</a>

                                </nav>
                            </div> -->
                            
                            <!-- ------------------------------------------ -->
                      		
                      		<a class="nav-link" href="/adminhoadon">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Quản lý hóa đơn
                            </a>
                            <a class="nav-link" href="/adminlienhe">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Quản lý liên hệ
                            </a>
                            <a class="nav-link" href="/admindanhmuc">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Quản lý danh mục
                            </a>
                            <a class="nav-link" href="adminthuonghieu">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Quản lý thương hiệu
                            </a>
                           
                    
                        </div>
                    </div>
                </nav>
            </div>
            <script type="text/javascript">
            
            	$(document).ready(function(){
            		$(".nav-link").click(function(){
            			$(".nav-link").removeClass("active");
            			$(this).addClass("active");
            		})
            	})

			</script>

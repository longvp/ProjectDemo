<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Footer #f5f0f0 -->
    <footer>
    	<div class="go-to-top show" title="Lên đầu trang">
            <i class="fa fa-chevron-up" aria-hidden="true" style="color: #fff"></i>
        </div>
        <div class="container-fluid footer-bg mt-5">
            <div class="row p-5">
                <div class="col-md-1"></div>
                <div class="col-md-3 footer">
                    <h5>THÔNG TIN CÔNG TY</h5>
                    <ul>
                        <li>
                            T-MART là giải pháp mua sắm tiện lợi cho bạn. Tmart luôn mang đến cho bạn sự tin tưởng, chất
                            lượng và uy tín. T-MART tự tin mang lại cho bạn những trải nghiệm mua sắm tuyệt vời nhất
                        </li>
                    </ul>
                </div>
                <div class="col-md-4 footer">
                    <h5>CHÚNG TÔI Ở ĐÂY</h5>
                    <ul>
                        <li>
                            Công ty Cổ phần T-MART Việt Nam Số 102 Thái Thịnh, phường Trung Liệt, quận Đống Đa, TP Hà
                            Nội
                        </li>
                        <li>ĐT: 0247 309 9966</li>
                        <li>Email: admin@gmail.com</li>
                    </ul>
                </div>
                <div class="col-md-2 footer">
                    <h5>HƯỚNG DẪN</h5>
                    <ul>
                        <li><a href="./Xuhuong.html">Xu hướng</a></li>
                        <li><a href="./Khuyenmai.html">Khuyến mại</a></li>
                        <li><a href="./Tintuc.html">Tin tức</a></li>
                        <li><a href="./Lienhe.html">Liên hệ</a></li>
                    </ul>
                </div>
                <div class="col-md-2 footer">
                    <h5>FOLLOW ME</h5>
                    <ul>
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer end -->
    
    <script type="text/javascript">
    
    $(document).ready(function(){

        var showGoToTop =  500;
        $(window).scroll(function(){
            if($(this).scrollTop() >= showGoToTop){
                $(".go-to-top").fadeIn();
            }else{
                $(".go-to-top").fadeOut();
            }
        })

        $(".go-to-top").click(function(){
            $('html, body').animate({scrollTop: 0}, "slow");
        })

    })

	</script>
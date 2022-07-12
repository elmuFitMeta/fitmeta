<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />
        
        
        
        <!-- Footer Start -->
        <div class="footer wow fadeIn" data-wow-delay="0.3s">
            <div class="container-fluid">
                <div class="container">
                    <div class="footer-info">
                        <a href="index.html" class="footer-logo">F<span>it</span>meta</a>
                        <h3>123 Street, Tokyo, Japan</h3>
                        <div class="footer-menu">
                            <p>+012 345 67890</p>
                            <p>info@example.com</p>
                        </div>
                        <div class="footer-social">
                            <a href=""><i class="fab fa-twitter"></i></a>
                            <a href=""><i class="fab fa-facebook-f"></i></a>
                            <a href=""><i class="fab fa-youtube"></i></a>
                            <a href=""><i class="fab fa-instagram"></i></a>
                            <a href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="container copyright">
                    <div class="row">
                        <div class="col-md-6">
                            <p>&copy; <a href="#">FitMeta</a>, All Right Reserved.</p>
                        </div>
                        <div class="col-md-6">
                            <p>Designed By <a href="https://htmlcodex.com">DreamHanks</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="${projectPath}/css/lib/easing/easing.min.js"></script>
        <script src="${projectPath}/css/lib/wow/wow.min.js"></script>
        <script src="${projectPath}/css/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="${projectPath}/css/lib/isotope/isotope.pkgd.min.js"></script>
        <script src="${projectPath}/css/lib/lightbox/js/lightbox.min.js"></script>
        
        <!-- Contact Javascript File -->
        <script src="${projectPath}/mail/jqBootstrapValidation.min.js"></script>
        <script src="${projectPath}/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="${projectPath}/js/main.js"></script>
        <script src="${projectPath}/js/common.js?1.1"></script>
        <script src="${projectPath}/js/fitMetaDAO.js?1.1"></script>
		<script src="${projectPath}/js/dev.mrgelo.js?1.1"></script>
		<script src="${projectPath}/js/dev.mrgelo.temp.js?1.1"></script>
		<script type="text/javascript">
			var contextPath = '${projectPath}';
		</script>
    </body>
</html>
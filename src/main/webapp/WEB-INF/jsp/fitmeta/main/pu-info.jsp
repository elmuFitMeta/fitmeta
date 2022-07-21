<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../common/panel-head.jsp" />

<body>

    <jsp:include page="../common/panel-menu.jsp" />
        <!-- Single pro tab review Start-->
        <div class="single-pro-review-area mt-t-30 mg-b-15">
            <div class="container-fluid">
                <div class="row" style="margin-top:5%;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-payment-inner-st">
                            <ul id="myTabedu1" class="tab-review-design">
                                <li class="active"><a href="#reviews"> Edit Account Information</a></li>
                                <li><a href="#INFORMATION">Edit Social Information</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content custom-product-edit">
                                <div class="product-tab-list tab-pane fade active in" id="reviews">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="review-content-section">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="devit-card-custom">
                                                            <div class="form-group">
                                                            	<label>Name</label>
                                                                <input id="_user-nm" type="text" class="form-control" placeholder="Name">
                                                            </div>
                                                            <div class="form-group">
                                                            	<label>Email</label>
                                                                <input id="_email" type="text" class="form-control" placeholder="email">
                                                            </div>
                                                            <div class="form-group">
                                                            	<label>Phone</label>
                                                                <input id="_phone" type="number" class="form-control" placeholder="Phone">
                                                            </div>
                                                            <a href="#!" class="btn btn-primary waves-effect waves-light">Submit</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-tab-list tab-pane fade" id="INFORMATION">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="review-content-section">
												<div class="row">
													<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
														<div class="devit-card-custom">
															<div class="form-group">
																<input type="url" class="form-control" placeholder="Facebook URL" value="http://www.facebook.com">
															</div>
															<div class="form-group">
																<input type="url" class="form-control" placeholder="Twitter URL" value="http://www.twitter.com">
															</div>
															<div class="form-group">
																<input type="url" class="form-control" placeholder="Google Plus" value="http://www.google-plus.com">
															</div>
															<div class="form-group">
																<input type="url" class="form-control" placeholder="Linkedin URL" value="http://www.Linkedin.com">
															</div>
															<button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
														</div>
													</div>
												</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <jsp:include page="../common/panel-foot.jsp" />
    <script src="${projectPath}/js/main/pu-info.js?1.1"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="projectPath" value="${pageContext.request.contextPath}" />


<script src="${projectPath}/js/layer/reg.js?1.1"></script>


<!-- registeration of PT -->
<div id="wrap" class="tt_custom_sm">
   <div class="contact">
       <div class="container">
           <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
               <p>Get In Touch</p>
               <h2>一般ユーザーの登録</h2>
           </div>
           <div class="row">
               <div class="col-12">
                   <div class="row">
                       <div class="col-md-4 contact-item wow zoomIn" data-wow-delay="0.2s">
                           <i class="fa fa-map-marker-alt"></i>
                           <div class="contact-text">
                               <h2>Location</h2>
                           </div>
                       </div>
                       <div class="col-md-4 contact-item wow zoomIn" data-wow-delay="0.4s">
                           <i class="fa fa-phone-alt"></i>
                           <div class="contact-text">
                               <h2>Phone</h2>
                           </div>
                       </div>
                       <div class="col-md-4 contact-item wow zoomIn" data-wow-delay="0.6s">
                           <i class="far fa-envelope"></i>
                           <div class="contact-text">
                               <h2>Email</h2>
                           </div>
                       </div>
                   </div>
               </div>
               <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                   <div class="contact-form">
                       <div id="success"></div>
                       <div class="control-group">
                           <input type="text" class="form-control" id="name" placeholder="名前" disabled />
                           <p class="help-block text-danger"></p>
                       </div>
                       <div class="control-group">
                           <input type="email" class="form-control" id="mail" placeholder="メールアド レス" disabled />
                           <p class="help-block text-danger"></p>
                       </div>
                       <div class="control-group">
                           <input type="tel" class="form-control" id="mobile" placeholder="電話番号" required="required" data-validation-required-message="Please enter a subject" />
                           <p class="help-block text-danger"></p>
                       </div>
                       <div>
                           <button class="btn" type="button" id="btn_pub" onclick="clickUserBtnSave()">アップロード (公開)</button>
                            <button class="btn" type="button" id="btn_delete" onclick="clickBtnDelete()">削除</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--  End -->

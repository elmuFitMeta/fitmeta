<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />





<!-- Nav Bar Start -->
<div class="navbar navbar-expand-lg bg-dark navbar-dark">
    <div class="container-fluid">
        <a href="/fit-meta/index.do" class="navbar-brand">f<span>it</span>meta</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav ml-auto">
                <a href="/fit-meta/pt/index.do" id="_home" class="nav-item nav-link">ホーム</a>
                <a href="/fit-meta/pt/about.do" id="_myPage" class="nav-item nav-link">マイページ</a>
                <a href="/fit-meta/pt/service.do" id="_service" class="nav-item nav-link">サービス</a>
                <a href="/fit-meta/pt/price.do" id="_price" class="nav-item nav-link">プライス</a>
                <a href="/fit-meta/pt/class.do" id="_class" class="nav-item nav-link">クラス</a>
                <a href="/fit-meta/pt/contents.do" id="_contents" class="nav-item nav-link">コンテンツ</a>
                <a href="/fit-meta/pt/news.do" id="_news" class="nav-item nav-link">ニュース</a>
                <a href="/fit-meta/pt/register.do" id="_register" class="nav-item nav-link">Register</a>
            </div>
        </div>
    </div>
</div>
<!-- Nav Bar End -->





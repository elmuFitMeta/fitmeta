<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />


<!-- Nav Bar Start -->
<div class=" navbar navbar-expand-lg bg-dark navbar-dark">
    <div class="container-fluid">
        <a href="/fit-meta/index.do" class="navbar-brand">f<span>it</span>meta</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav ml-auto">
                <a href="/fit-meta/index.do" class="nav-item nav-link active">Home</a>
                <a href="/fit-meta/main/about.do" class="nav-item nav-link">About</a>
                <a href="/fit-meta/main/service.do" class="nav-item nav-link">Service</a>
                <a href="/fit-meta/main/team.do" class="nav-item nav-link">Trainers</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">News</a>
                    <div class="dropdown-menu">
                        <a href="/fit-meta/main/news.do" class="dropdown-item">News Grid</a>
                        <a href="/fit-meta/main/single.do" class="dropdown-item">News Detail</a>
                    </div>
                </div>
                <a href="contact.do" class="nav-item nav-link">Contact</a>
            </div>
        </div>
    </div>
</div>
<!-- Nav Bar End -->



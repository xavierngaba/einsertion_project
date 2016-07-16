<%-- 
    Document   : carousel
    Created on : 14 août 2014, 19:20:21
    Author     : XAVIER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Carousel
================================================== -->
    <div id="myCarousel" class="carousel slide">
        <div class="carousel-inner">
            <div class="item active">
                <img src="<c:url value="/bootstrap/img/index.jpg"/>" alt="">
            </div>
            <div class="item">
                <img src="<c:url value="/bootstrap/img/images.jpg"/>" alt="">
            </div>
            <div class="item">
                <img src="<c:url value="/bootstrap/img/images2.jpg"/>" alt="">
            </div>
            <div class="item">
                <img src="<c:url value="/bootstrap/img/images3.jpg"/>" alt="">
            </div>
            <div class="item">
                <img src="<c:url value="/bootstrap/img/images4.jpg"/>" alt="">
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div><!-- /.carousel -->

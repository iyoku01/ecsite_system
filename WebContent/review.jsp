<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<title>レビュー</title>
</head>
<body>

    <!-- 共通ヘッダー -->
    <jsp:include page="header.jsp" flush="true" />

    <!-- 商品情報 -->
        <span>${product.product_name}</span>
        <span>${product.ave_eval}</span>
        <p>${product.hard_name}</p>
        <img src="${product.mainPic_file}" width="100" >
        <span>${product.price}</span>
        <p class=info>${product.info}</p>
        <form action="reviewWrite.jsp" method="post">
                    <input type=hidden name=product_id value="${review.product_id}">
                    <input type=hidden name=nickname value="${review.nickname}">
                    <input type=hidden name=evaluation value="${review.evaluation}">
                    <input type=hidden name=review value="${review.review}">
                    <input type=hidden name=product_name value="${product.product_name}">
                    <input type=hidden name=price value="${product.price}">
                    <input type=hidden name=info value="${product.info}">
                    <input type=hidden name=hard_name value="${product.hard_name}">
                    <input type=hidden name=ave_eval value="${product.ave_eval}">
                    <input type=hidden name=mainPic_file value="${product.mainPic_file}">
                    <input type=hidden name=review_count value="${product.review_count}">
                    <c:choose>
                        <c:when test="${!empty review}">
                            <input type=hidden name=update value="true">
                            <input type=submit value=レビューを変更する>
                        </c:when>
                        <c:otherwise>
                            <input type=submit value=レビューを書く>
                        </c:otherwise>
                    </c:choose>
        </form>



    <!-- レビューがまだ無ければメッセージ -->
    <p>${message}</p>

    <!-- 送信パラメータ -->
    <c:if test="${!empty writeReview}">
        <c:choose>
            <c:when test="${!empty review}">
                <!-- あれば自分のレビュー -->
                <p>このゲームに対するあなたのレビュー</p>
                <div class="ownReview">
                   <span>投稿者</span>
                   <span>${review.nickname}</span>
                   <span>${review.date}</span>
                   <span class=evaluation>${review.evaluation}</span>
                   <p>${review.review}</p>
                </div>
            </c:when>
        </c:choose>
    </c:if>




  <p>${product.review_count}件のカスタマーレビュー</p>
    <!-- レビューのリスト -->
        <c:forEach var="i" items="${reviewList}">
            <div class="oneReview">
                  <span>投稿者</span>
                  <span>${i.nickname}</span>
                  <span>${i.date}</span>
                  <span class=evaluation>${i.evaluation}</span>
                  <p>${i.review}</p>
             </div>
        </c:forEach>




</body>
</html>
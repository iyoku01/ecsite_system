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
<div row>
  <p>${product.product_name}</p>
  <p>${product.price}</p>
  <p>${product.info}</p>
  <p>${product.hard_name}</p>
  <p>${product.ave_eval}</p>
  <p>${product.mainPic_file}</p>
  <p>${product.review_count}</p>
</div>

<!-- レビューがまだ無ければメッセージ -->
<p>${message}</p>

<!-- 送信パラメータ -->
<c:if test="${!empty writeReview}">
  <c:choose>
    <c:when test="${!empty review}" >
    <!-- あれば自分のレビュー -->
      <p>${review.product_id}</p>
      <p>${review.user_id}</p>
      <p>${review.nickname}</p>
      <p>${review.evaluation}</p>
      <p>${review.review}</p>
      <p>${review.date}</p>
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
        <input type=hidden name=update value="true">
        <input type=submit value=レビューを変更する>
      </form>
    </c:when>
    <c:otherwise>
      <p><a href=reviewWrite.jsp?product_id=${product_id}>レビューを書く</a></p>
    </c:otherwise>
  </c:choose>
</c:if>





<!-- レビューのリスト -->
<div class="row">
<c:forEach var="i" items="${reviewList}">
    <p>${i.product_id}</p>
    <p>${i.user_id}</p>
    <p>${i.nickname}</p>
    <p>${i.evaluation}</p>
    <p>${i.review}</p>
    <p>${i.date}</p>
</c:forEach>
</div>




</body>
</html>
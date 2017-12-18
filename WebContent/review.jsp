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

<p>${message}</p>

<c:if test="${writeReview == 'true'}" var="flg" />

<c:if test="${flg}" >
<p><a href=reviewWrite.jsp?product_id="${product_id}"&user_id="${user_id }">レビューを書く</a></p>
</c:if>




<div class="row">
<c:forEach var="i" items="${reviewList}">
    <p>${ireview_id}</p>
    <p>${i.product_id}</p>
    <p>${i.user_id}</p>
    <p>${i.evaluation}</p>
    <p>${i.review}</p>
    <p>${i.date}</p>
</c:forEach>
</div>




</body>
</html>
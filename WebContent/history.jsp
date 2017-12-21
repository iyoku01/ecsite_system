<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<link rel="stylesheet" type="text/css" href="css/style.css">

<title>購入履歴</title>
</head>
<body>

<div class="row">
<c:forEach var="i" items="${historyList}">
    <p>${i.date}</p>
    <p>${i.order_id}</p>
    <p>${i.product_name}</p>
    <p>${i.price}</p>
    <p>${i.number}</p>
    <p>${i.pic_file}</p>
    <p>${i.shipping}</p>
    <p><a href=ProductDetail.Control?product_id=${i.product_id}>商品詳細画面へ</a></p>
    <p><a href=http://localhost:8080/ecsite_system/ReviewSelect.Control?product_id=${i.product_id}>レビューを書く</a></p>
</c:forEach>
</div>


</body>
</html>
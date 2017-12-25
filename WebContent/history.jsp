<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- El End -->

<%@ page import="model.Util.*" %>

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<link rel="stylesheet" type="text/css" href="css/style.css">

<title>購入履歴</title>
</head>
<body>
<!-- ヘッダー(ロゴ無し) -->
<jsp:include page="header_logoOnly.jsp" flush="true" />

    <span class=title>購入履歴</span>

<!-- 購入した商品のリスト -->
        <c:forEach var="i" items="${historyList}">
        <div class="oneHistory clearfix">
            <span>購入日：${i.date}</span>
            <span>購入番号：${i.order_id}</span>
            <p class=weight>${i.product_name}</p>

            <p class=float>
                <a href=ProductDetail.Control?product_id=${i.product_id}><img class=float src="${i.pic_file}" width="60"></a>
            </p>
            <div class=innerElement>
            <p class=productPrice> <fmt:formatNumber value="${i.price}" pattern="\#,###" /></p>
            <p class=zaiko>${i.shipping}</p>
            </div>
            <div class=right>
            <form action=ReviewSelect.Control method=post>
                <input type=hidden name=product_id value="${i.product_id}">
                <input type=submit class=orange-button value="レビューを書く">
            </form>
            </div>
            </div>
        </c:forEach>



</body>
</html>
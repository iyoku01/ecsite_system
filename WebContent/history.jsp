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

<title>�w������</title>
</head>
<body>
<!-- �w�b�_�[(���S����) -->
<jsp:include page="header_logoOnly.jsp" flush="true" />

    <span class=title>�w������</span>

<!-- �w���������i�̃��X�g -->
        <c:forEach var="i" items="${historyList}">
        <div class="oneHistory clearfix">
            <span>�w�����F${i.date}</span>
            <span>�w���ԍ��F${i.order_id}</span>
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
                <input type=submit class=orange-button value="���r���[������">
            </form>
            </div>
            </div>
        </c:forEach>



</body>
</html>
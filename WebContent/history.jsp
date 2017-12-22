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

<title>�w������</title>
</head>
<body>
<jsp:include page="header_logoOnly.jsp" flush="true" />

    <span class=title>��������</span>


    <div class="oneHistory clearfix">
        <c:forEach var="i" items="${historyList}">
            <span>${i.date}</span>
            <span>�w���ԍ��F${i.order_id}</span>
            <p class=weight>${i.product_name}</p>

            <p class=float>
                <a href=ProductDetail.Control?product_id=${i.product_id}><img class=float src="${product.mainPic_file}" width="80"></a>
            </p>
            <p class=productPrice>${i.price}</p>
            <p class=zaiko>${i.shipping}</p>
            <div class=right>
            <form action=ReviewSelect.Control method=post>
                <input type=hidden name=product_id value="${i.product_id}">
                <input type=submit class=orange-button value="���r���[������">
            </form>
            </div>
        </c:forEach>
    </div>


</body>
</html>
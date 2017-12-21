<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<link rel="stylesheet" type="text/css" href="css/style3.css">

<title>カート</title>
</head>
<body>
    <!-- 共通ヘッダー -->
    <jsp:include page="header.jsp" flush="true" />

    <!-- 購入数のドロップダウンの最大値 -->
    <c:set var="BUY_COUNT_MAX" value="10" />

    <div class="cart">
        <p>${message}</p>
        <c:forEach var="i" items="${cart.cartProductList}">
            <table>
                <tr>
                    <td><p><img title="product_id = ${i.product_id}" src="${i.mainPic_file}"/></p><p class="mozifont"> ${i.product_name}</p></td>
                    <td>
                        <form action="CartDelete.Control" method="get" class="mozifont">
                            <!-- 商品ID（隠し項目） -->
                            <input type="hidden" name="product_id" value="${i.product_id}" form="cart-product">
                            <fmt:formatNumber value="${i.price}" pattern="\#,###(税込)" />
                            個数
                            <!-- 購入数選択 -->
                            <select name="buy_count" form="cart-product">
                                <c:forEach begin="1" end="${i.buy_count + BUY_COUNT_MAX}" varStatus="status">
                                    <option value="${status.index}"
                                        <c:if test="${status.index == i.buy_count}" >
                                            selected
                                        </c:if>>
                                        ${status.index}
                                    </option>
                                </c:forEach>
                            </select>
                            <!-- 商品ID（隠し項目） -->
                            <input type="hidden" name="product_id" value="${i.product_id}">
                            <INPUT TYPE="submit" VALUE="削除" class="cartbotton-delete">
                        </form>
                        <p>
                    </td>
                </tr>
            </table>
        </c:forEach>

        <form id="cart-product" action="productBuyConf.Control" method="get"  class="mozifont">
            小計（商品${cart.sumBuyCount}点):
            <fmt:formatNumber value="${cart.sumPrice}" pattern="\#,###" />
            (税込） <INPUT TYPE="submit" VALUE="レジに進む" class="cartbotton">
        </form>
    </div>

</body>
</html>

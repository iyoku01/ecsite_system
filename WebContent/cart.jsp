<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<title>カート</title>
</head>
<body>
    <!-- 共通ヘッダー -->
    <jsp:include page="header.jsp" flush="true" />

    <!-- 購入数のドロップダウンの最大値 -->
    <c:set var="BUY_COUNT_MAX" value="10" />

    <div class="cart">
        <p>${message}</p>
        <table>
            <c:forEach var="i" items="${cart.cartProductList}">
                <tr>
                    <td>
                        <!-- 商品ID（隠し項目） --> <input type="hidden" name="product_id" value="${i.product_id}" form="cart-product">
                        <img title="product_id = ${i.product_id}" src="${i.mainPic_file}" width="200" height="150" /> 商品名${i.product_name}
                    </td>
                    <td>値段${i.price} 個数${i.buy_count} <!-- 購入数選択 --> <select name="buy_count" form="cart-product">
                            <c:forEach begin="1" end="${i.buy_count + BUY_COUNT_MAX}" varStatus="status">
                                <option value="${status.index}" <c:if test="${status.index == i.buy_count}" >
                                        selected
                                        </c:if>>${status.index}</option>
                            </c:forEach>
                    </select>
                        <form action="CartDelete.Control" method="get">
                            <!-- 商品ID（隠し項目） -->
                            <input type="hidden" name="product_id" value="${i.product_id}"> <INPUT TYPE="submit" VALUE="削除">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <form id="cart-product" action="productBuyConf.Control" method="get">
            小計（商品${cart.sumBuyCount}点):￥${cart.sumPrice}(税込） <INPUT TYPE="submit" VALUE="レジに進む">
        </form>
    </div>

    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />


</body>
</html>

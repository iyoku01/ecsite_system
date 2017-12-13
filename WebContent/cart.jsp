<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="database.*"%>
<%@ page import="java.util.*"%>

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
    <!--
    <p>---------------------------------------------------------------</p>
    <p>- 値取得サンプル</p>
    <p>---------------------------------------------------------------</p>
    <a href=http://localhost:8080/ecsite_system/Cart.Control>サンプルURL</a>
    <c:forEach var="i" items="${cartList}">
        <p>${i}</p>
    </c:forEach>
    <p>${sumBuy_count}</p>
    <p>${sumPrice}</p>
    <p>${cartMap}</p>
    <p>${message}</p>
    <p>---------------------------------------------------------------</p>
     -->
    <div class="bodywhite">

        <!-- 購入数のドロップダウンの最大値 -->
        <c:set var="BUY_COUNT_MAX" value="9" />

        <!-- 共通ヘッダー -->
        <jsp:include page="header.jsp" flush="true" />

        <div class="cart">
            <p>${message}</p>
            <table>
                <c:forEach var="i" items="${cartList}">
                    <tr>
                        <td>商品画像${i.mainPic_file} 商品名${i.product_name}</td>
                        <td>値段${i.price} 個数${i.buy_count} <!-- 購入数選択 --> <select name="buy_count">
                                <c:forEach begin="1" end="${BUY_COUNT_MAX}" varStatus="status">
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

            小計（商品${sumBuy_count}点):￥${sumPrice}(税込） <a href=Top.Control> <INPUT TYPE="submit" VALUE="レジに進む" class="top">

            </a>
        </div>

        <!-- 共通フッター -->
        <div class="col-xs-12">
            <jsp:include page="footer.jsp" flush="true" />
        </div>

    </div>
</body>
</html>
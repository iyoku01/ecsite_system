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
<title>購入確認</title>
</head>
<body>
    <div class="bodygray">

        <!-- 共通ヘッダー -->
        <jsp:include page="header_logoOnly.jsp" flush="true" />
        <!-- pageー -->
        <p>${message}</p>

        <p>お届け先住所</p>
        <p>${personalData.postal_code}</p>
        <p>${personalData.address}</p>
        <br>
        <p>名前</p>
        <p>${personalData.name}</p>
        <br>
        <p>電話番号</p>
        <p>${personalData.phone}</p>
        <br>
        <form action="productBuyDone.Control" method="get">
            <p>商品の小計</p>
            <p>${cart.sumPrice}</p>
            <br> <INPUT TYPE="submit" VALUE="注文を確定する">
        </form>
        <br> <br>
        <p>注文内容を確認</p>
        <table>
            <c:forEach var="i" items="${cart.cartProductList}">
                <tr>
                    <td>商品画像<br>
                    <img title="product_id = ${i.product_id}" src="${i.mainPic_file}" width="200" height="150" /><br>商品名${i.product_name} <br>個数${i.buy_count} <br>値段${i.price}
                    </td>
                </tr>
            </c:forEach>
        </table>

        <!-- 共通フッター -->
        <jsp:include page="footer.jsp" flush="true" />
    </div>
</body>
</html>

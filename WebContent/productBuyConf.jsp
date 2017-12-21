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
<div class="productBuyConf">

    <!-- 共通ヘッダー -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />
    <!-- pageー -->
    <p>${message}</p>


<div class="pBC1">
<table>
    <td>お届け先住所<br>
    ${personalData.postal_code}<br>
    ${personalData.address}<br>
    名前<br>
    ${personalData.name}<br>
    電話番号<br>
    ${personalData.phone}</td>
        </table>
        </div>
</div>
<div class="float">
<div class="pBC2">
        <table>
    <form action="productBuyDone.Control" method="get">
        <td>商品の小計<br>
        ${cart.sumPrice}<br>
        <INPUT TYPE="submit" VALUE="注文を確定する"></td>
    </form>
        </table>
</div>


        <div class="memborder">



<div class="pBC3">
        <table>
    <td>注文内容を確認<br>
        <c:forEach var="i" items="${cart.cartProductList}">
                    <img title="product_id = ${i.product_id}" src="${i.mainPic_file}" width="200" height="150" /><br>商品名${i.product_name} <br>個数${i.buy_count} <br>値段${i.price}
                    </td>
        </c:forEach>
    </table>
</div>
</div>
    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />

</div>
</body>
</html>

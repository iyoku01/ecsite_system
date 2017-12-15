<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<title>購入確認</title>
</head>
<body>

    <!-- 共通ヘッダー -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />
    <!-- pageー -->
    <p>${message}</p>

<<<<<<< HEAD
    <p>お届け先住所</p>
    <p>${personalData.postal_code}</p>
    <p>${personalData.address}</p>
    <p>名前</p>
    <p>${personalData.name}</p>
    <p>電話番号</p>
    <p>${personalData.phone}</p>
    <p>
    <form action="productBuyDone.Control" method="get">
        <p>商品の小計</p>
        <p>${cart.sumPrice}</p>
        <INPUT TYPE="submit" VALUE="注文を確定する">
    </form>
    <p>
    <p>注文内容を確認</p>
    <table>
        <c:forEach var="i" items="${cart.cartProductList}">
            <tr>
                <td>商品画像${i.mainPic_file} 商品名${i.product_name} 個数${i.buy_count} 値段${i.price}</td>
            </tr>
        </c:forEach>
    </table>
=======




    <h2 style="position:relative;0%">
        お買い上げいただき誠にありがとうございました。<br>購入番号：${order_id}
    </h2>

    <p class="text-danger">※購入番号はお問い合わせ時に必要になりますので大切に保管ください</p>

    <a href=Top.Control> トップページに戻る </a>


>>>>>>> branch 'master' of https://github.com/iyoku01/ecsite_system.git


    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />
</body>
</html>

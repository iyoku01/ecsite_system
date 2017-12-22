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
<link rel="stylesheet" type="text/css" href="css/style.css">

<title>購入確認</title>
</head>
<body class="bodywhite">

    <!-- 共通ヘッダー -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />
    <!-- pageー -->
    <div class="productBuyConf">
        <div class="float productBuyConf_Box">

            <p>${message}</p>

            <div class="float">
                <label>お届け先住所</label>
                <p>${personalData.postal_code}</p>
                <p>${personalData.address}</p>
                <label>名前</label>
                <p>${personalData.name}</p>
                <label> 電話番号</label>
                <p>${personalData.phone}</p>
            </div>
        </div>
        <div class="float productBuyConf_Box">
            <table>
                <tr>
                    <td>商品の小計：</td>
                    <td><fmt:formatNumber value="${cart.sumPrice}" pattern="\#,###(税込)" /></td>
                </tr>
                <tr>
                    <td>配送料：</td>
                    <td>\0</td>
                </tr>
                <tr class="productBuyConf_tableSum">
                    <td>ご請求額：</td>
                    <td><fmt:formatNumber value="${cart.sumPrice}" pattern="\#,###(税込)" /></td>
                </tr>
            </table>

            <form action="productBuyDone.Control" method="get">
                <INPUT TYPE="submit" VALUE="注文を確定する">
            </form>
        </div>

        <div class="clearfix"></div>

        <div class="productBuyConf_Box">
            <label class="productBuyConf_ListTitle">注文内容を確認</label>
            <table>
                <c:forEach var="i" items="${cart.cartProductList}">
                    <tr>
                        <td><img src="${i.mainPic_file}" width="70" height="90" /> </td>
                        <td><span class="mozifont">${i.product_name}</span><br><br>
                        数量：${i.buy_count} &nbsp;&nbsp;&nbsp; 価格：<fmt:formatNumber value="${i.price}" pattern="\#,###" /></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</body>
</html>

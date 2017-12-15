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

<title>商品詳細</title>
</head>

<body>
    <!--
    <p>---------------------------------------------------------------</p>
    <p>- 値取得サンプル</p>
    <p>---------------------------------------------------------------</p>
    <a href=http://localhost:8080/ecsite_system/ProductDetail.Control?product_id=1>サンプルURL</a>
    <p>${product.product_id}</p>
    <p>${product.product_name}</p>
    <p>${product.price}</p>
    <p>${product.stocks}</p>
    <p>${product.comment}</p>
    <p>${product.hard_id}</p>
    <p>${product.category_id}</p>
    <p>${product.ave_eval}</p>
    <p>${product.review_count}</p>
    <p>${product.mainPic_file}</p>
    <c:forEach var="i" items="${productPicSub}">
        <p>${i}</p>
    </c:forEach>
    <p>---------------------------------------------------------------</p>
 -->

    <!-- 購入数のドロップダウンの最大値 -->
    <c:set var="BUY_COUNT_MAX" value="9" />

    <!-- 共通ヘッダー -->
    <jsp:include page="header.jsp" flush="true" />

    <!-- メイン画像 -->
    <div class="mainGazou">
        <!--画像   ${product.mainPic_file} -->
        <img src="${product.mainPic_file}" width="400" height="300">
    </div>
    <!-- サブ画像 -->

    <c:forEach var="i" items="${productPicSub}">
        <div class="subGazou">
            <!--  <p>${i}</p> -->
            <img src="${i}" width="200" height="130">
        </div>

    </c:forEach>


    <!-- 商品タイトル -->
    <div class="productTitle">${product.product_name}</div>
    <div class="producthard">
        <p>${product.hard_name}</p>
    </div>
    <!-- 評価 -->
    <div class="ave_eval">
        <c:forEach begin="1" end="${product.ave_eval}">
        ☆
    </c:forEach>
    </div>

    <!-- レビュー画面リンク -->
    <div class="review">
        <!--  リンク先修正 -->
        <a href="review.jsp">${product.review_count}件のカスタマーレビュー</a>
    </div>

    <!-- 金額表示 -->
    <div class="productPrice">
        \
        <fmt:formatNumber value="${product.price}" pattern="###,###" />
    </div>
    <div class="zaiko">在庫あり</div>

    <form action="CartAdd.Control" method="get">
        <!-- 商品ID（隠し項目） -->
        <input type="hidden" name="product_id" value="${product.product_id}">

        <!-- 購入数選択 -->
        <div class="kosuuSentaku">
            <select name="buy_count">

                <c:forEach begin="1" end="${BUY_COUNT_MAX}" varStatus="status">
                    <option value="${status.index}">${status.index}</option>
                </c:forEach>

            </select>
        </div>
        <div class="cratkey">
            <input type="submit" value="カートに入れる">
        </div>
    </form>

    <!-- 商品説明 -->
    <div class="productDatail">${product.info}</div>

    <!-- 店長コメント -->
    <div class="pReview">
        店長コメント ${product.comment}
        <p>${message}</p>
    </div>

    <!-- 共通フッター-->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>


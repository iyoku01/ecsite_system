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

<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
    $(function() {
        $('.subGazou img').click(function() {
            var $thisImg = $(this).attr('src');
            $('.mainGazou img').attr({
                src : $thisImg
            });
        });
    });
</script>

<title>商品詳細</title>
</head>

<body>

    <!-- 購入数のドロップダウンの最大値 -->
    <c:set var="BUY_COUNT_MAX" value="10" />

    <!-- 共通ヘッダー -->
    <jsp:include page="header.jsp" flush="true" />


    <div class="border clearfix">
        <!--  サブコンテンツ（画面左）-->
        <div class="productDatail-sub-content border clearfix">
            <!-- サブ画像 -->
            <div class="subGazou cursorPointer">
                <img src="${product.mainPic_file}">
                <c:forEach var="i" items="${productPicSub}">

                    <!--  <p>${i}</p> -->
                    <img src="${i}">


                </c:forEach>
            </div>
            <!-- メイン画像 -->
            <div class="mainGazou">
                <!--画像   ${product.mainPic_file} -->
                <img src="${product.mainPic_file}">
            </div>

        </div>

        <!-- メインコンテンツ -->
        <div class="productDatail-main-content border">
            <!-- 商品タイトル -->
            <div class="productTitle titleMojiFont mozifont">${product.product_name}</div>
            <div class="producthard font-size15px mozifont">
                <p>${product.hard_name}</p>
            </div>
            <!-- 評価 -->
            <div class="ave_eval float">
                <c:forEach begin="1" end="${product.ave_eval}">
                    <img src="img\Hosi.png" width="50px">
                </c:forEach>
            </div>

            <!-- レビュー画面リンク -->
            <div class="review clearfix">
                <a href="ReviewSelect.Control?product_id=${product.product_id}">${product.review_count}件のカスタマーレビュー</a>
            </div>
            <!-- 金額表示 -->
            <div class="productPrice">
                \
                <fmt:formatNumber value="${product.price}" pattern="###,###" />
            </div>

            <div class="zaiko float">在庫あり</div>

            <form action="CartAdd.Control" method="get">
                <!-- 商品ID（隠し項目） -->
                <input type="hidden" name="product_id" value="${product.product_id}">

                <!-- 購入数選択 -->
                <select name="buy_count" class="float buy_count">

                    <c:forEach begin="1" end="${BUY_COUNT_MAX}" varStatus="status">
                        <option value="${status.index}">${status.index}</option>
                    </c:forEach>
                </select>
                <div class="cratkey clearfix">
                    <input class="orange-button mozifont" type="submit" value="カートに入れる">
                </div>
            </form>

            <!-- 商品説明 -->
            <div class="productDatail">${product.info}</div>

            <!-- 店長コメント -->
            <div class="pReview border">
                店長コメント:<br> ${product.comment}
                <p>${message}</p>
            </div>
        </div>
    </div>
</body>
</html>


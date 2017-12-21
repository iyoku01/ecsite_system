<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<link rel="stylesheet" type="text/css" href="css/style3.css">

<!-- スライドショー Start -->
<!-- jQuery library (served from Google) -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script src="js/jquery.bxslider.min.js"></script>
<link href="css/jquery.bxslider.css" rel="stylesheet" />
<script type="text/javascript">
    //スライドショー
    $(document).ready(function() {
        $('.bxslider').bxSlider({
            auto : true,
            randomStart : true,
        });
    });
</script>
<script type="text/javascript">
    //アコーディオン
    $(function() {
        $(".accordion").click(function() {
            $(this).toggleClass("bg02").next().slideToggle();
        });
    });
</script>
<!-- スライドショー End -->


<title>TOPページ</title>
</head>


<body>

    <!-- 共通ヘッダー -->
    <jsp:include page="header.jsp" flush="true" />


    <!-- おすすめ商品 -->
    <ul class="bxslider">
        <c:forEach var="i" items="${recommendList}" varStatus="st">
            <li><a href=ProductDetail.Control?product_id=${i.product_id}><img
                    title="product_id = ${i.product_id}" alt=""
                    src="${i.recommend_pic}" width="590" height="300" /></a></li>
        </c:forEach>
    </ul>
    <!-- サイドバー -->
    <div class="side-content-simple border">
        <a href="Top.Control">全てのゲーム</a>
        <c:forEach var="i" items="${hardList}" varStatus="st">

            <h3 class="accordion cursorPointer">
                <span> +${i.hard_name}</span> <a
                    href=Top.Control?hard_id=${i.hard_id}>→</a>
            </h3>
            <div>
                <c:forEach var="j" items="${categoryList}" varStatus="st">
                    <p>
                        <a
                            href=Top.Control?hard_id=${i.hard_id}&category_id=${j.category_id} class=kasen-sakuzixyo>${j.category_name} </a>
                    </p>
                </c:forEach>
            </div>
        </c:forEach>
    </div>
    <!-- メイン（商品リスト）  -->
    <div class="main-content-simple border">
        <c:forEach var="j" items="${productList}">
            <div class="obi${ fn:substring( j.hard_name , 0 , 3 ) } mozifont">${j.hard_name}</div>

            <c:forEach var="i" items="${j.tpd}">
                <div class="gameLogo border">
                    <a href=ProductDetail.Control?product_id=${i.product_id}><img
                        src="${i.pic_file}"></a>
                </div>

            </c:forEach>
            <div class="clearfix"></div>
        </c:forEach>

        <p>${message}</p>

    </div>
    <div class="clearfix"></div>
    <p class="pegemodori">
        <a href=# class=kasen-sakuzixyo>ページ上部に戻る</a>
    </p>
</body>
</html>

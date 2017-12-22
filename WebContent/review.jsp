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

<link rel="stylesheet"
    href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<link href="css/jquery.bxslider.css" rel="stylesheet" />

<script type="text/javascript">
    $(function() {
        $('.star').each(function() {
            for (var i = 0; i < 5; i++) {
                $(this).append('<a>');
            }
            if ('${param.evaluation}' != null) {
                var index = '${param.evaluation}';
                $(this).siblings().removeClass('on');
                for (var i = 0; i < index; i++) {
                    $(this).parent().find('a').eq(i).addClass('on');
                }
                $(this).parent().find('.index-star').attr('value', index);
            }
        });
    });
</script>
<title>レビュー</title>
</head>
<body>

    <!-- 共通ヘッダー -->
    <jsp:include page="header.jsp" flush="true" />

    <!-- 商品情報 -->
    <div class="revProduct clearfix">
        <h3>${product.product_name}</h3>
        <!-- 商品の平均評価の値を切り捨てて表示 -->
        <span><c:forEach begin="1" end="5"  step="1" varStatus="status"><c:choose><c:when test="${status.index <= product.ave_eval}"><yellowStar>&#xf2fc;</yellowStar></c:when><c:otherwise><grayStar>&#xf2fc;</grayStar> </c:otherwise></c:choose></c:forEach></span>
        <p>${product.hard_name}</p>
        <div class="innerElement clearfix">
        <img class=float src="${product.mainPic_file}" width="80"> <p
            class=productPrice>\ ${product.price}</p> <p class=zaiko>在庫あり</p>
    </div>
    <p class="info float">${product.info}</p>
    <!-- フォーム情報 -->
    <c:if test="${writeReview}">
    <form action="reviewWrite.jsp" method="post">
        <input type=hidden name=product_id value="${product.product_id}">
        <c:choose>
        <c:when test="${!empty review}">
          <input type=hidden name=nickname value="${review.nickname}">
         </c:when>
         <c:otherwise>
         <input type=hidden name=nickname value="${nickname}">
         </c:otherwise>
         </c:choose><input
            type=hidden name=evaluation value="${review.evaluation}"> <input
            type=hidden name=review value="${review.review}"> <input
            type=hidden name=product_name value="${product.product_name}">
        <input type=hidden name=price value="${product.price}"> <input
            type=hidden name=info value="${product.info}"> <input
            type=hidden name=hard_name value="${product.hard_name}"> <input
            type=hidden name=ave_eval value="${product.ave_eval}"> <input
            type=hidden name=mainPic_file value="${product.mainPic_file}">
        <input type=hidden name=review_count value="${product.review_count}">
        <c:choose>
            <c:when test="${!empty review}">
                <input type=hidden name=update value="true">
                <input type=submit class=orange-button value=レビューの編集>
            </c:when>
            <c:otherwise>
                <input type=submit class=orange-button value=レビューを書く>
            </c:otherwise>
        </c:choose>
    </form>
    </c:if>
    </div>



    <div class=reviewList>
    <!-- レビューがまだ無ければメッセージ -->
    <p>${message}</p>
        <!-- 送信パラメータ -->
        <c:if test="${!empty writeReview}">
            <c:choose>
                <c:when test="${!empty review}">
                    <!-- あれば自分のレビュー -->
                    <p>このゲームに対するあなたのレビュー</p>
                    <div class="ownReview">
                        <span>投稿者</span> <span>${review.nickname}</span> <span>${review.date}</span>
                        <c:forEach begin="1" end="5"  step="1" varStatus="status"><c:choose><c:when test="${status.index <= review.evaluation}"><yellowStar>&#xf2fc;</yellowStar></c:when><c:otherwise><grayStar>&#xf2fc;</grayStar> </c:otherwise></c:choose></c:forEach></span>
                        <p>${review.review}</p>
                    </div>
                </c:when>
            </c:choose>
        </c:if>




        <p>${product.review_count}件のカスタマーレビュー</p>
        <!-- レビューのリスト -->
        <c:forEach var="i" items="${reviewList}">
            <div class="oneReview">
                <span>投稿者</span>
                <span>${i.nickname}</span>
                <span>${i.date}</span>
                <c:forEach begin="1" end="5"  step="1" varStatus="status"><c:choose><c:when test="${status.index <= i.evaluation}"><yellowStar>&#xf2fc;</yellowStar></c:when><c:otherwise><grayStar>&#xf2fc;</grayStar> </c:otherwise></c:choose></c:forEach></span>
                <p>${i.review}</p>
            </div>
        </c:forEach>

    </div>


</body>
</html>

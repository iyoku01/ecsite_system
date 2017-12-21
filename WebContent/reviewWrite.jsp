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
<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<link rel="stylesheet" type="text/css" href="css/style3.css">

<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/1.4.1/css/ionicons.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<link href="css/jquery.bxslider.css" rel="stylesheet" />
    <%
        request.setCharacterEncoding("Windows-31J");
    %>
<script type="text/javascript">
    $(function() {
        $('.star').each(function() {
            for (var i = 0; i < 5; i++) {
                $(this).append('<a>');
            }
            if('${param.evaluation}'!=null){
                var index = '${param.evaluation}';
                $(this).siblings().removeClass('on');
                for (var i = 0; i < index; i++) {
                    $(this).parent().find('a').eq(i).addClass('on');
                }
                $(this).parent().find('.index-star').attr('value', index);
            }
        });

        $('.star>a').on('click', function() {
            var index = $(this).index();
            $(this).siblings().removeClass('on');
            for (var i = 0; i < index; i++) {
                $(this).parent().find('a').eq(i).addClass('on');
            }
            $(this).parent().find('.index-star').attr('value', index);
        });
    });
</script>
<title>レビュー記入</title>
</head>
<body>

    <!-- 共通ヘッダー -->
    <jsp:include page="header.jsp" flush="true" />


    <%
        request.setCharacterEncoding("Windows-31J");
    %>
    <!-- 商品情報 -->
    <div class="revProduct clearfix">
    <h3>${param.product_name}</h3>
    <!-- 平均評価を星で出す(getaParameterした値はキャストが必要) -->
    <fmt:parseNumber var="ave_eval" value="${param.ave_eval}" />
    <span><c:forEach begin="1" end="5"  step="1" varStatus="status"><c:choose><c:when test="${status.index <= ave_eval}"><yellowStar>&#xf2fc;</yellowStar></c:when><c:otherwise><grayStar>&#xf2fc;</grayStar></c:otherwise></c:choose></c:forEach></span>
         <p>${param.hard_name}</p>
    <div class=innerElement>
    <img src="${param.mainPic_file}" width="80">
    <span class=productPrice>\ ${param.price}</span> <span class=zaiko>在庫あり</span>
    </div>
    <p class=info>${param.info}</p>
</div>



<div class=inputContent>
    <form action=ReviewWrite.Control method=post>


        <span> 投稿者名：<input type=text class=inline name=nickname
            value="${param.nickname}">
        </span>
         <div class="star inline">
            <input type="range" min="1" max="5" name=evaluation value="${param.evaluation}"
                class="index-star" />
        </div>
        <p class=review>
            <textarea name=review>${param.review}</textarea>
        </p>
        <input type=hidden name=product_id
            value="<%=request.getParameter("product_id")%>">
        <c:if test="${param.update}">
            <input type=hidden name=update value="true">
        </c:if>
        <input type=submit value=送信>
    </form>
</div>
</body>
</html>
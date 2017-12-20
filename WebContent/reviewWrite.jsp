<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<title>レビュー記入</title>
</head>
<body>

    <!-- 共通ヘッダー -->
    <jsp:include page="header.jsp" flush="true" />


    <%
        request.setCharacterEncoding("Windows-31J");
    %>
    <!-- 商品情報 -->
        <span>${param.product_name}</span>
        <span>${param.ave_eval}</span>
        <p>${param.hard_name}</p>
        <img src="${param.mainPic_file}" width="100" >
        <span>${param.price}</span>
        <p class=info>${param.info}</p>




        <form action=ReviewWrite.Control method=post>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="js/jquery.bxslider.min.js"></script>
        <link href="css/jquery.bxslider.css" rel="stylesheet" />
        <script type="text/javascript">
        $(function() {
              $('.star').each(function() {
                for (var i = 0; i < 5; i ++) {
                  $(this).append('<a>');
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
        <div class="star">
        <input type="range" min="1" max="5" name=evaluation value="" class="index-star" />
        </div>

        <span>
            投稿者名：<input type=text name=nickname value="${param.nickname}">
        </span>
        <p>
            <textarea name=review>${param.review}</textarea>
        </p>
        <input type=hidden name=product_id
            value="<%=request.getParameter("product_id")%>">
        <c:if test="${param.update}">
            <input type=hidden name=update value="true">
        </c:if>
        <input type=submit value=送信>
    </form>

</body>
</html>
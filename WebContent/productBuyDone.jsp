<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<title>購入完了</title>
</head>
<body>


    <!-- 共通ヘッダー -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />

    <!-- pageー -->


    <h2>
        お買い上げいただき誠にありがとうございました。<br> 購入番号：${order_id}
    </h2>

    <p class="text-danger">※購入番号はお問い合わせ時に必要になりますので大切に保管ください</p>

    <a href=Top.Control> トップページに戻る </a>




    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />
</body>
</html>
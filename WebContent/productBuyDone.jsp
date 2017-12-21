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

<title>購入完了</title>
</head>
<body class="bodygray">
    <div class="productBuyDone">

        <!-- 共通ヘッダー -->
        <jsp:include page="header_logoOnly.jsp" flush="true" />

        <!-- pageー -->
        <h2>
            お買い上げいただき誠にありがとうございました。<br> 購入番号：${order_Id}
        </h2>

        <p class="text-danger">※購入番号はお問い合わせ時に必要になりますので大切に保管ください</p>

        <input type="button" value="トップページに戻る" onClick="location.href='Top.Control'" class="orange-button mozifont">

    </div>
</body>
</html>

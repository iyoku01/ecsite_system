<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="database.*"%>
<%@ page import="java.util.*"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<!-- Bootstrap Start -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
    rel="stylesheet">
<!--[if lt IE 9]>
    <script src="html5shiv.js"></script>
    <script src="respond.min.js"></script>
<![endif]-->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- Bootstrap End -->

<title>購入完了</title>
</head>
<body>



    <!-- 共通ヘッダー -->


    <div class="col-xs-12">
        <jsp:include page="header_logoOnly.jsp" flush="true" />
    </div>


     <!-- pageー -->

    <div class="white">

            <h3>お買い上げいただき誠にありがとうございました。</h3>
            <h3>購入番号：（番号持ってくる）</h3>

    </div>


    <p class="text-danger">※購入番号はお問い合わせ時に必要になりますので大切に保管ください</p>



<INPUT TYPE="submit" VALUE="トップページに戻る">




    <!-- 共通フッター -->
    <div class="col-xs-12">
        <jsp:include page="footer.jsp" flush="true" />
    </div>
    </div>

</body>
</html>
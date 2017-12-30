<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META charset="Windows-31J">
<link rel="stylesheet" type="text/css" href="css/style.css">

<title>マイページ</title>
</head>
<body class="body_mypage">
<!-- ヘッダー(ロゴ無し) -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />

    <p class="border_mypage local-section-mypage">マイページ</p>
    <!-- リンク 会員情報変更 -->
    <div class="local-section-henkou">
        <a href=memberUpdate.jsp>会員情報を変更する</a>
    </div>
    <!-- 変更完了メッセージ -->
    <div class="local-message titleMojiFont">${message}</div>


    <div class="detail">
    <!-- 会員情報の表示 -->
        <table cellspacing="30px">
            <tr>
                <th>ID</th>
                <td>${personalData.user_id}</td>
            </tr>
            <tr>
                <th>お名前</th>
                <td>${personalData.name}</td>
            </tr>
            <tr>
                <th>ニックネーム</th>
                <td>${personalData.nickname}</td>
            </tr>
            <tr>
                <th>郵便番号</th>
                <td>〒${personalData.postal_code}</td>
            </tr>
            <tr>
                <th>住所</th>
                <td>${personalData.address}</td>
            </tr>
            <tr>
                <th>電話番号</th>
                <td>${personalData.phone}</td>
            </tr>
        </table>
    </div>


    <div class="local-section-rireki">
        <a href=OrderHistory.Control?user_id=${personalData.user_id}>購入履歴を見る</a>
    </div>
</body>
</html>
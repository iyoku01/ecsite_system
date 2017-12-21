<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="database.*"%>
<%@ page import="java.util.*"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META charset="Windows-31J">

<title>マイページ</title>
</head>
<body>
    <jsp:include page="header_logoOnly.jsp" flush="true" />

    <p>マイページ</p>

    <a href=http://localhost:8080/ecsite_system/memberUpdate.jsp>会員情報を変更する</a>${message}


    <div class="row">
        <table>
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
                <td>${personalData.postal_code}</td>
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


    <a
        href=http://localhost:8080/ecsite_system/OrderHistory.Control?user_id=${personalData.user_id}>購入履歴を見る</a>

</body>
</html>
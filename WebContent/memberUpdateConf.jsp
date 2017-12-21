<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<link rel="stylesheet" type="text/css" href="css/style3.css">
<META charset="Windows-31J">
<title>会員情報変更確認</title>
</head>
<body class="bodygray">

    <header>
        <a href=Top.Control></a>
    </header>


    <span class="screenname">登録情報確認</span>

        <%
            request.setCharacterEncoding("Windows-31J");
        %>
    <div class="memUpcon">
        <table>
            <tr>
                <th>ID：</th>
                <td>${user_id}</td>
            </tr>

            <tr>
                <th>名前：</th>
                <td>${param.name}</td>
            </tr>

            <tr>
                <th>ニックネーム：</th>
                <td>${param.nickname}</td>
            </tr>

            <tr>
                <th>郵便番号：</th>
                <td>〒${param.postal_code}</td>
            </tr>

            <tr>
                <th>住所：</th>
                <td>${param.address}</td>
            </tr>

            <tr>
                <th>電話番号：</th>
                <td>${param.phone}</td>
            </tr>

        </table>
        <p>上記の情報でお間違いはございませんか？</p>

        <div class="formcenter">

            <form action="memberUpdate.jsp" method="post">
                <input type=hidden name=password value="${param.password}">
                <input type=hidden name=name value="${param.name}"> <input
                    type=hidden name=nickname value="${param.nickname}"> <input
                    type=hidden name=phone value="${param.phone}"> <input
                    type=hidden name=postal_code value="${param.postal_code}">
                <input type=hidden name=address value="${param.address}"> <input
                    class="membotton2" type=submit value=修正>
            </form>

            <form action="Regist.Control" method="post">
                <input type=hidden name=password value="${param.password}">
                <input type=hidden name=name value="${param.name}"> <input
                    type=hidden name=nickname value="${param.nickname}"> <input
                    type=hidden name=phone value="${param.phone}"> <input
                    type=hidden name=postal_code value="${param.postal_code}">
                <input type=hidden name=address value="${param.address}"> <input
                    class="membotton" type=submit value=登録>
            </form>
        </div>
    </div>


</body>
</html>
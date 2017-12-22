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

<title>会員情報変更</title>
</head>
<body class=bodygray>

<jsp:include page="header_logoOnly.jsp" flush="true" />
<span class="screenname">会員情報変更画面</span>



    <div class=inputForm>
        <%
            request.setCharacterEncoding("Windows-31J");
        %>


        <form
            action="http://localhost:8080/ecsite_system/memberUpdateConf.jsp"
            method="post">
            <table>
                <tr>
                    <th>ID</th><td>${user_id}</td>
                </tr>
                <tr>
                    <th>名前</th>
                    <td><input type=text name=name value="${param.name}" required></td>
                    <td>30文字まで</td>
                </tr>
                <tr>
                    <th>ニックネーム</th>
                    <td><input type=text name=nickname value="${param.nickname}" required></td>
                    <td>20文字まで</td>
                </tr>
                <tr>
                    <th>郵便番号</th>
                    <td><input type=text name=postal_code
                        value="${param.postal_code}" required></td>
                    <td>ハイフン無し 7桁</td>
                </tr>
                <tr>
                    <th>住所</th>
                    <td><input type=text name=address value="${param.address}" required></td>
                    <td>50文字まで</td>
                </tr>
                <tr>
                <th></th>
                <td>※マンション名、部屋番号まで正しく記入してください。</td>
                </tr>
                <tr>
                    <th>電話番号</th>
                    <td><input type=text name=phone value="${param.phone}" required></td>
                    <td>ハイフン無し 12桁</td>
                </tr>
                <tr>
                    <th>パスワード</th>
                    <td><input type=text name=password value="${param.password }" required></td>
                    <td>半角英数8～24桁</td>
                </tr>
                <tr>
                    <th>パスワード確認</th>
                    <td><input type=text name=checkPassword value="${param.checkPassword }" required></td>
                    <td>もう一度入力して下さい</td>
            </table>
            <input type=submit class=orange-button value=確認画面に進む>
        </form>
    </div>

</body>
</html>

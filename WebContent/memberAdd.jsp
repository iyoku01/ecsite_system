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

<title>新規会員登録</title>
</head>
<body class=bodygray>
    <jsp:include page="header_logoOnly.jsp" flush="true" />
    <span class="screenname">新規会員登録画面</span>

    <div class=inputForm>
        <%
            request.setCharacterEncoding("Windows-31J");
        %>

        <p class=message>${message}</p>

        <form action="CheckId.Control" method="post">
            <table>
                <tr>
                    <th>ID</th>
                    <td><input type=text name=user_id value="${param.user_id}"></td>
                    <td>半角英数6～10文字</td>
                </tr>
                <tr>
                    <th>名前</th>
                    <td><input type=text name=name value="${param.name}"></td>
                    <td>30文字まで</td>
                </tr>
                <tr>
                    <th>ニックネーム</th>
                    <td><input type=text name=nickname value="${param.nickname}"></td>
                    <td>20文字まで</td>
                </tr>
                <tr>
                    <th>郵便番号</th>
                    <td><input type=text name=postal_code
                        value="${param.postal_code}"></td>
                    <td>ハイフン無し 7桁</td>
                </tr>
                <tr>
                    <th>住所</th>
                    <td><input type=text name=address value="${param.address}"></td>
                    <td>50文字まで</td>
                </tr>
                <tr>
                    <th></th>
                    <td>※マンション名、部屋番号まで正しく記入してください。</td>
                </tr>
                <tr>
                    <th>電話番号</th>
                    <td><input type=text name=phone value="${param.phone}"></td>
                    <td>ハイフン無し 12桁</td>
                </tr>
                <tr>
                    <th>パスワード</th>
                    <td><input type=text name=password value="${param.password }"></td>
                    <td>半角英数8～24桁</td>
                </tr>
                <tr>
                    <th>パスワード確認</th>
                    <td><input type=text name=password value="${param.password }"></td>
                    <td>もう一度入力して下さい</td>
            </table>
            <input type=submit class=orange-button value=確認画面に進む>
        </form>

    </div>

</body>
</html>

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
<script type="text/javascript">
function errorcheck(){
    if (form1.password.value !== form1.checkPassword.value) return false;
    }
</script>

</head>
<body class=bodygray>

<jsp:include page="header_logoOnly.jsp" flush="true" />
<span class="screenname">会員情報変更画面</span>



    <div class=inputForm>
        <%
            request.setCharacterEncoding("Windows-31J");
        %>
        <form id=form1
            action="http://localhost:8080/ecsite_system/memberUpdateConf.jsp"
            method="post">
            <table>
                <tr>
                    <th>ID</th><td>${user_id}</td>
                </tr>
                <tr>
                    <th>名前</th>
                    <td><input type=text name=name value="${param.name}" pattern=.{1,30} title="指定している文字数内で入力して下さい" required></td>
                    <td>30文字まで</td>
                </tr>
                <tr>
                    <th>ニックネーム</th>
                    <td><input type=text name=nickname value="${param.nickname}" pattern=.{1,20} title="指定している文字数内で入力して下さい" required required></td>
                    <td>20文字まで</td>
                </tr>
                <tr>
                    <th>郵便番号</th>
                    <td><input type=text name=postal_code
                        value="${param.postal_code}" pattern=\d{7} title="" required></td>
                    <td>ハイフン無し 7桁</td>
                </tr>
                <tr>
                    <th>住所</th>
                    <td><input type=text name=address value="${param.address}" pattern=.{1,50} title="指定している文字数内で入力して下さい" required></td>
                    <td>50文字まで</td>
                </tr>
                <tr>
                <th></th>
                <td>※マンション名、部屋番号まで正しく記入してください。</td>
                </tr>
                <tr>
                    <th>電話番号</th>
                    <td><input type=text name=phone value="${param.phone}" pattern=\d{10,12} title="" required></td>
                    <td>ハイフン無し 10〜12桁</td>
                </tr>
                <tr>
                    <th>パスワード</th>
                    <td><input type=text name=password value="${param.password }" pattern=^([a-zA-Z0-9]{8,24})$ title="" required onblur="blank_alert()"></td>
                    <td>半角英数8〜24桁</td>
                </tr>
                <tr>
                    <th>パスワード確認</th>
                    <td><input type=text name=checkPassword value="${param.checkPassword }" pattern=^([a-zA-Z0-9]{8,24})$ title="" required></td>
                    <td>もう一度入力して下さい</td>
            </table>
            <input type=submit class=orange-button value=確認画面に進む onclick="errorcheck()">
        </form>
    </div>

</body>
</html>

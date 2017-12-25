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

        <form onSubmit="return CheckPassword()" id=form
                  action="CheckId.Control" method="post">
            <table>
                <tr>
                    <th>ID</th>
                    <td><input type=text name="user_id" value="${param.user_id}" pattern=^([a-zA-Z0-9]{6,10})$ title="" required ></td>
                    <td>半角英数6～10文字</td>
                </tr>
                <tr>
                    <th>名前</th>
                    <td><input type=text name="name" value="${param.name}" pattern=.{1,30} title="指定している文字数内で入力して下さい" required></td>
                    <td>30文字まで</td>
                </tr>
                <tr>
                    <th>ニックネーム</th>
                    <td><input type=text name="nickname" value="${param.nickname}" pattern=.{1,20} title="指定している文字数内で入力して下さい" required required></td>
                    <td>20文字まで</td>
                </tr>
                <tr>
                    <th>郵便番号</th>
                    <td><input type=text name="postal_code"
                        value="${param.postal_code}" pattern=\d{7} title="半角数字7桁で入力して下さい" required></td>
                    <td>ハイフン無し 7桁</td>
                </tr>
                <tr>
                    <th>住所</th>
                    <td><input type=text name="address" value="${param.address}" pattern=.{1,50} title="指定している文字数内で入力して下さい" required></td>
                    <td>50文字まで</td>
                </tr>
                <tr>
                    <th></th>
                    <td>※マンション名、部屋番号まで正しく記入してください。</td>
                </tr>
                <tr>
                    <th>電話番号</th>
                    <td><input type=text name="phone" value="${param.phone}" pattern=\d{10,12} title="半角数字12桁で入力して下さい" required></td>
                    <td>ハイフン無し 12桁</td>
                </tr>
                <tr>
                    <th>パスワード</th>
                    <td><input type=text name="password" id="password" value="${param.password}" pattern=^([a-zA-Z0-9]{8,24})$ title="半角英数8～24桁で入力して下さい" required></td>
                    <td>半角英数8～24桁</td>
                </tr>
                <tr>
                    <th>パスワード確認</th>
                    <td><input type=text name="checkPassword" id="checkPassword" value="${param.checkPassword}" pattern=^([a-zA-Z0-9]{8,24})$ title="ﾊﾟｽﾜｰﾄﾞと同じ内容で入力して下さい" required></td>
                    <td>もう一度入力して下さい</td>
            </table>
            <input type=submit class=orange-button value=確認画面に進む>
        </form>
    </div>
<script>
function CheckPassword(input) {
    var password = document.forms.form.password.value;
    var checkPassword =document.forms.form.checkPassword.value;
    if (password != checkPassword){
      alert("パスワードと確認用パスワードが一致しません");
      return false;
    }else{
      return true;
    }
  };
</script>


</body>
</html>

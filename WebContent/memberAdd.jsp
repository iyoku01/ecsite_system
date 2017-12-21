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
<body>

<%request.setCharacterEncoding("Windows-31J"); %>
    <form action="CheckId.Control" method="post">

        <p>
            ユーザーID<input type=text name=user_id value="${param.user_id}">
        </p>
        <p>
            パスワード<input type=text name=password value="${param.password}">
        </p>
        <p>
            名前<input type=text name=name value ="${param.name}">
        </p>
        <p>
            ニックネーム<input type=text name=nickname value ="${param.nickname}">
        </p>
        <p>
            電話番号<input type=text name=phone value ="${param.phone}">
        </p>
        <p>
            郵便番号<input type=text name=postal_code value ="${param.postal_code}">
        </p>
        <p>
            住所<input type=text name=address value ="${param.address}">
        </p>
         <input type=submit value=確認画面へ>
    </form>

    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>

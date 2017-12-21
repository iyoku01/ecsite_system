<%@ page contentType="text/html; charset=Windows-31J" %>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<link rel="stylesheet" type="text/css" href="css/style3.css">
<title>会員情報変更</title>
</head>
<body>

<div class=inputForm>
<%request.setCharacterEncoding("Windows-31J"); %>
        <form action="http://localhost:8080/ecsite_system/memberUpdateConf.jsp"
        method="post">
        <p>ユーザーID：<%=session.getAttribute("user_id")%></p>
        <p>パスワード<input type=text name=password value="${param.password }"></p>
        <p>名前<input type=text name=name value="${param.name}"></p>
        <p> ニックネーム<input type=text name=nickname value="${param.nickname}"></p>
        <p>電話番号<input type=text name=phone value="${param.phone}"></p>
        <p>郵便番号<input type=text name=postal_code value="${param.postal_code}"></p>
        <p> 住所<input type=text name=address value="${param.address}"></p>
        <input type=submit value=確認画面へ>
    </form>
</div>
    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>
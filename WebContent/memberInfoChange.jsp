<%@ page contentType="text/html; charset=Windows-31J" %>

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
<title>会員情報変更</title>
</head>
<body>


    <form action="http://localhost:8080/ecsite_system/registChangeConf.jsp"
        method="post">
        <p>ユーザーID：<%=session.getAttribute("user_id")%></p>
        <p>パスワード<input type=text name=password></p>
        <p>名前<input type=text name=name></p>
        <p> ニックネーム<input type=text name=nickname></p>
        <p>電話番号<input type=text name=phone></p>
        <p>郵便番号<input type=text name=postal_code></p>
        <p> 住所<input type=text name=address></p>
        <input type=submit value=確認画面へ>
    </form>

    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>
<%@ page contentType="text/html; charset=Windows-31J"%>
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
<title>新規登録確認</title>
</head>
<body>

<header>
    <a href=Top.Control></a>
    </header>


    <%
        String user_id = request.getParameter("user_id");
    %>
    <%
        String password = request.getParameter("password");
    %>
    <%
        String name = request.getParameter("name");
    %>
    <%
        String nickname = request.getParameter("nickname");
    %>
    <%
        String phone = request.getParameter("phone");
    %>
    <%
        String postal_code = request.getParameter("postal_code");
    %>
    <%
        String address = request.getParameter("address");
    %>

    <p>
        ユーザーID：<%=user_id%></p>
    <p>
        パスワード：<%=password%></p>
    <p>
        名前：<%=name%></p>
    <p>
        ニックネーム：<%=nickname%></p>
    <p>
        電話番号：<%=phone%></p>
    <p>
        郵便番号：<%=postal_code%></p>
    <p>
        住所：<%=address%></p>

    <form action="Regist.Control" method="post">
        <input type=hidden name=user_id value=<%=user_id%>>
        <input type=hidden name=password value=<%=password%>>
        <input type=hidden name=name value=<%=name%>>
        <input type=hidden name=nickname value=<%=nickname%>>
        <input type=hidden name=phone value=<%=phone%>>
        <input type=hidden name=postal_code value=<%=postal_code%>>
        <input type=hidden name=address value=<%=address%>>
        <input type=submit
            value=登録>
    </form>

    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>
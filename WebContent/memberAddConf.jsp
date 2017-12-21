<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">

<META charset="Windows-31J">
<title>新規登録確認</title>
</head>
<body>

<header>
    <a href=Top.Control></a>
    </header>
<div class="bodygray">

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

    <span class="screenname">登録情報確認</span>

<div class="memUpcon">
<table>
   <tr><td>ID：</td><td><%=user_id%></td></tr>

    <tr><td>名前：</td><td><%=name%></td></tr>

    <tr><td>ニックネーム：</td><td><%=nickname%></td></tr>

    <tr><td>郵便番号：</td><td><%=postal_code%></td></tr>

       <tr><td>住所：</td><td><%=address%></td></tr>

    <tr><td>電話番号：</td><td><%=phone%></td></tr>

</table>



        <p>上記の情報でお間違いはございませんでしょうか</p>

<div class="formcenter">

     <form action="memberAdd.jsp" method="post">
            <input type=hidden name=user_id value=<%=user_id%>>
            <input type=hidden name=password value=<%=password%>>
            <input type=hidden name=name value=<%=name%>>
            <input type=hidden name=nickname value=<%=nickname%>>
            <input type=hidden name=phone value=<%=phone%>>
            <input type=hidden name=postal_code value=<%=postal_code%>>
            <input type=hidden name=address value=<%=address%>>

            <input class="membotton2"type=submit value=修正>

</form>



    <form action="Regist.Control" method="post">
        <input type=hidden name=user_id value=<%=user_id%>>
        <input type=hidden name=password value=<%=password%>>
        <input type=hidden name=name value=<%=name%>>
        <input type=hidden name=nickname value=<%=nickname%>>
        <input type=hidden name=phone value=<%=phone%>>
        <input type=hidden name=postal_code value=<%=postal_code%>>
        <input type=hidden name=address value=<%=address%>>
        <input class="membotton" type=submit value=登録>






    </form>
</div>
</div>
<div class="memborder">
    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>

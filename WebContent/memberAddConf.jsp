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
<title>�V�K�o�^�m�F</title>
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

    <span class="screenname">�o�^���m�F</span>

<div class="memUpcon">
<table>
   <tr><td>ID�F</td><td><%=user_id%></td></tr>

    <tr><td>���O�F</td><td><%=name%></td></tr>

    <tr><td>�j�b�N�l�[���F</td><td><%=nickname%></td></tr>

    <tr><td>�X�֔ԍ��F</td><td><%=postal_code%></td></tr>

       <tr><td>�Z���F</td><td><%=address%></td></tr>

    <tr><td>�d�b�ԍ��F</td><td><%=phone%></td></tr>

</table>



        <p>��L�̏��ł��ԈႢ�͂������܂���ł��傤��</p>

<div class="formcenter">

     <form action="memberAdd.jsp" method="post">
            <input type=hidden name=user_id value=<%=user_id%>>
            <input type=hidden name=password value=<%=password%>>
            <input type=hidden name=name value=<%=name%>>
            <input type=hidden name=nickname value=<%=nickname%>>
            <input type=hidden name=phone value=<%=phone%>>
            <input type=hidden name=postal_code value=<%=postal_code%>>
            <input type=hidden name=address value=<%=address%>>

            <input class="membotton2"type=submit value=�C��>

</form>



    <form action="Regist.Control" method="post">
        <input type=hidden name=user_id value=<%=user_id%>>
        <input type=hidden name=password value=<%=password%>>
        <input type=hidden name=name value=<%=name%>>
        <input type=hidden name=nickname value=<%=nickname%>>
        <input type=hidden name=phone value=<%=phone%>>
        <input type=hidden name=postal_code value=<%=postal_code%>>
        <input type=hidden name=address value=<%=address%>>
        <input class="membotton" type=submit value=�o�^>






    </form>
</div>
</div>
<div class="memborder">
    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>

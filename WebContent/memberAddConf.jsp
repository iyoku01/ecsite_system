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
<title>�V�K�o�^�m�F</title>
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
        ���[�U�[ID�F<%=user_id%></p>
    <p>
        �p�X���[�h�F<%=password%></p>
    <p>
        ���O�F<%=name%></p>
    <p>
        �j�b�N�l�[���F<%=nickname%></p>
    <p>
        �d�b�ԍ��F<%=phone%></p>
    <p>
        �X�֔ԍ��F<%=postal_code%></p>
    <p>
        �Z���F<%=address%></p>

    <form action="Regist.Control" method="post">
        <input type=hidden name=user_id value=<%=user_id%>>
        <input type=hidden name=password value=<%=password%>>
        <input type=hidden name=name value=<%=name%>>
        <input type=hidden name=nickname value=<%=nickname%>>
        <input type=hidden name=phone value=<%=phone%>>
        <input type=hidden name=postal_code value=<%=postal_code%>>
        <input type=hidden name=address value=<%=address%>>
        <input type=submit
            value=�o�^>
    </form>

    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>
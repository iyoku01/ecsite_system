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
<link rel="stylesheet" type="text/css" href="css/style.css">
<META charset="Windows-31J">
<title>������ύX�m�F</title>
</head>
<body>

 <header>
 </header>
<div class="bodygray">


<%
        request.setCharacterEncoding("Windows-31J");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String nickname = request.getParameter("nickname");
        String phone = request.getParameter("phone");
        String postal_code = request.getParameter("postal_code");
        String address = request.getParameter("address");
        %>


  <%--<p>���[�U�[ID�F<%=session.getAttribute("user_id")%></p>
    <p>���O�F${name}</p>
    <p>�j�b�N�l�[���F${nickname}</p>
    <p>�d�b�ԍ��F${phone}</p>
    <p>�X�֔ԍ��F${postal_code}</p>
    <p> �Z���F${address}</p>
 --%>


<div class="memUpcon">

    <p>���[�U�[ID�F<%=session.getAttribute("user_id")%></p>

    <p>���O�F<%=name%></p>

    <p>�j�b�N�l�[���F<%=nickname%></p>

    <p>�d�b�ԍ��F<%=phone%></p>

    <p>�X�֔ԍ��F<%=postal_code%></p>

    <p> �Z���F<%=address%></p>

     <p>��L�̏��ł��ԈႢ�͂������܂���ł��傤��</p>

   <div class="formcenter">
    <form action="memberUpdate.jsp" method="post">
            <input type=hidden name=password value=<%=password%>>
            <input type=hidden name=name value=<%=name%>>
            <input type=hidden name=nickname value=<%=nickname%>>
            <input type=hidden name=phone value=<%=phone%>>
            <input type=hidden name=postal_code value=<%=postal_code%>>
            <input type=hidden name=address value=<%=address%>>

            <input class="membotton2"type=submit value=�C��>

</form>

             <form action="Regist.Control" method="post">
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
<div>
</div>
</body>
</html>
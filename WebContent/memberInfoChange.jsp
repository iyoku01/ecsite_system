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
<title>������ύX</title>
</head>
<body>


    <form action="http://localhost:8080/ecsite_system/registChangeConf.jsp"
        method="post">
        <p>���[�U�[ID�F<%=session.getAttribute("user_id")%></p>
        <p>�p�X���[�h<input type=text name=password></p>
        <p>���O<input type=text name=name></p>
        <p> �j�b�N�l�[��<input type=text name=nickname></p>
        <p>�d�b�ԍ�<input type=text name=phone></p>
        <p>�X�֔ԍ�<input type=text name=postal_code></p>
        <p> �Z��<input type=text name=address></p>
        <input type=submit value=�m�F��ʂ�>
    </form>

    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>
<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<link rel="stylesheet" type="text/css" href="css/style3.css">
<META charset="Windows-31J">
<title>������ύX�m�F</title>
</head>
<body class="bodygray">

    <header>
        <a href=Top.Control></a>
    </header>


    <span class="screenname">�o�^���m�F</span>

        <%
            request.setCharacterEncoding("Windows-31J");
        %>
    <div class="memUpcon">
        <table>
            <tr>
                <th>ID�F</th>
                <td>${user_id}</td>
            </tr>

            <tr>
                <th>���O�F</th>
                <td>${param.name}</td>
            </tr>

            <tr>
                <th>�j�b�N�l�[���F</th>
                <td>${param.nickname}</td>
            </tr>

            <tr>
                <th>�X�֔ԍ��F</th>
                <td>��${param.postal_code}</td>
            </tr>

            <tr>
                <th>�Z���F</th>
                <td>${param.address}</td>
            </tr>

            <tr>
                <th>�d�b�ԍ��F</th>
                <td>${param.phone}</td>
            </tr>

        </table>
        <p>��L�̏��ł��ԈႢ�͂������܂��񂩁H</p>

        <div class="formcenter">

            <form action="memberUpdate.jsp" method="post">
                <input type=hidden name=password value="${param.password}">
                <input type=hidden name=name value="${param.name}"> <input
                    type=hidden name=nickname value="${param.nickname}"> <input
                    type=hidden name=phone value="${param.phone}"> <input
                    type=hidden name=postal_code value="${param.postal_code}">
                <input type=hidden name=address value="${param.address}"> <input
                    class="membotton2" type=submit value=�C��>
            </form>

            <form action="Regist.Control" method="post">
                <input type=hidden name=password value="${param.password}">
                <input type=hidden name=name value="${param.name}"> <input
                    type=hidden name=nickname value="${param.nickname}"> <input
                    type=hidden name=phone value="${param.phone}"> <input
                    type=hidden name=postal_code value="${param.postal_code}">
                <input type=hidden name=address value="${param.address}"> <input
                    class="membotton" type=submit value=�o�^>
            </form>
        </div>
    </div>


</body>
</html>
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
<body class="bodygray">

    <header>
        <a href=Top.Control></a>
    </header>


    <span class="screenname">�o�^���m�F</span>

    <!--  -->
    <div class="memUpcon">
        <table>
            <tr>
                <th>ID�F</th>
                <td>${param.user_id}</td>
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



        <p>��L�̏��ł��ԈႢ�͂������܂���ł��傤��</p>

        <!-- ���͉�ʂ֒l�̑��M -->
        <div class="formcenter">
            <form action="memberAdd.jsp" method="post">
                <input type=hidden name=user_id value="${param.user_id}"> <input
                    type=hidden name=password value="${param.password}"> <input
                    type=hidden name=checkPassword value="${param.checkPassword}">
                <input type=hidden name=name value="${param.name}"> <input
                    type=hidden name=nickname value="${param.nickname}"> <input
                    type=hidden name=phone value="${param.phone}"> <input
                    type=hidden name=postal_code value="${param.postal_code}">
                <input type=hidden name=address value="${param.address}"> <input
                    class="membotton2" type=submit value=�C��>
            </form>

            <!-- �R���g���[���֒l�̑��M -->
            <form action="Regist.Control" method="post">
                <input type=hidden name=user_id value="${param.user_id}"> <input
                    type=hidden name=password value="${param.password}"> <input
                    type=hidden name=name value="${param.name}"> <input
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

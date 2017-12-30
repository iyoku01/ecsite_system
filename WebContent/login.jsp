<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<link rel="stylesheet" type="text/css" href="css/style.css">

<title>���O�C��</title>
</head>
<body class="bodywhite">

    <!-- �w�b�_�[ -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />

<!-- ���͂���ID�E�p�X���[�h�ƈ�v���郌�R�[�h��DB�Ƀ��O�C�� -->
    <div class="login bodywhite mozifont">
        <form action="Login.Control">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type=text name=user_id value="${user_id}" required pattern="^[0-9A-Za-z]+$"  title="���p�p���œ��͂��Ă�������"></td>
                </tr>
                <tr>
                    <td>PASS</td>
                    <td><input type=password name=password required pattern="^[0-9A-Za-z]+$" title="���p�p���œ��͂��Ă�������"></td>
                </tr>
            </table>
            <p>${message}</p>
            <input type="button" value="�V�K�o�^" onClick="location.href='memberAdd.jsp'" class="gray-button mozifont"> <input type="submit" value="���O�C��" class="orange-button mozifont">
        </form>
    </div>

</body>
</html>
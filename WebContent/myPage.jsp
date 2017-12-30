<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META charset="Windows-31J">
<link rel="stylesheet" type="text/css" href="css/style.css">

<title>�}�C�y�[�W</title>
</head>
<body class="body_mypage">
<!-- �w�b�_�[(���S����) -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />

    <p class="border_mypage local-section-mypage">�}�C�y�[�W</p>
    <!-- �����N ������ύX -->
    <div class="local-section-henkou">
        <a href=memberUpdate.jsp>�������ύX����</a>
    </div>
    <!-- �ύX�������b�Z�[�W -->
    <div class="local-message titleMojiFont">${message}</div>


    <div class="detail">
    <!-- ������̕\�� -->
        <table cellspacing="30px">
            <tr>
                <th>ID</th>
                <td>${personalData.user_id}</td>
            </tr>
            <tr>
                <th>�����O</th>
                <td>${personalData.name}</td>
            </tr>
            <tr>
                <th>�j�b�N�l�[��</th>
                <td>${personalData.nickname}</td>
            </tr>
            <tr>
                <th>�X�֔ԍ�</th>
                <td>��${personalData.postal_code}</td>
            </tr>
            <tr>
                <th>�Z��</th>
                <td>${personalData.address}</td>
            </tr>
            <tr>
                <th>�d�b�ԍ�</th>
                <td>${personalData.phone}</td>
            </tr>
        </table>
    </div>


    <div class="local-section-rireki">
        <a href=OrderHistory.Control?user_id=${personalData.user_id}>�w������������</a>
    </div>
</body>
</html>
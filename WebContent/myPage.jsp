<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META charset="Windows-31J">
<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<link rel="stylesheet" type="text/css" href="css/style3.css">

<title>�}�C�y�[�W</title>
</head>
<body>
    <jsp:include page="header_logoOnly.jsp" flush="true" />

    <p>�}�C�y�[�W</p>

    <a href=http://localhost:8080/ecsite_system/memberUpdate.jsp>�������ύX����</a>${message}


    <div class="row">
        <table>
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
                <td>${personalData.postal_code}</td>
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


    <a
        href=http://localhost:8080/ecsite_system/OrderHistory.Control?user_id=${personalData.user_id}>�w������������</a>

</body>
</html>
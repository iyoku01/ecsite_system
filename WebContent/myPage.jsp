<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="database.*"%>
<%@ page import="java.util.*"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META charset="Windows-31J">

<title>�}�C�y�[�W</title>
</head>
<body>
<jsp:include page="header_logoOnly.jsp" flush="true" />

<a href=http://localhost:8080/ecsite_system/memberUpdate.jsp>�������ύX����</a>
${message}

�l���̎擾
<div class="row">
     <p>${personalData.user_id}</p>
    <p>${personalData.password}</p>
    <p>${personalData.name}</p>
    <p>${personalData.nickname}</p>
    <p>${personalData.phone}</p>
    <p>${personalData.postal_code}</p>
    <p>${personalData.address}</p>

</div>


<a href=http://localhost:8080/ecsite_system/OrderHistory.Control?user_id=${personalData.user_id}>�w������������</a>

</body>
</html>
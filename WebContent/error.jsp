<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" type="text/css" href="css/style2.css">
<link rel="stylesheet" type="text/css" href="css/style3.css">

<title>Error</title>
</head>
<body>
    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header.jsp" flush="true" />

    <h1>�G���[�y�[�W</h1>

    <p>${message}</p>

    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>
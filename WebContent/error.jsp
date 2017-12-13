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

<title>Error</title>
</head>
<body>
    <h1>エラーページ</h1>

    <p>${message}</p>

    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>
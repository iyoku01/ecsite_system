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

<title>マイページ</title>
</head>
<body>


<a href=http://localhost:8080/ecsite_system/memberInfoChange.jsp>会員情報を変更する</a>


個人情報の取得
<div class="row">
     <p>${personalData.user_id}</p>
    <p>${personalData.password}</p>
    <p>${personalData.name}</p>
    <p>${personalData.nickname}</p>
    <p>${personalData.phone}</p>
    <p>${personalData.postal_code}</p>
    <p>${personalData.address}</p>

</div>




</body>
</html>
<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<title>レビュー記入</title>
</head>
<body>

<form action=ReviewWrite.Control method=post>

<select name="evaluation">
    <option value="1">1
    <option value="2">2
    <option value="3">3
    <option value="4">4
    <option value="5">5
</select>
<p>ニックネーム：<input type=text name=nickname></p>
<p>コメントを書く：<input type=textarea name=review></p>
<input type=hidden name=product_id value="<%=request.getParameter("product_id")%>">
<input type=submit value=送信>
</form>

</body>
</html>
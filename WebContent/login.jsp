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

<title>ログイン</title>
</head>
<body class="bodywhite">

    <!-- ヘッダー -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />

    <div class="login bodywhite mozifont">
        <form action="Login.Control">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type=text name=user_id value="${user_id}" required pattern="^[0-9A-Za-z]+$"  title="半角英数で入力してください"></td>
                </tr>
                <tr>
                    <td>PASS</td>
                    <td><input type=password name=password required pattern="^[0-9A-Za-z]+$" title="半角英数で入力してください"></td>
                </tr>
            </table>
            <p>${message}</p>
            <input type="button" value="新規登録" onClick="location.href='memberAdd.jsp'" class="gray-button mozifont"> <input type="submit" value="ログイン" class="orange-button mozifont">
        </form>
    </div>

</body>
</html>
<%@ page contentType="text/html; charset=Windows-31J" %>

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
<title>会員情報変更</title>
</head>
<body>
<%
String strPassword="";
String strname="";
String strnickname="";
String strphone="";
String strpostal_code="";
String straddress="";


request.setCharacterEncoding("Windows-31J");
    String password = request.getParameter("password");
String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
String phone = request.getParameter("phone");
String postal_code = request.getParameter("postal_code");
String address = request.getParameter("address");

if(password!=null){
strPassword=password;
strname=name;
strnickname=nickname;
strphone=phone;
strpostal_code=postal_code;
straddress=address;
}

%>



        <form action="http://localhost:8080/ecsite_system/memberUpdateConf.jsp"
        method="post">
        <p>ユーザーID：<%=session.getAttribute("user_id")%></p>
        <p>パスワード<input type=text name=password value=<%=strPassword %>></p>
        <p>名前<input type=text name=name value=<%=strname%>></p>
        <p> ニックネーム<input type=text name=nickname value=<%=strnickname%>></p>
        <p>電話番号<input type=text name=phone value=<%=strphone%>></p>
        <p>郵便番号<input type=text name=postal_code value=<%=strpostal_code%>></p>
        <p> 住所<input type=text name=address value=<%=straddress%>></p>
        <input type=submit value=確認画面へ>
    </form>

    <!-- 共通フッター -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>
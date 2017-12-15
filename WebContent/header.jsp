<%@ page contentType="text/html; charset=Windows-31J"%>
<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<title>�w�b�_�[</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <header>
        <a href="Top.Control"> <img src="img\CompanyLogo\watazon_logo.png"
            alt="��ƃ��S" height=70px>
        </a>
        <div class="kensaku">
        <p>����</p>
        </div>
        <form action="Top.Control" method="post" id="form1">
            <input type="text" id="search" name="search" placeholder="���i�������"
                required> <input type="image" src="img\Header\search.png"
                id="searchAction" value="">
        </form>
        <div id="menu">
            <img src="img\Header\cart.png"> <a
                href=Cart.Control id="cartSuu">${cartMap.size()}</a>/
            <c:if test="${empty user_id }">
                <a href=login.jsp>�V�K�o�^/���O�C��</a>
            </c:if>
            <c:if test="${!empty user_id }">
                <a href=Logout.Control>���O�A�E�g</a>
            </c:if>
            / <a href=MyPage.Control>�}�C�y�[�W</a>
        </div>
</header>
</body>
</html>

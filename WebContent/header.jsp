<%@ page contentType="text/html; charset=Windows-31J"%>
<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<head>

<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<div class="row">
    <header>
  <h3>
  <form action="Top.Control" method="post" class="form-group">
      <a href="Top.Control">
      <img src="img\CompanyLogo\watazon_logo.png" alt="��ƃ��S"  height=70px >
      </a>
      <div class="kensaku">
          <input type="text" id="search" name="search" placeholder="���i�������" required>
      </div>
          <div class="kensakugazou">
            <input type="image" src="img\Header\search.png" id="searchAction">
          </div>
      <div id="menu">
         <img src="img\Header\cart.png">
         <a href=http://localhost:8080/ecsite_system/login.jsp id="cartSuu">${cartMap.size()}</a>/
        <c:if test="${empty user_id }" >
            <a href=http://localhost:8080/ecsite_system/login.jsp>�V�K�o�^/���O�C��</a>
        </c:if>
        <c:if test="${!empty user_id }" >
            <a href=Logout.Control>���O�A�E�g</a>
        </c:if>
        /
        <a href=MyPage.Control>�}�C�y�[�W</a>
        </div>
    </form>
</h3>
</header>
</div>


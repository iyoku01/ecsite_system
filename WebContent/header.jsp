<%@ page contentType="text/html; charset=Windows-31J"%>
<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<title>ヘッダー</title>
</head>

<body>
    <header>
        <div class="CompanyLogo float">
            <a href="Top.Control"> <img
                src="img\CompanyLogo\watazon_logo.png" alt="企業ロゴ">
            </a>
        </div>
        <form action="Top.Control" method="post" id="form1">
            <table class="head-table float">
                <tr>
                    <td><input  class="kensakumozi" type="image" src="img\Header\kensaku.jpg"></td>
                    <td class="search"><input type="text" name="search"
                        placeholder="商品名を入力" required></td>
                    <td><input class="searchAction" type="image"
                        src="img\Header\search.png"></td>

                </tr>
            </table>
        </form>

        <div class="menu float mozifont">
            <img src="img\Header\cart.png"> <a href=Cart.Control
                class="cartSuu">${cart.sumBuyCount}</a>
            <c:if test="${empty user_id }">
                <a href=login.jsp>新規登録/ログイン</a>
            </c:if>
            <c:if test="${!empty user_id }">
                <a href=Logout.Control>ログアウト</a>
            </c:if>
            <span class="mypage-kye"><a href=MyPage.Control>マイページ</a></span>
        </div>
    </header>
</body>
</html>

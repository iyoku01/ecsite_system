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

<!-- Bootstrap Start -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet"> -->
<!--[if lt IE 9]>
    <script src="html5shiv.js"></script>
    <script src="respond.min.js"></script>
<![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- Bootstrap End -->

<title>商品詳細ページ</title>
</head>

<body class="bg-info">

    <div class=".container-fluid">
        <!-- 共通ヘッダー -->
        <div class="col-xs-12">
            <jsp:include page="header.jsp" flush="true" />
        </div>

        <div class="row">
            <div class="col-xs-4">

                <!-- カテゴリー -->
                <div class="table-responsive">
                    <table class="table table-hover">
                        <c:forEach var="i" items="${categoryList}" varStatus="st">
                            <tr>
                                <td>${i.category_name}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="col-xs-8">
                <!-- 商品 -->
                <div class="table-responsive">
                    <table class="table table-hover">
                        <c:forEach var="i" items="${productList}" varStatus="st">
                            <tr>
                                <td>${i.product_name}</td>
                                <td>${i.price}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

            </div>
    <!-- メイン画像 -->
    <div></div>
    <!-- サブ画像 -->
    <div></div>

    <!-- 商品タイトル -->
    <div class="productTitle">
        <%="商品タイトル" %>
    </div>
    <!-- レビュー画面リンク -->
    <a href="review.jsp"><%="？" %>のカスタマーレビュー</a>

    <!-- 金額表示 -->
    \<%="5000" %>在庫あり

    <!-- 購入数選択 -->
    <select name="購入数">
        <option>1</option>
        <option>2</option>
        <option>3</option>
    </select>
    <!-- ↑後で変数にする -->

    <input type="submit" name="名前" value="カートに入れる">

    <!-- 商品説明 -->
    <div class="productDatail">
        <%="商品説明" %>
    </div>

    <!-- 社長レビュー -->
    <div class="pReview">
        <%="社長レビュー" %>
    </div>
        <div class="row">
            <div class="col-xs-12">
                <p class="bg-danger">${message}</p>
            </div>
        </div>

        <!-- 共通フッター -->
        <div class="col-xs-12">
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </div>
</body>
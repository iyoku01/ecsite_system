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


<title>TOPページ</title>
</head>

<%
    //--- 表示用のダミー値をセット ---
    //商品
    ArrayList<Product_mstVo> entList = new ArrayList<Product_mstVo>();
    Product_mstVo ent;
    ent = new Product_mstVo();
    ent.setProduct_name("どこかのゲーム");
    ent.setPrice(8800);
    entList.add(ent);
    ent = new Product_mstVo();
    ent.setProduct_name("なんかのゲーム");
    ent.setPrice(9600);
    entList.add(ent);
    request.setAttribute("productList", entList);
 /*
    //商品
      "productList"
         -ArrayList<ListTop>
          "ListTop"
              -hard_id
              -hard_name
              -ArrayList<ProductTopDto>
                "ProductTopDto"
                    -product_id
                    -product_name
                    -その他…
     //該当商品が無い場合のメッセージ
     "topMessage"
       -topMessage
    //ハード
     "hardList"
       -hard_id
       -hard_name
    //カテゴリー
    "categoryList"
      -category_id
      -category_name
    //おすすめ商品
     "recommendList"
       -product_id
       -recommend_pic(pic_file)
 */
%>


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
</html>
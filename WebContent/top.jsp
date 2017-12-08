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


<title>TOP�y�[�W</title>
</head>

<%
    //--- �\���p�̃_�~�[�l���Z�b�g ---
    //���i
    ArrayList<Product_mstVo> entList = new ArrayList<Product_mstVo>();
    Product_mstVo ent;
    ent = new Product_mstVo();
    ent.setProduct_name("�ǂ����̃Q�[��");
    ent.setPrice(8800);
    entList.add(ent);
    ent = new Product_mstVo();
    ent.setProduct_name("�Ȃ񂩂̃Q�[��");
    ent.setPrice(9600);
    entList.add(ent);
    request.setAttribute("productList", entList);
 /*
    //���i
      "productList"
         -ArrayList<ListTop>
          "ListTop"
              -hard_id
              -hard_name
              -ArrayList<ProductTopDto>
                "ProductTopDto"
                    -product_id
                    -product_name
                    -���̑��c
     //�Y�����i�������ꍇ�̃��b�Z�[�W
     "topMessage"
       -topMessage
    //�n�[�h
     "hardList"
       -hard_id
       -hard_name
    //�J�e�S���[
    "categoryList"
      -category_id
      -category_name
    //�������ߏ��i
     "recommendList"
       -product_id
       -recommend_pic(pic_file)
 */
%>


<body class="bg-info">

    <div class=".container-fluid">
        <!-- ���ʃw�b�_�[ -->
        <div class="col-xs-12">
            <jsp:include page="header.jsp" flush="true" />
        </div>

        <div class="row">
            <div class="col-xs-4">

                <!-- �J�e�S���[ -->
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
                <!-- ���i -->
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

        <!-- ���ʃt�b�^�[ -->
        <div class="col-xs-12">
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </div>
</body>
</html>
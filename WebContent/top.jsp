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
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="html5shiv.js"></script>
    <script src="respond.min.js"></script>
<![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- Bootstrap End -->

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
%>


<body class="bg-info">

    <div class=".container-fluid">
        <div class="row">
            <!-- ���ʃw�b�_�[ -->
            <div class="col-xs-12">
                <jsp:include page="header.jsp" flush="true" />
            </div>
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

        <div class="row">
            <div class="col-xs-12">
                <p>--- �f�o�b�O�p��� ---</p>

                <p>���N�G�X�g�ϐ��̈ꗗ</p>
                <c:forEach var="i" items="${pageContext.request.attributeNames}" varStatus="st">
                    <tr>
                        <td>${i}</td>
                    </tr>
                </c:forEach>

            </div>
        </div>
    </div>
</body>
</html>
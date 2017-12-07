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

<title>���i�ڍ׃y�[�W</title>
</head>

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
    <!-- ���C���摜 -->
    <div></div>
    <!-- �T�u�摜 -->
    <div></div>

    <!-- ���i�^�C�g�� -->
    <div class="productTitle">
        <%="���i�^�C�g��" %>
    </div>
    <!-- ���r���[��ʃ����N -->
    <a href="review.jsp"><%="�H" %>�̃J�X�^�}�[���r���[</a>

    <!-- ���z�\�� -->
    \<%="5000" %>�݌ɂ���

    <!-- �w�����I�� -->
    <select name="�w����">
        <option>1</option>
        <option>2</option>
        <option>3</option>
    </select>
    <!-- ����ŕϐ��ɂ��� -->

    <input type="submit" name="���O" value="�J�[�g�ɓ����">

    <!-- ���i���� -->
    <div class="productDatail">
        <%="���i����" %>
    </div>

    <!-- �В����r���[ -->
    <div class="pReview">
        <%="�В����r���[" %>
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
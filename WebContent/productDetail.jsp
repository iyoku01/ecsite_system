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

<title>���i�ڍ�</title>
</head>

<body>
    <!--
    <p>---------------------------------------------------------------</p>
    <p>- �l�擾�T���v��</p>
    <p>---------------------------------------------------------------</p>
    <a href=http://localhost:8080/ecsite_system/ProductDetailControl?product_id=1>�T���v��URL</a>
    <p>${product.product_id}</p>
    <p>${product.product_name}</p>
    <p>${product.price}</p>
    <p>${product.stocks}</p>
    <p>${product.comment}</p>
    <p>${product.hard_id}</p>
    <p>${product.category_id}</p>
    <p>${product.ave_eval}</p>
    <p>${product.review_count}</p>
    <p>${product.mainPic_file}</p>
    <c:forEach var="i" items="${productPicSub}">
        <p>${i}</p>
    </c:forEach>
    <p>---------------------------------------------------------------</p>
 -->

    <!-- �w�����̃h���b�v�_�E���̍ő�l -->
    <c:set var="BUY_COUNT_MAX" value="9" />

    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header.jsp" flush="true" />

    <!-- ���C���摜 -->
    ${product.mainPic_file}
    <img src="${product.mainPic_file}" width="400" height="300">
    <!-- �T�u�摜 -->
    <c:forEach var="i" items="${productPicSub}">
        <p>${i}</p>
        <img src="${i}" width="200" height="130">
    </c:forEach>

    <!-- ���i�^�C�g�� -->
    <div class="productTitle">${product.product_name}</div>
    <p>${product.hard_name}</p>
    <!-- ���r���[��ʃ����N -->
    <a href="review.jsp"><%="�H"%>�̃J�X�^�}�[���r���[</a>

    <!-- ���z�\�� -->
    ${product.price} �݌ɂ���

    <form action="CartAddControl" method="get">
        <!-- ���iID�i�B�����ځj -->
        <input type="hidden" name="product_id" value="${product.product_id}">

        <!-- �w�����I�� -->
        <select name="buy_count">
            <c:forEach begin="1" end="${BUY_COUNT_MAX}" varStatus="status">
                <option value="${status.index}">${status.index}</option>
            </c:forEach>
        </select> <input type="submit" value="�J�[�g�ɓ����">
    </form>

    <!-- ���i���� -->
    <div class="productDatail">
        ${product.info}
    </div>

    <!-- �X���R�����g -->
    <div class="pReview">${product.comment}</div>
    <p>${message}</p>

    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />
</body>
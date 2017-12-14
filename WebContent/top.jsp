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

<link rel="stylesheet" type="text/css" href="css/style.css">

<!-- �X���C�h�V���[ Start -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<link href="css/jquery.bxslider.css" rel="stylesheet" />
<script type="text/javascript">
    $(document).ready(function() {
        $('.bxslider').bxSlider({
            auto : true,
        });
    });
</script>
<!-- �X���C�h�V���[ End -->


<title>TOP�y�[�W</title>
</head>


<body class="bg-info">

    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header.jsp" flush="true" />

    <a href=http://localhost:8080/ecsite_system/Top.Control>�T���v��URL</a>


    <p>�������ߏ��i-------------------------------------------------------------------------------------------</p>
    <ul class="bxslider">
        <c:forEach var="i" items="${recommendList}" varStatus="st">
            <li><a href=ProductDetail.Control?product_id=${i.product_id}><img title="product_id = ${i.product_id}" alt="" src="${i.recommend_pic}" width="590" height="300" /></a></li>
        </c:forEach>
    </ul>


    <p>�J�e�S���[---------------------------------------------------------------------------------------------</p>
    <c:forEach var="i" items="${categoryList}" varStatus="st">
        <p>${i.category_name}</p>
    </c:forEach>
    <p>�n�[�h----------------------------------------------------------------------------------------------------</p>
    <c:forEach var="i" items="${hardList}" varStatus="st">
        <p>
            <a href=http://localhost:8080/ecsite_system/Top.Control?hard_id=${i.hard_id}>${i.hard_name}</a>
        </p>
    </c:forEach>
    <p>���i���X�g ���\���Ɏg��Ȃ��l�͏����Ă�������----------------------------------------</p>
    <c:forEach var="j" items="${productList}">
        <p>------------------------------</p>
        <p>${j.hard_id}</p>
        <p>${j.hard_name}</p>
        <p>------------------------------</p>
        <c:forEach var="i" items="${j.tpd}">
            <p>${i.product_id}</p>
            <p>${i.product_name}</p>
            <p>${i.price}</p>
            <p>${i.stocks}</p>
            <p>${i.comment}</p>
            <p>${i.hard_id}</p>
            <p>${i.category_id}</p>
            <p>${i.ave_eval}</p>
            <p>
                <a href=ProductDetail.Control?product_id=${i.product_id}><img src="${i.pic_file}">${i.pic_file}</a>
            </p>
            <p>------------------------------------------------------------------------</p>
        </c:forEach>
    </c:forEach>

    <p>${message}</p>

    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />
</body>
</html>

<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
    $(function() {
        $('.subGazou img').click(function() {
            var $thisImg = $(this).attr('src');
            $('.mainGazou img').attr({
                src : $thisImg
            });
        });
    });
</script>

<title>���i�ڍ�</title>
</head>

<body>

    <!-- �w�����̃h���b�v�_�E���̍ő�l -->
    <c:set var="BUY_COUNT_MAX" value="10" />

    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header.jsp" flush="true" />


    <div class="border clearfix">
        <!--  �T�u�R���e���c�i��ʍ��j-->
        <div class="productDatail-sub-content border clearfix">
            <!-- �T�u�摜 -->
            <div class="subGazou cursorPointer">
                <img src="${product.mainPic_file}">
                <c:forEach var="i" items="${productPicSub}">

                    <!--  <p>${i}</p> -->
                    <img src="${i}">


                </c:forEach>
            </div>
            <!-- ���C���摜 -->
            <div class="mainGazou">
                <!--�摜   ${product.mainPic_file} -->
                <img src="${product.mainPic_file}">
            </div>

        </div>

        <!-- ���C���R���e���c -->
        <div class="productDatail-main-content border">
            <!-- ���i�^�C�g�� -->
            <div class="productTitle titleMojiFont mozifont">${product.product_name}</div>
            <div class="producthard font-size15px mozifont">
                <p>${product.hard_name}</p>
            </div>
            <!-- �]�� -->
            <div class="ave_eval float">
                <c:forEach begin="1" end="${product.ave_eval}">
                    <img src="img\Hosi.png" width="50px">
                </c:forEach>
            </div>

            <!-- ���r���[��ʃ����N -->
            <div class="review clearfix">
                <a href="ReviewSelect.Control?product_id=${product.product_id}">${product.review_count}���̃J�X�^�}�[���r���[</a>
            </div>
            <!-- ���z�\�� -->
            <div class="productPrice">
                \
                <fmt:formatNumber value="${product.price}" pattern="###,###" />
            </div>

            <div class="zaiko float">�݌ɂ���</div>

            <form action="CartAdd.Control" method="get">
                <!-- ���iID�i�B�����ځj -->
                <input type="hidden" name="product_id" value="${product.product_id}">

                <!-- �w�����I�� -->
                <select name="buy_count" class="float buy_count">

                    <c:forEach begin="1" end="${BUY_COUNT_MAX}" varStatus="status">
                        <option value="${status.index}">${status.index}</option>
                    </c:forEach>
                </select>
                <div class="cratkey clearfix">
                    <input class="orange-button mozifont" type="submit" value="�J�[�g�ɓ����">
                </div>
            </form>

            <!-- ���i���� -->
            <div class="productDatail">${product.info}</div>

            <!-- �X���R�����g -->
            <div class="pReview border">
                �X���R�����g:<br> ${product.comment}
                <p>${message}</p>
            </div>
        </div>
    </div>
</body>
</html>


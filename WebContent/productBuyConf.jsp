<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<title>�w���m�F</title>
</head>
<body>

    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />
    <!-- page�[ -->
    <p>${message}</p>

<<<<<<< HEAD
    <p>���͂���Z��</p>
    <p>${personalData.postal_code}</p>
    <p>${personalData.address}</p>
    <p>���O</p>
    <p>${personalData.name}</p>
    <p>�d�b�ԍ�</p>
    <p>${personalData.phone}</p>
    <p>
    <form action="productBuyDone.Control" method="get">
        <p>���i�̏��v</p>
        <p>${cart.sumPrice}</p>
        <INPUT TYPE="submit" VALUE="�������m�肷��">
    </form>
    <p>
    <p>�������e���m�F</p>
    <table>
        <c:forEach var="i" items="${cart.cartProductList}">
            <tr>
                <td>���i�摜${i.mainPic_file} ���i��${i.product_name} ��${i.buy_count} �l�i${i.price}</td>
            </tr>
        </c:forEach>
    </table>
=======




    <h2 style="position:relative;0%">
        �������グ�����������ɂ��肪�Ƃ��������܂����B<br>�w���ԍ��F${order_id}
    </h2>

    <p class="text-danger">���w���ԍ��͂��₢���킹���ɕK�v�ɂȂ�܂��̂ő�؂ɕۊǂ�������</p>

    <a href=Top.Control> �g�b�v�y�[�W�ɖ߂� </a>


>>>>>>> branch 'master' of https://github.com/iyoku01/ecsite_system.git


    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />
</body>
</html>

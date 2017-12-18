<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<title>�J�[�g</title>
</head>
<body>
    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header.jsp" flush="true" />

    <!-- �w�����̃h���b�v�_�E���̍ő�l -->
    <c:set var="BUY_COUNT_MAX" value="10" />

    <div class="cart">
        <p>${message}</p>
        <table>
            <c:forEach var="i" items="${cart.cartProductList}">
                <tr>
                    <td>
                        <!-- ���iID�i�B�����ځj --> <input type="hidden" name="product_id" value="${i.product_id}" form="cart-product">
                        <img title="product_id = ${i.product_id}" src="${i.mainPic_file}" width="200" height="150" /> ���i��${i.product_name}
                    </td>
                    <td>�l�i${i.price} ��${i.buy_count} <!-- �w�����I�� --> <select name="buy_count" form="cart-product">
                            <c:forEach begin="1" end="${i.buy_count + BUY_COUNT_MAX}" varStatus="status">
                                <option value="${status.index}" <c:if test="${status.index == i.buy_count}" >
                                        selected
                                        </c:if>>${status.index}</option>
                            </c:forEach>
                    </select>
                        <form action="CartDelete.Control" method="get">
                            <!-- ���iID�i�B�����ځj -->
                            <input type="hidden" name="product_id" value="${i.product_id}"> <INPUT TYPE="submit" VALUE="�폜">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <form id="cart-product" action="productBuyConf.Control" method="get">
            ���v�i���i${cart.sumBuyCount}�_):��${cart.sumPrice}(�ō��j <INPUT TYPE="submit" VALUE="���W�ɐi��">
        </form>
    </div>

    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />


</body>
</html>

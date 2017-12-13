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

<title>�J�[�g</title>
</head>
<body>
    <!--
    <p>---------------------------------------------------------------</p>
    <p>- �l�擾�T���v��</p>
    <p>---------------------------------------------------------------</p>
    <a href=http://localhost:8080/ecsite_system/Cart.Control>�T���v��URL</a>
    <c:forEach var="i" items="${cartList}">
        <p>${i}</p>
    </c:forEach>
    <p>${sumBuy_count}</p>
    <p>${sumPrice}</p>
    <p>${cartMap}</p>
    <p>${message}</p>
    <p>---------------------------------------------------------------</p>
     -->
    <div class="bodywhite">

        <!-- �w�����̃h���b�v�_�E���̍ő�l -->
        <c:set var="BUY_COUNT_MAX" value="9" />

        <!-- ���ʃw�b�_�[ -->
        <jsp:include page="header.jsp" flush="true" />

        <div class="cart">
            <p>${message}</p>
            <table>
                <c:forEach var="i" items="${cartList}">
                    <tr>
                        <td>���i�摜${i.mainPic_file} ���i��${i.product_name}</td>
                        <td>�l�i${i.price} ��${i.buy_count} <!-- �w�����I�� --> <select name="buy_count">
                                <c:forEach begin="1" end="${BUY_COUNT_MAX}" varStatus="status">
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

            ���v�i���i${sumBuy_count}�_):��${sumPrice}(�ō��j <a href=Top.Control> <INPUT TYPE="submit" VALUE="���W�ɐi��" class="top">

            </a>
        </div>

        <!-- ���ʃt�b�^�[ -->
        <div class="col-xs-12">
            <jsp:include page="footer.jsp" flush="true" />
        </div>

    </div>
</body>
</html>
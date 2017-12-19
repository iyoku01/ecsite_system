<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>�w���m�F</title>
</head>
<body>
    <div class="bodygray">

        <!-- ���ʃw�b�_�[ -->
        <jsp:include page="header_logoOnly.jsp" flush="true" />
        <!-- page�[ -->
        <p>${message}</p>

        <p>���͂���Z��</p>
        <p>${personalData.postal_code}</p>
        <p>${personalData.address}</p>
        <br>
        <p>���O</p>
        <p>${personalData.name}</p>
        <br>
        <p>�d�b�ԍ�</p>
        <p>${personalData.phone}</p>
        <br>
        <form action="productBuyDone.Control" method="get">
            <p>���i�̏��v</p>
            <p>${cart.sumPrice}</p>
            <br> <INPUT TYPE="submit" VALUE="�������m�肷��">
        </form>
        <br> <br>
        <p>�������e���m�F</p>
        <table>
            <c:forEach var="i" items="${cart.cartProductList}">
                <tr>
                    <td>���i�摜<br>
                    <img title="product_id = ${i.product_id}" src="${i.mainPic_file}" width="200" height="150" /><br>���i��${i.product_name} <br>��${i.buy_count} <br>�l�i${i.price}
                    </td>
                </tr>
            </c:forEach>
        </table>

        <!-- ���ʃt�b�^�[ -->
        <jsp:include page="footer.jsp" flush="true" />
    </div>
</body>
</html>

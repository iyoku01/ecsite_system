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
<div class="productBuyConf">

    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />
    <!-- page�[ -->
    <p>${message}</p>


<div class="pBC1">
<table>
    <td>���͂���Z��<br>
    ${personalData.postal_code}<br>
    ${personalData.address}<br>
    ���O<br>
    ${personalData.name}<br>
    �d�b�ԍ�<br>
    ${personalData.phone}</td>
        </table>
        </div>
</div>
<div class="float">
<div class="pBC2">
        <table>
    <form action="productBuyDone.Control" method="get">
        <td>���i�̏��v<br>
        ${cart.sumPrice}<br>
        <INPUT TYPE="submit" VALUE="�������m�肷��"></td>
    </form>
        </table>
</div>


        <div class="memborder">



<div class="pBC3">
        <table>
    <td>�������e���m�F<br>
        <c:forEach var="i" items="${cart.cartProductList}">
                    <img title="product_id = ${i.product_id}" src="${i.mainPic_file}" width="200" height="150" /><br>���i��${i.product_name} <br>��${i.buy_count} <br>�l�i${i.price}
                    </td>
        </c:forEach>
    </table>
</div>
</div>
    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />

</div>
</body>
</html>

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

<title>�w���m�F</title>
</head>
<body class="bodywhite">

    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />
    <!-- page�[ -->
    <div class="productBuyConf">
        <div class="float productBuyConf_Box">

            <p>${message}</p>

            <div class="float">
                <label>���͂���Z��</label>
                <p>${personalData.postal_code}</p>
                <p>${personalData.address}</p>
                <label>���O</label>
                <p>${personalData.name}</p>
                <label> �d�b�ԍ�</label>
                <p>${personalData.phone}</p>
            </div>
        </div>
        <div class="float productBuyConf_Box">
            <table>
                <tr>
                    <td>���i�̏��v�F</td>
                    <td><fmt:formatNumber value="${cart.sumPrice}" pattern="\#,###(�ō�)" /></td>
                </tr>
                <tr>
                    <td>�z�����F</td>
                    <td>\0</td>
                </tr>
                <tr class="productBuyConf_tableSum">
                    <td>�������z�F</td>
                    <td><fmt:formatNumber value="${cart.sumPrice}" pattern="\#,###(�ō�)" /></td>
                </tr>
            </table>

            <form action="productBuyDone.Control" method="get">
                <INPUT TYPE="submit" VALUE="�������m�肷��">
            </form>
        </div>

        <div class="clearfix"></div>

        <div class="productBuyConf_Box">
            <label class="productBuyConf_ListTitle">�������e���m�F</label>
            <table>
                <c:forEach var="i" items="${cart.cartProductList}">
                    <tr>
                        <td><img src="${i.mainPic_file}" width="70" height="90" /> </td>
                        <td><span class="mozifont">${i.product_name}</span><br><br>
                        ���ʁF${i.buy_count} &nbsp;&nbsp;&nbsp; ���i�F<fmt:formatNumber value="${i.price}" pattern="\#,###" /></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</body>
</html>

<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">
<title>���r���[�L��</title>
</head>
<body>

    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header.jsp" flush="true" />


    <%
        request.setCharacterEncoding("Windows-31J");
    %>
    <div row>
        <p>${param.product_name}</p>
        <p>${param.price}</p>
        <p>${param.info}</p>
        <p>${param.hard_name}</p>
        <p>${param.ave_eval}</p>
        <p>${param.mainPic_file}</p>
        <p>${param.review_count}</p>
    </div>



    <form action=ReviewWrite.Control method=post>
        <p>
            �]���F<select name="evaluation">
                <c:forEach begin="1" end="5" varStatus="i">
                    <c:if test="${evaluation==i.index}">
                        <option value="${i.index}" selected>${i.index}
                    </c:if>
                    <option value="${i.index}">${i.index}
                </c:forEach>
            </select>
        </p>
        <p>
            �j�b�N�l�[���F<input type=text name=nickname value="${param.nickname}">
        </p>
        <p>
            �R�����g�������F
            <textarea name=review>${param.review}</textarea>
        </p>
        <input type=hidden name=product_id
            value="<%=request.getParameter("product_id")%>">
        <c:if test="${param.update}">
            <input type=hidden name=update value="true">
        </c:if>
        <input type=submit value=���M>
    </form>

</body>
</html>
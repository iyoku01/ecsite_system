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

<title>�V�K����o�^</title>
</head>
<body>

<%request.setCharacterEncoding("Windows-31J"); %>
    <form action="CheckId.Control" method="post">

        <p>
            ���[�U�[ID<input type=text name=user_id value="${param.user_id}">
        </p>
        <p>
            �p�X���[�h<input type=text name=password value="${param.password}">
        </p>
        <p>
            ���O<input type=text name=name value ="${param.name}">
        </p>
        <p>
            �j�b�N�l�[��<input type=text name=nickname value ="${param.nickname}">
        </p>
        <p>
            �d�b�ԍ�<input type=text name=phone value ="${param.phone}">
        </p>
        <p>
            �X�֔ԍ�<input type=text name=postal_code value ="${param.postal_code}">
        </p>
        <p>
            �Z��<input type=text name=address value ="${param.address}">
        </p>
         <input type=submit value=�m�F��ʂ�>
    </form>

    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />

</body>
</html>

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

<title>�w������</title>
</head>
<body class="bodygray">
    <div class="productBuyDone">

        <!-- ���ʃw�b�_�[ -->
        <jsp:include page="header_logoOnly.jsp" flush="true" />

        <!-- page�[ -->
        <h2>
            �������グ�����������ɂ��肪�Ƃ��������܂����B<br> �w���ԍ��F${order_Id}
        </h2>

        <p class="text-danger">���w���ԍ��͂��₢���킹���ɕK�v�ɂȂ�܂��̂ő�؂ɕۊǂ�������</p>

        <input type="button" value="�g�b�v�y�[�W�ɖ߂�" onClick="location.href='Top.Control'" class="orange-button mozifont">

    </div>
</body>
</html>

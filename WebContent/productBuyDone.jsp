<%@ page contentType="text/html; charset=Windows-31J"%>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<!DOCTYPE html>
<html>
<head>
<META charset="Windows-31J">

<title>�w������</title>
</head>
<body>


    <!-- ���ʃw�b�_�[ -->
    <jsp:include page="header_logoOnly.jsp" flush="true" />

    <!-- page�[ -->


    <h2>
        �������グ�����������ɂ��肪�Ƃ��������܂����B<br> �w���ԍ��F${order_id}
    </h2>

    <p class="text-danger">���w���ԍ��͂��₢���킹���ɕK�v�ɂȂ�܂��̂ő�؂ɕۊǂ�������</p>

    <a href=Top.Control> �g�b�v�y�[�W�ɖ߂� </a>




    <!-- ���ʃt�b�^�[ -->
    <jsp:include page="footer.jsp" flush="true" />
</body>
</html>
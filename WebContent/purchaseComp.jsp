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

<!-- Bootstrap Start -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/style.css">
 <%--<link
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
    rel="stylesheet"> --%>
<!--[if lt IE 9]>
    <script src="html5shiv.js"></script>
    <script src="respond.min.js"></script>
<![endif]-->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- Bootstrap End -->

<title>�w������</title>
</head>
<body>
<div class="bodygray">


    <!-- ���ʃw�b�_�[ -->



        <jsp:include page="header_logoOnly.jsp" flush="true" />

     <!-- page�[ -->



            <h2>�������グ�����������ɂ��肪�Ƃ��������܂����B<br>
           �w���ԍ��F�i${order_id}�j</h2>




    <p class="text-danger">���w���ԍ��͂��₢���킹���ɕK�v�ɂȂ�܂��̂ő�؂ɕۊǂ�������</p>



<a href=TopControl>
<div class="center" ><INPUT TYPE="submit"  VALUE="�g�b�v�y�[�W�ɖ߂�"class="top"></div>
</a>




    <!-- ���ʃt�b�^�[ -->
    <div class="col-xs-12">
        <jsp:include page="footer.jsp" flush="true" />
    </div>

</div>
</body>
</html>
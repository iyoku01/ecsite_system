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

<title>�J�[�g</title>
</head>
<body>



    <!-- ���ʃw�b�_�[ -->



    <jsp:include page="header.jsp" flush="true" />

    <!-- page�[ -->

    <table>
        <tr>
            <td>���i�摜 ���i��</td>
            <td>�l�i ��(�v���_�E������)

            </td>
        </tr>
    </table>

    ���v�i���i�Z�_):���Z�Z(�ō��j
    <a href=TopControl> <INPUT TYPE="submit" VALUE="���W�ɐi��" class="top">

    </a>




    <!-- ���ʃt�b�^�[ -->
    <div class="col-xs-12">
        <jsp:include page="footer.jsp" flush="true" />
    </div>


</body>
</html>
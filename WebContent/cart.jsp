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
<div class="bodywhite">


    <!-- ���ʃw�b�_�[ -->



    <jsp:include page="header.jsp" flush="true" />

    <!-- page�[ -->
<div class ="cart">
    <table>
        <tr>
            <td>���i�摜 ���i��</td>
            <td>�l�i ��

            <form>
<select name="kibun">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select></form>

            <INPUT TYPE="submit" VALUE="�폜">
            </td>
        </tr>
    </table>

    ���v�i���i�Z�_):���Z�Z(�ō��j
    <INPUT TYPE="submit" VALUE="���W�ɐi��" class="cartbotton">
</div>



    <!-- ���ʃt�b�^�[ -->
    <div class="col-xs-12">
        <jsp:include page="footer.jsp" flush="true" />
    </div>

</div>
</body>
</html>
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


<title>TOP�y�[�W</title>
</head>

<%
    /*
        //--- �\���p�̃_�~�[�l���Z�b�g ---
        //���i
        ArrayList<Product_mstVo> entList = new ArrayList<Product_mstVo>();
        Product_mstVo ent;
        ent = new Product_mstVo();
        ent.setProduct_name("�ǂ����̃Q�[��");
        ent.setPrice(8800);
        entList.add(ent);
        ent = new Product_mstVo();
        ent.setProduct_name("�Ȃ񂩂̃Q�[��");
        ent.setPrice(9600);
        entList.add(ent);
        request.setAttribute("productList", entList);
    */
%>






<body class="bg-info">

    <div class=".container-fluid">
        <!-- ���ʃw�b�_�[ -->
        <div class="col-xs-12">
            <jsp:include page="header.jsp" flush="true" />
        </div>

        <!--
    ����div�͈̔͂�Attribute�̒l�̎��o���ɂȂ�܂�
     �\���ɖ𗧂ĂĒ�����΂Ǝv���܂�
     -->
        <div class="row">
            <a href=http://localhost:8080/ecsite_system/TopControl>�T���v��URL</a>
            �J�e�S���[---------------------------------------------------------------------------------------------
            <c:forEach var="i" items="${categoryList}" varStatus="st">
                    <p>${i.category_name}</p>
            </c:forEach>
            �n�[�h----------------------------------------------------------------------------------------------------
            <c:forEach var="i" items="${hardList}" varStatus="st">
                    <p>${i.hard_name}</p>
            </c:forEach>
            �������ߏ��i-------------------------------------------------------------------------------------------
            <c:forEach var="i" items="${recommendList}" varStatus="st">
                    <p>${i.product_id}</p>
                    <p>${i.recommend_pic}</p>
            </c:forEach>
            ���i���X�g ���\���Ɏg��Ȃ��l�͏����Ă�������----------------------------------------
            <c:forEach var="j" items="${productList}">
                <p>${j.hard_id}</p>
                <p>${j.hard_name}</p>
                <c:forEach var="i" items="${j.tpd}">
                    <p>${i.product_id}</p>
                    <p>${i.product_name}</p>
                    <p>${i.price}</p>
                    <p>${i.stocks}</p>
                    <p>${i.comment}</p>
                    <p>${i.hard_id}</p>
                    <p>${i.category_id}</p>
                    <p>${i.ave_eval}</p>
                    <p><a href=http://localhost:8080/ecsite_system/ProductDetailControl?product_id=${i.product_id}>${i.pic_file}</a></p>
                    <p>------------------------------------------------------------------------</p>
                </c:forEach>
            </c:forEach>
        </div>


        <div class="row">
            <div class="col-xs-4">

                <!-- �J�e�S���[ -->
                <div class="table-responsive">
                    <table class="table table-hover">
                        <c:forEach var="i" items="${categoryList}" varStatus="st">
                            <tr>
                                <td>${i.category_name}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="col-xs-8">
                <!-- ���i -->
                <div class="table-responsive">
                    <table class="table table-hover">
                        <c:forEach var="i" items="${productList}" varStatus="st">
                            <tr>

                            </tr>
                        </c:forEach>
                    </table>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <p class="bg-danger">${message}</p>
            </div>
        </div>

        <!-- ���ʃt�b�^�[ -->
        <div class="col-xs-12">
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </div>
</body>
</html>
<%@ page contentType="text/html; charset=Windows-31J"%>
<!DOCTYPE html>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

<div class="row">
    <div class="col-xs-12">
        <h5 class="text-center bg-primary">[���ʃt�b�^�[] �f�o�b�O�p���</h5>

        <p>�p�����^�ϐ��̈ꗗ</p>
        <div class="table-responsive">
            <table class="table table-striped table-condensed">
                <c:forEach var="i" items="${pageContext.request.parameterNames}" varStatus="st">
                    <tr>
                        <td>${i}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <p>�Z�b�V�����ϐ��̈ꗗ</p>
        <div class="table-responsive">
            <table class="table table-striped table-condensed">
                <c:forEach var="i" items="${pageContext.session.attributeNames}" varStatus="st">
                    <tr>
                        <td>${i}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <p>���N�G�X�g�ϐ��̈ꗗ</p>
        <div class="table-responsive">
            <table class="table table-striped table-condensed">
                <c:forEach var="i" items="${pageContext.request.attributeNames}" varStatus="st">
                    <tr>
                        <td>${i}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <p>
    </div>
</div>

<%@ page contentType="text/html; charset=Windows-31J"%>
<!DOCTYPE html>

<!-- El Start -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- El End -->

        <br>
        <p>---------------------------------------------------------------</p>
        <p>[共通フッター] デバッグ用情報</p>
        <p>---------------------------------------------------------------</p>

        <p>パラメタ変数の一覧</p>
        <div class="table-responsive">
            <table class="table table-striped table-condensed">
                <c:forEach var="i" items="${pageContext.request.parameterNames}" varStatus="st">
                    <tr>
                        <td>${i}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <p>セッション変数の一覧</p>
        <div class="table-responsive">
            <table class="table table-striped table-condensed">
                <c:forEach var="i" items="${pageContext.session.attributeNames}" varStatus="st">
                    <tr>
                        <td>${i}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <p>リクエスト変数の一覧</p>
        <div class="table-responsive">
            <table class="table table-striped table-condensed">
                <c:forEach var="i" items="${pageContext.request.attributeNames}" varStatus="st">
                    <tr>
                        <td>${i}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br>

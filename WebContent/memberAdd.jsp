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
<body class=bodygray>
    <jsp:include page="header_logoOnly.jsp" flush="true" />
    <span class="screenname">�V�K����o�^���</span>

    <div class=inputForm>
        <%
            request.setCharacterEncoding("Windows-31J");
        %>

        <p class=message>${message}</p>

        <form onSubmit="return CheckPassword()" id=form
                  action="CheckId.Control" method="post">
            <table>
                <tr>
                    <th>ID</th>
                    <td><input type=text name="user_id" value="${param.user_id}" pattern=^([a-zA-Z0-9]{6,10})$ title="" required ></td>
                    <td>���p�p��6�`10����</td>
                </tr>
                <tr>
                    <th>���O</th>
                    <td><input type=text name="name" value="${param.name}" pattern=.{1,30} title="�w�肵�Ă��镶�������œ��͂��ĉ�����" required></td>
                    <td>30�����܂�</td>
                </tr>
                <tr>
                    <th>�j�b�N�l�[��</th>
                    <td><input type=text name="nickname" value="${param.nickname}" pattern=.{1,20} title="�w�肵�Ă��镶�������œ��͂��ĉ�����" required required></td>
                    <td>20�����܂�</td>
                </tr>
                <tr>
                    <th>�X�֔ԍ�</th>
                    <td><input type=text name="postal_code"
                        value="${param.postal_code}" pattern=\d{7} title="���p����7���œ��͂��ĉ�����" required></td>
                    <td>�n�C�t������ 7��</td>
                </tr>
                <tr>
                    <th>�Z��</th>
                    <td><input type=text name="address" value="${param.address}" pattern=.{1,50} title="�w�肵�Ă��镶�������œ��͂��ĉ�����" required></td>
                    <td>50�����܂�</td>
                </tr>
                <tr>
                    <th></th>
                    <td>���}���V�������A�����ԍ��܂Ő������L�����Ă��������B</td>
                </tr>
                <tr>
                    <th>�d�b�ԍ�</th>
                    <td><input type=text name="phone" value="${param.phone}" pattern=\d{10,12} title="���p����12���œ��͂��ĉ�����" required></td>
                    <td>�n�C�t������ 12��</td>
                </tr>
                <tr>
                    <th>�p�X���[�h</th>
                    <td><input type=text name="password" id="password" value="${param.password}" pattern=^([a-zA-Z0-9]{8,24})$ title="���p�p��8�`24���œ��͂��ĉ�����" required></td>
                    <td>���p�p��8�`24��</td>
                </tr>
                <tr>
                    <th>�p�X���[�h�m�F</th>
                    <td><input type=text name="checkPassword" id="checkPassword" value="${param.checkPassword}" pattern=^([a-zA-Z0-9]{8,24})$ title="�߽ܰ�ނƓ������e�œ��͂��ĉ�����" required></td>
                    <td>������x���͂��ĉ�����</td>
            </table>
            <input type=submit class=orange-button value=�m�F��ʂɐi��>
        </form>
    </div>
<script>
function CheckPassword(input) {
    var password = document.forms.form.password.value;
    var checkPassword =document.forms.form.checkPassword.value;
    if (password != checkPassword){
      alert("�p�X���[�h�Ɗm�F�p�p�X���[�h����v���܂���");
      return false;
    }else{
      return true;
    }
  };
</script>


</body>
</html>

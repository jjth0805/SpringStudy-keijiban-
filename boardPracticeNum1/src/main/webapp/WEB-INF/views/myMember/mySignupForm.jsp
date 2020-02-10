<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規ユーザー登録</title>
<script>
    function idCheckForm(){
        open("<c:url value='/myMember/idCheckForm'/>","_blank", "width=500, height=200");
        }
</script>
</head>
<body>
<h1>会員登録</h1>
<form action="<c:url value='/myMember/mySignup'/>" method="post">
<table>
    <tr>
        <th>アカウント</th>
            <td>
                <input type="text" id="userid" name="userid" value="" placeholder="例）user@domain.com" readonly="readonly">
                <input type="button" value="中腹確認" onclick="idCheckForm()">
            </td>
    </tr>
    <tr>
        <th>パスワード</th>
            <td>
                <input type="password" name="userpwd" placeholder="例）6~20文字の英数字" required="required">
            </td>
    </tr>
    <tr>
        <th>パスワード確認</th>
            <td>
                <input type="password" name="userpwd" placeholder="例）6~20文字の英数字" required="required">
            </td>
    </tr>
    <tr>
        <th colspan="2">
            <input type="submit" value="規約に同意して登録する" id="signupBtn" disabled="disabled">
        </th>
    </tr>
</table>
</form>
</body>
</html>
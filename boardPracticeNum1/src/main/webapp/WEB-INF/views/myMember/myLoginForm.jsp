<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<c:if test="${requestScope.loginResult == false}">
	<script>
        alert("アカウントまたはパスワードが正しくありません。もう一度入力してください");
    </script>
</c:if>
</head>
<body>
	<form action="<c:url value='/myMember/myLogin'/>" method="post">
		<table>
			<tr>
				<th>アカウント</th>
				<td><input type="text" name="userid"></td>
			</tr>
			<tr>
				<th>パスワード</th>
				<td><input type="password" name="userpwd"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="ログイン"></th>
			</tr>
		</table>
	</form>
</body>
</html>
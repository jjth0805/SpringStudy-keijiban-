<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メーンページ</title>
</head>
<body>
	<c:if test="${requestScope.signupResult == true}">
		<script>
			alert("会員登録完了！")
		</script>
	</c:if>
	<h1>[メーンページ]</h1>
	<c:choose>
		<c:when test="${sessionScope.userid==null}">
			<h2>
				<a href="<c:url value='myMember/mySignupForm'/>">会員登録画面</a>
			</h2>
			<h2>
				<a href="<c:url value='myMember/myLoginForm'/>">ログイン画面</a>
			</h2>
		</c:when>
		<c:otherwise>
                こんにちは、${sessionScope.userid}様!<br>
			<h2>
				<a>芳名録</a>
			</h2>
			<h2>
				<a>掲示板</a>
			</h2>
			<h2>
				<a href="<c:url value='/myMember/logout'/>">ログアウト</a>
			</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>
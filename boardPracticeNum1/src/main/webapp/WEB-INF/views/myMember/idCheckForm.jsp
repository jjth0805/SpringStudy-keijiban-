<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アカウント重複確認</title>
<script>
    function closeFunc(){
        close();
        }
    function submitId(){
    	var useridDoc = opener.document.getElementById("userid");
        var signupBtnDoc = opener.document.getElementById("signupBtn");
        useridDoc.value = "${userid}";
        signupBtnDoc.removeAttribute("disabled");
        close();
        }
</script>
</head>
<body>
	<h1>アカウント重複確認</h1>
	<form action="<c:url value='/myMember/checkid'/>" method="post">
		<input type="text" name="userid" value="${userid}" required="required">
        <input type="submit" value="重複確認">
        <input type="button" id="btn" value="使用" onclick="submitId()" disabled="disabled">
        <input type="button" value="戻る" onclick="closeFunc()">
    </form>
	<c:choose>
		<c:when test="${checkResult == true}">
			<p>使用可能なアカウントです</p>
			<script>
	           document.getElementById("btn").removeAttribute("disabled");
	       </script>
		</c:when>
		<c:when test="${checkResult == false}">
			<p>中腹されたアカウントです</p>
		</c:when>
	</c:choose>
</body>
</html>

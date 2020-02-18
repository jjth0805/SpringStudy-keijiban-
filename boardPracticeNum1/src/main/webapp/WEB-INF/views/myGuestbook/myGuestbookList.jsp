<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>芳名録</title>
<body>

<h1>[ 芳名録 ]</h1>
<form action="<c:url value='/myGuestbook/myGuestbookList'/>" method="get">
    <select name="searchItem">
        <option value="userid" selected="selected">作成者</option>
        <option value="content">内容</option>
    </select>
    <input type="text" name="searchKeyword">
    <input type="submit" value="検索">
</form>

<form action="<c:url value='/myGuestbook/write'/>" method="post">
    <fieldset>
        <legend>
            <input type="submit" value="記帳" onclick="">
        </legend>
        <p>作成者<input type="text" value="${sessionScope.userid}" disabled="disabled"></p>
    </fieldset>
    添付ファイル<br>
    内容<textarea rows="3" name="content"></textarea>
<c:forEach items="${requestScope.list}" var="guestbook">
    <fieldset>
        <legend></legend>
        <p>作成者: ${guestbook.userid}</p>
        <p>作成日: </p>
        <p>添付ファイル: </p>
        <pre>内容: </pre>
        <c:if test="${guestbook.userid == sessionScope.userid}">
        <a href="">
            <input type="button" value="削除" onclick="return delConfirm()">
        </a>
        </c:if>
    </fieldset>
    <br>
</c:forEach>
</form>
</body>
</html>
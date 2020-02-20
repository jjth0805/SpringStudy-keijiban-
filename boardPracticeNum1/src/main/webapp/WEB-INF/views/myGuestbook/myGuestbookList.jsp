<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>芳名録</title>
<script>
    function writeConfirm(){
        return confirm("登録をしますか?");
    }
    function delConfirm(){
    	return confirm("削除しますか?");
        }
</script>
<c:choose>
    <c:when test="${requestScope.writeResult==true}">
        <script>alert("登録 成功");</script>
    </c:when>
    <c:when test="${requestScope.writeResult==false}">
        <script>alert("登録 失敗");</script>
    </c:when>
    <c:when test="${requestScope.delResult==true}">
        <script>alert("削除 失敗");</script>
    </c:when>
    <c:when test="${requestScope.delResult==false}">
        <script>alert("削除 成功");</script>
    </c:when>
</c:choose>
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

<form action="<c:url value='/myGuestbook/writeGuestbook'/>" method="post">
    <fieldset>
        <legend>
            <input type="submit" value="記帳" onclick="return writeConfirm()">
        </legend>
        <p>作成者<input type="text" value="${sessionScope.userid}" disabled="disabled"></p>
    添付ファイル<br>
    内容<textarea rows="3" name="content"></textarea>
    </fieldset>
</form>
<c:forEach items="${requestScope.list}" var="guestbook">
    <fieldset>
        <legend>${guestbook.seq}</legend>
        <p>作成者 : ${guestbook.userid}</p>
        <p>作成日 : ${guestbook.regdate}</p>
        <p>添付ファイル : </p>
        <pre>内容 : ${guestbook.content}</pre>
        <c:if test="${guestbook.userid == sessionScope.userid}">
        <a href="<c:url value='/myGuestbook/deleteGuestbook?seq=${guestbook.seq}'/>">
            <input type="button" value="削除" onclick="return delConfirm()">
        </a>
        </c:if>
    </fieldset>
    <br>
</c:forEach>
</body>
</html>
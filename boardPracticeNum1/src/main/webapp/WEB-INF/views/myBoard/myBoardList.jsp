<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示板画面</title>
<link rel="stylesheet" type="text/css" href="/myboard/resources/css/default.css">
<c:choose>
    <c:when test="${requestScope.writeResult==true}">
        <script> alert("登録できました！")</script>
    </c:when>
    <c:when test="${requestScope.writeResult==false}">
        <script> alert("登録失敗しました！")</script>
    </c:when>
    <c:when test="${requestScope.boardDelResult==true}">
        <script> alert("削除できました！")</script>
    </c:when>
    <c:when test="${requestScope.boardDelResult==false}">
        <script> alert("削除失敗しました！")</script>
    </c:when>
</c:choose>
</head>
<body>
<h1>[ 掲示板 ]</h1>
<table>
	<tr>
	    <td colspan="4">
	    <form action="<c:url value='/myBoard/myBoardList'/>" method="get">
	        <select name="searchItem">
	            <option value="title" selected="selected">タイトル</option>
	            <option value="userid">作成者</option>
	            <option value="content">内容</option>
	        </select>
	        <input type="text" name="searchKeyword">
	        <input type="submit" value="검색"><br>
	    </form>
	    <br>
	    </td>
	</tr>
	    <tr>
	       <td colspan="5" class="right"><a href="<c:url value='/myBoard/myBoardWriteForm'/>"><img src="<c:url value ='/resources/img/write_64.png'/>"></a></td>
	    </tr>
	    <tr class="center">
	        <th>番号</th>
	        <th>作成者</th>
	        <th>タイトル</th>
	        <th>照会</th>
	        <th>日付</th>
	    </tr>
    <c:forEach items="${requestScope.list}" var="board">
	    <tr>
	        <td class="center">${board.boardNum}</td>
	        <td class="center">${board.userid}</td>
	        <td id="title"><a href="<c:url value='/myBoard/myBoardRead?boardNum=${board.boardNum}'/>">${board.title}</a></td>
	        <td class="center">${board.hit}</td>
	        <td id="inputdate">${board.inputdate}</td>
	    </tr>
    </c:forEach>
</table>
</body>
</html>
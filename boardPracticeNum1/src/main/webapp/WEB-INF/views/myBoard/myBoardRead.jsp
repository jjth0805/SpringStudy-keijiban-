<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title}</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/default.css" />" />
<script>
	
</script>
</head>
<body>
<h1>[ 文読み ]</h1>
<table>
	<tr>
		<td class="right" colspan="2">
<!-- 			수정 / 삭제 / 목록 버튼 넣기 -->
<!-- 			수정 / 삭제 / 버튼은 게시글 작성자와 접속 유저가 동일할 경우에만 출력-->
		</td>
	</tr>
	<tr>
		<th>番号</th>
		<td>${vo.boardNum}</td>
	</tr>
	<tr>
		<th>作成者</th>
		<td>${vo.userid}</td>
	</tr>
	<tr>
		<th>作成日</th>
		<td>${vo.inputdate}</td>
	</tr>
	<tr>
		<th>照会</th>
		<td>${vo.hit}</td>
	</tr>
	<tr>
		<th>タイトル</th>
		<td>${vo.title}</td>
	</tr>
	<tr>
		<th>添付ファイル</th>
		<td>${vo.originalFileName}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea readonly="readonly">${vo.content}</textarea></td>
	</tr>
</table>
</body>
</html>

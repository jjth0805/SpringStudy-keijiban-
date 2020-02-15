<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title}</title>
<link rel="stylesheet" type="text/css" href="<c:url value = '/resources/css/default.css' />">
	<script>
	    function boardUpdate(){
	        if(confirm("修正しますか？")){
	             var updateFormDoc = document.getElementById("updateForm");
	             updateFormDoc.submit();
		        }
		    }
	</script>
</head>
<body>
<h1>[ 修正 ]</h1>
<form id="updateForm" action="<c:url value='/myBoard/myBoardUpdate'/>" method="post">
	<table>
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
			<td><input type="text" name="title" value="${vo.title}" required="required"></td>
		</tr>
		<tr>
			<th>添付ファイル</th>
			<td>
			</td>
		</tr>
		<tr>
			<th>内容</th>
			<td><textarea name="content" required="required">${vo.content}</textarea></td>
		</tr>
		<tr>
			<td class="right" colspan="2">
				<!-- 수정 / 취소 버튼 추가 -->
				<input type="button" value="修正" onclick="boardUpdate()">
				<a href="<c:url value='/myBoard/myBoardRead?boardNum=${requestScope.vo.boardNum}'/>">
				    <input type="button" value="取り消す">
				</a>
			</td>
		</tr>
	</table>
	<!-- 서버에 글 번호를 보내기위한 hidden -->
	<!-- 글 번호를 지정 -->
	<input type="hidden" name="boardNum" value="${requestScope.vo.boardNum}">
</form>
</body>
</html>

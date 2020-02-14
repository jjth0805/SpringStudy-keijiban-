<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title}</title>
<link rel="stylesheet" type="text/css" href="" />
	<script>
	</script>
</head>
<body>
<h1>[ 修正 ]</h1>
<form action="" method="post">
	<table>
		<tr>
			<th>번호</th>
			<td></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td></td>
		</tr>
		<tr>
			<th>조회</th>
			<td></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="" value="" required="required"></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="" required="required"></textarea></td>
		</tr>
		<tr>
			<td class="right" colspan="2">
				<!-- 수정 / 취소 버튼 추가 -->
			</td>
		</tr>
	</table>
	<!-- 서버에 글 번호를 보내기위한 hidden -->
	<!-- 글 번호를 지정 -->
	<input type="hidden" name="" value="">
</form>
</body>
</html>

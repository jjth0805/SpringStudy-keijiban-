<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title}</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/default.css" />" />
<script>
    function delConfirm(){
        if(confirm("削除しますか?")){
            location.href = "<c:url value='/myBoard/myBoardDelete?boardNum=${vo.boardNum}'/>";
            }
        }
    function replyDelete(replynum){
        if(confirm("削除しますか?")){
            location.href = "<c:url value='/myBoard/replyDelete?replynum="+replynum+"&boardNum=${vo.boardNum}'/>";
            }
        }
</script>
</head>
<body>
	<h1>[ 文読み ]</h1>
	<table>
		<tr>
			<td class="right" colspan="2"><c:if
					test="${sessionScope.userid == requestScope.vo.userid }">
					<a
						href="<c:url value='/myBoard/myBoardUpdateForm?boardNum=${requestScope.vo.boardNum }'/>">
						<input type="button" value="修正">
					</a>
					<input type="button" value="削除" onclick="delConfirm()">
				</c:if> <a href="<c:url value='/myBoard/myBoardList'/>"> <input
					type="button" value="目録">
			</a></td>
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
			<th>内容</th>
			<td><textarea readonly="readonly">${vo.content}</textarea></td>
		</tr>
	</table>
	<form action="<c:url value='/myBoard/replyWrite'/>" method="post">
		<input type="hidden" name="boardNum" value="${vo.boardNum}" />
		<table>
			<tr>
				<td>
				    <input id="replytext" type="text" name="replytext" required="required" />
					<input id="replysubmit" type="submit" value="コメント" />
			     </td>
			</tr>
		</table>
	</form>
	<div id="replydisplay">
		<table class="reply">
			<c:forEach items="${replyList}" var="reply">
				<tr>
					<td class="replytext">${reply.replytext}</td>
					<td class="replyid"><span>${reply.userid}</span></td>
					<td class="replydate"><span>${reply.inputdate}</span></td>
					<c:if test="${sessionScope.userid == reply.userid}">
						<td class="replybutton"><input type="button" value="削除" onclick="replyDelete(${reply.replynum})"></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>

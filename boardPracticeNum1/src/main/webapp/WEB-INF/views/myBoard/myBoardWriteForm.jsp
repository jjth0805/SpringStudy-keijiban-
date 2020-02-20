<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文書き</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/default.css'/>">
<script>
        function writeConfirm(){
            return confirm("登録しますか");
        }
</script>
</head>
<body>
<h1>[ 文書き ]</h1>
<form action="<c:url value='/myBoard/myBoardWrite'/>" method="post">
<table border="1">
        <tr>
            <th>作成者</th>
            <td>${sessionScope.userid}</td>
        </tr>
        <tr>
            <th>タイトル</th>
            <td><input type="text" name="title" required="required"></td>
        </tr>
        <tr>
            <th>添付ファイル</th>
            <td>
            </td>
        </tr>
        <tr>
            <th>内容</th>
            <td><textarea rows="5" name="content" required="required"></textarea></td>
        </tr>
        <tr>
            <td class="right" colspan="2">
                <input type="submit" value="確認" onclick="return writeConfirm()">
                <a href="<c:url value='/myBoard/myBoardList'/>">
                <input type="button" value="キャンセル"></a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
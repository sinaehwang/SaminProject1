<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<!-- 에러문구 공통처리-->
<script>
const alertMsg = '${msg}'.trim();
if ( alertMsg ) {
	alert(alertMsg);
}
const historyBack = '${historyBack}' == 'true';
if ( historyBack ) {
	history.back();
}
const replaceUri = '${replaceUri}'.trim();
if ( replaceUri ) {
	location.replace(replaceUri);
}
</body>
</html>
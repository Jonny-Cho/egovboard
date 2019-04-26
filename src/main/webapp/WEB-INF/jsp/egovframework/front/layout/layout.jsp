<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%   
response.setHeader("Cache-Control","no-store");   
response.setHeader("Pragma","no-cache");   
response.setDateHeader("Expires",0);   
if (request.getProtocol().equals("HTTP/1.1")) 
        response.setHeader("Cache-Control", "no-cache"); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
    <title><c:out value="${strTitle}" /></title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/front/bootstrap-3.3.7-dist/css/bootstrap.min.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/front/airdatepicker-dist/css/datepicker.css'/>"/>
    <style>
		html {
			position: relative;
			min-height: 100%;
		}
		body {
			/* Margin bottom by footer height */
			margin-bottom: 60px;
		}
        #main > .container {
        	padding-bottom: 3rem;
        }
        #footer{
        	width: 100%;
            height: 60px;
            text-align: center;
            background-color: rgba(70, 70, 70, 1);
            color: rgba(200, 200, 200, 1);
            position:absolute;
            bottom: 0;
            padding-top: 1.8rem;
        }
        .trTarget:hover {
			cursor : pointer;
			background-color : skyblue;
		}
		#bContent{
			max-width: 100%;
			min-width: 100%;
			height: 300px;
		}
		nav#paging, #formTarget {
			text-align: center;
		}
		.pagination a {
			cursor: pointer;
		}
    </style>
</head>
<body>
    <div id="header"><tiles:insertAttribute name="header" /></div>
    <div id="main"><tiles:insertAttribute name="body" /></div>
    <div id="footer"><tiles:insertAttribute name="footer" /></div>
    
	<script src="<c:url value='/front/js/jquery3.4.0.js'/>"></script>
	<script src="<c:url value='/front/bootstrap-3.3.7-dist/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/front/airdatepicker-dist/js/datepicker.js'/>"></script>
	<script src="<c:url value='/front/airdatepicker-dist/js/i18n/datepicker.en.js'/>"></script>
	
    <!-- *-js.jsp -->
    <tiles:insertAttribute name="body-js"/>
</body>
</html>
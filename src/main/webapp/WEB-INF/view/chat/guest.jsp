<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head >
	<title>与客服对话中...</title>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.min.css">    
    <link rel="stylesheet" type="text/css" href="${ctx}/css/guest.css?v=0.1">    
    <script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/guest.js?v=0.1"></script>
</head>
<body >
<div data-role="page" id="main" style="overflow-y:auto;">
    <div data-role="content" class="container" role="main">
    	<input type="hidden" id="mynickname" value=""/>
    	<input type="hidden" id="mypicture" value=""/>
    	<input type="hidden" id="cnickname" value=""/>
    	<input type="hidden" id="cpicture" value=""/>
    	<div id="console-container">
	        <div id="console" >
	        	<ul class="content-reply-box mg10">
	        		
	        	</ul>
	        </div>
	    </div>
       	<!--  -->
        <div id="footer" style="margin-top:2.5em;">
			<nav class="navbar navbar-default navbar-fixed-bottom">
		    	<div class="navbar-inner navbar-content-center"  >
			        <ul >
			        	<li class="col-xs-9" style="margin-top:0.5em;margin-bottom:0.5em;"> 
				        	<div class="input-group-lg">
							  <input type="text" class="form-control" id="chat" >
							</div>
						</li>
		        		<li class="col-xs-3" style="margin-top:1em;"><button type="button" class="btn btn-success send-button" onclick="sendMsg();" style="width: 100%;">发送</button></li>
			    	</ul>
		    	</div>
			</nav>
		</div>
		
    </div>
    
</div>

</body>
</html>
<%@include file="Utils.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="apple-touch-icon" href="media/adip2.png">
		<link rel="stylesheet" type="text/css" href="css/mobile.css">
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<script src="scripts/main.js"></script>
	</head>
	<body>
		<div data-role="page" id="Home">
			<%@include file="Header.jsp"%>
			<div data-role="main" class="ui-content">
				<%@include file="Menu.jsp"%>
				<div id="content">
					<%@include file="Landing.jsp"%>
				</div>
			</div>
			<%@include file="Footer.jsp"%>
		</div>
	</body>
</html>

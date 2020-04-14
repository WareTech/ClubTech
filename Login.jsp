<%@include file="Utils.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="css/mobile.css">
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<script src="scripts/login.js"></script>
	</head>
	<body>
		<div data-role="header" data-position="fixed">
			<h1><%=APPLICATION_NAME%></h1>
		</div>
		<div data-role="popup" id="error">
			<p>Login invalido</p>
		</div>
		<div data-role="main" class="ui-content">
			<form id="login_form">
				<input type="text" name="username" id="username" placeholder="Username">
				<input type="password" name="password" id="password" placeholder="Password">
				<input type="button" value="Ingresar" onclick="javascript:login();">
			</form>
		</div>
		<div data-role="footer" data-position="fixed">
			<h1>Login</h1>
		</div>
		<div data-role="popup" id="error" data-overlay-theme="b">
		</div>
	</body>
</html>

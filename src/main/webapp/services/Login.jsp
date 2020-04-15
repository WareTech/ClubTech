<%
String username = request.getParameter("username");
String password = request.getParameter("password");

if (username != null && password != null && password.equals("password"))
{
	session.setAttribute("USER", username);
	out.print(1);
	return;
}

out.print(-1);
%>
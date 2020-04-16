<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.web.Utils" %><%
String username = request.getParameter("username");
String password = request.getParameter("password");

if (username != null && password != null && password.equals("password"))
{
	User user = new User();
	user.setUsername(username);
	Utils.setUser(request, response, user);
	out.print(1);
	return;
}

out.print(-1);
%>
<%@ page import="com.WareTech.ClubTech.Utils" %>
<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Context" %>

<%
String username = request.getParameter("username");
if (username == null || "".equals(username))
{
	out.print(-1);
	return;
}

String password = request.getParameter("password");
if (password == null || "".equals(password))
{
	out.print(-1);
	return;
}
User user = Context.getSecurityService().login(username, password);

if (user == null)
{
	out.print(-1);
	return;
}

Utils.setUser(request, response, user);
Utils.setUserCached(request, response, user.getToken());

out.print(1);
%>
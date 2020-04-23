<%@ page import="com.WareTech.ClubTech.Utils" %>
<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Context" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
User user = Context.getSecurityService().login(username, password);

if (user == null)
{
	out.print(-1);
	return;
}

Utils.setUser(request, response, user);
Utils.setUserCached(request, response, user.getId().toString());
out.print(1);
%>
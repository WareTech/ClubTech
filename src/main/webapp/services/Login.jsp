<%@ page import="com.WareTech.ClubTech.Utils" %>

<%
if (Utils.login(request, response) == null)
{
	out.print(-1);
	return;
}

out.print(1);
%>
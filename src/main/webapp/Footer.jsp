<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Utils" %>
<div data-role="footer" data-position="fixed">
	<h1>
<%
User user = Utils.getUser(request, response);
if (user == null)
{
%>
	<a href="javascript:goTo('Login.jsp');">Ingresar</a>
<%
}
else
{
%>
	<a href="javascript:goTo('UserProfile.jsp?<%=user.getId()%>');"><%=user.getUsername()%></a>
<%
}
%>
	</h1>
</div>

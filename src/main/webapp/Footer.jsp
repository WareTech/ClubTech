<%@ page import="com.WareTech.ClubTech.entity.User" %>
<div data-role="footer" data-position="fixed">
	<h1>
<%
User user = Utils.getUser(request, response);
if (user == null)
{
%>
	<a href="javascript:login();">Ingresar</a>
<%
} 
else 
{
	out.print(user.getUsername());
}
%>
	</h1>
</div>

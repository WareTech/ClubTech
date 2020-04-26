<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Database" %>

<%
String username = request.getParameter("username");
if (username == null || "".equals(username))
{
    out.print(-1);
    return;
}

User user = new User();
user.setUsername(username);
user.setPassword(username);

Database.getCurrentSession().save(user);

out.print(user.getId());
%>
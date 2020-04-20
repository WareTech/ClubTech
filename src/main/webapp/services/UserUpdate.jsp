<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Database" %>

<%
try
{
    String userId = request.getParameter("userId");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    User user = (User) Database.getCurrentSession().get(User.class, Long.parseLong(userId));
    user.setUsername(username);
    user.setPassword(password);
    Database.getCurrentSession().update(user);
    out.print(1);
}
catch(Exception exception)
{
    out.print(-1);
}
%>
<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.Base64" %>

<%
try
{
    String userId = request.getParameter("userId");
    String username = request.getParameter("username");
    String password1 = request.getParameter("password1");
    String password2 = request.getParameter("password2");

    if (!password1.equals(password2))
    {
        out.print(-1);
        return;
    }

    User user = (User) Database.getCurrentSession().get(User.class, Long.parseLong(userId));
    user.setUsername(username);
    user.setPassword(Base64.getEncoder().encodeToString(password1.getBytes()));
    Database.getCurrentSession().update(user);
    out.print(1);
}
catch(Exception exception)
{
    out.print(-1);
}
%>
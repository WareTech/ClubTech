<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.WareTech.ClubTech.entity.UserAccess" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Access" %>

<%
String userId = request.getParameter("userId");
if (userId == null || "".equals(userId))
{
    out.print(-1);
    return;
}

User user = (User) Database.getCurrentSession().get(User.class, Long.parseLong(userId));
if (user == null)
{
    out.print(-1);
    return;
}

String password1 = request.getParameter("password1");
String password2 = request.getParameter("password2");

if (!password1.equals(password2))
{
    out.print(-1);
    return;
}

user.setPassword(Base64.getEncoder().encodeToString(password1.getBytes()));

Database.getCurrentSession().update(user);

out.print(user.getId());
%>
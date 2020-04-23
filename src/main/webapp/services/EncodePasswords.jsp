<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>

<ul data-role="listview" data-inset="true" data-divider-theme="a">
<%
List<User> userList = Database.getCurrentSession().createCriteria(User.class).list();
for(User user : userList)
{
    user.setPassword(Base64.getEncoder().encodeToString(user.getPassword().getBytes()));
    Database.getCurrentSession().update(user);
%>
    <li data-icon="check"><%=user.getUsername()%></li>
<%
}
%>
</ul>


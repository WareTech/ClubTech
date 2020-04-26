<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Access" %>

<%
String value = request.getParameter("value");
if (value == null || "".equals(value))
{
    out.print(-1);
    return;
}

String description = request.getParameter("description");
if (description == null || "".equals(description))
{
    out.print(-1);
    return;
}
Access access = new Access();
access.setValue(value);
access.setDescription(description);

Database.getCurrentSession().save(access);

out.print(access.getId());
%>
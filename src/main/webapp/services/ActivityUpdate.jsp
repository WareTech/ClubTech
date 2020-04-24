<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Access" %>
<%@ page import="com.WareTech.ClubTech.entity.UserAccess" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>

<%
String activityId = request.getParameter("activityId");
if (activityId == null || "".equals(activityId))
{
    out.print(-1);
    return;
}

Parameter activity = (Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(activityId));
if (activity == null)
{
    out.print(-1);
    return;
}

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

activity.setValue(value);
activity.setDescription(description);

Database.getCurrentSession().update(activity);

out.print(activity.getId());
%>
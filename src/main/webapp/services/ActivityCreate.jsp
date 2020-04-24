<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>

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

Parameter parent = (Parameter) Database.getCurrentSession()
    .createQuery("FROM Parameter WHERE value = :activity")
    .setParameter("activity", Parameter.ACTIVITY)
    .uniqueResult();

Parameter activity = new Parameter();
activity.setValue(value);
activity.setDescription(description);
activity.setParent(parent);

Database.getCurrentSession().save(activity);

out.print(activity.getId());
%>
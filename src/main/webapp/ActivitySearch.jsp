<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="com.WareTech.ClubTech.Database" %>

<ul data-role="listview" data-inset="true">
    <li data-role="list-divider">Actividades</li>
<%
Parameter activity = (Parameter) Database.getCurrentSession()
        .createQuery("FROM Parameter activity WHERE value = :activity")
        .setParameter("activity", Parameter.ACTIVITY)
        .uniqueResult();
List<Parameter> activityList = Database.getCurrentSession()
        .createQuery("FROM Parameter WHERE parent = :activity ORDER BY position ASC")
        .setParameter("activity", activity)
        .list();
for (Parameter childActivity : activityList)
{
%>
    <li><a href="javascript:goTo('ActivityView.jsp?<%=childActivity.getId()%>');"><%=childActivity.getDescription()%></a></li>
<%
}
%>
</ul>

<button class="ui-btn ui-corner-all" onclick="javascript:goTo('ActivityCreate.jsp'); return;">Nueva Actividad</button>

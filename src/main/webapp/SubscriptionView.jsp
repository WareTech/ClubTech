<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>

<%
String periodId = request.getQueryString();
if (periodId == null || "".equals(periodId))
{
%>
<%@include file="Error.jsp"%>
<%
    return;
}

Parameter period = (Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(periodId));
if (period == null)
{
%>
<%@include file="Error.jsp"%>
<%
    return;
}
%>

<h3 class="ui-bar ui-bar-a ui-corner-all"><%=period.getDescription()%></h3>

<ul data-role="listview" data-inset="true" data-divider-theme="a">
<%
List<Parameter> activityList = Database.getCurrentSession()
    .createQuery(
        new StringBuffer()
            .append("SELECT child FROM Parameter child, Parameter parent")
            .append(" WHERE parent.value = :activity AND child.parent = parent")
            .append(" ORDER BY child.position ASC")
            .toString()
        )
    .setParameter("activity", Parameter.ACTIVITY)
    .list();

for (Parameter activity : activityList)
{
    Subscription subscription = (Subscription) Database.getCurrentSession()
        .createQuery("FROM Subscription WHERE period = :period AND activity = :activity")
        .setParameter("period", period)
        .setParameter("activity", activity)
        .uniqueResult();
%>
    <li data-role="list-divider"><%=activity.getDescription()%></li>
    <li><%=subscription == null ? "" : "$" + subscription.getAmount()%></li>
<%
}
%>
</ul>

<div class="ui-grid-a">
    <div class="ui-block-a">
        <button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionEdit.jsp?<%=period.getId()%>'); return;">Editar</button>
    </div>
    <div class="ui-block-b">
        <button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionSearch.jsp'); return;">Volver</button>
    </div>
</div>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>
<%@ page import="com.WareTech.ClubTech.service.ActivityService" %>

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
List<Parameter> activityList = ActivityService.toListWithoutRoot();

for (Parameter activity : activityList)
{
    Subscription subscription = (Subscription) Database.getCurrentSession()
        .createQuery("FROM Subscription WHERE period = :period AND activity = :activity")
        .setParameter("period", period)
        .setParameter("activity", activity)
        .uniqueResult();
    Long issuedCount = (Long) Database.getCurrentSession()
        .createQuery("SELECT COUNT(*) FROM Payment WHERE subscription = :subscription")
        .setParameter("subscription", subscription)
        .uniqueResult();
    Long payedCount = (Long) Database.getCurrentSession()
        .createQuery("SELECT COUNT(*) FROM Payment WHERE subscription = :subscription AND datetime IS NOT NULL")
        .setParameter("subscription", subscription)
        .uniqueResult();
%>
    <li data-role="list-divider">
        <div class="ui-grid-a">
            <div class="ui-block-a"><%=ActivityService.fullDescription(activity)%></div>
            <div class="ui-block-b"></div>
        </div>
    </li>
    <li>
        <div class="ui-grid-a">
            <div class="ui-block-a">Precio</div>
            <div class="ui-block-b"><%=subscription == null ? "" : "$" + subscription.getAmount()%></div>
        </div>
    </li>
    <li>
        <div class="ui-grid-a">
            <div class="ui-block-a">Emitidas</div>
            <div class="ui-block-b"><%=issuedCount%></div>
        </div>
    </li>
    <li>
        <div class="ui-grid-a">
            <div class="ui-block-a">Pagadas</div>
            <div class="ui-block-b"><%=payedCount%></div>
        </div>
    </li>
<%
}
%>
</ul>

<button class="ui-btn ui-corner-all" onclick="javascript:subscriptionIssue('<%=period.getId()%>'); return;">Emitir</button>

<div class="ui-grid-a">
    <div class="ui-block-a">
        <button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionEdit.jsp?<%=period.getId()%>'); return;">Editar</button>
    </div>
    <div class="ui-block-b">
        <button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionSearch.jsp'); return;">Volver</button>
    </div>
</div>
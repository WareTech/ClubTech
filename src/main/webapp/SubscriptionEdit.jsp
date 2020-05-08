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

<div data-role="popup" id="error">
    <p>Error al actualizar</p>
</div>

<div data-role="popup" id="success">
    <p>Per&iacute;odo actualizado</p>
</div>

<h3 class="ui-bar ui-bar-a ui-corner-all"><%=period.getDescription()%></h3>

<form id="subscription-update" onsubmit="return false;">

    <input type="hidden" name="periodId" value="<%=period.getId()%>">

    <div>
<%
List<Parameter> activityList = ActivityService.toListWithoutRoot();

for (Parameter activity : activityList)
{
    Subscription subscription = (Subscription) Database.getCurrentSession()
        .createQuery("FROM Subscription WHERE period = :period AND activity = :activity")
        .setParameter("period", period)
        .setParameter("activity", activity)
        .uniqueResult();

%>
        <label><%=ActivityService.fullDescription(activity)%></label>
        <input type="number" name="activity-<%=activity.getId()%>" id="activity-<%=activity.getId()%>" value="<%=subscription != null ? subscription.getAmount() : ""%>">
<%
}
%>
    </div>

    <br>
    <div class="ui-grid-a">
        <div class="ui-block-a">
            <button class="ui-btn ui-corner-all" onclick="javascript:subscriptionUpdate(); return;">Guardar</button>
        </div>
        <div class="ui-block-b">
            <button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionSearch.jsp'); return;">Cancelar</button>
        </div>
    </div>
</form>

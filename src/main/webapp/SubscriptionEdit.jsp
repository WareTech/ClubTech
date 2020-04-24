<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.List" %>
<div>
    <form action="#" method="get">
        <h2>Cuotas</h2>

        <div id="subscription-period-panel">
            <label for="subscription-period">Periodo:/label>
            <select name="subscription-period" id="subscription-period" onchange="javascript:subscriptionPeriodChanged();">
<%
for (String period : new String[]{"2020 Anual", "2020 Enero", "2020 Febrero", "2020 Marzo"})
{
%>
                <option value="<%=period%>"><%=period%></option>
<%
}
%>
            </select>
        </div>

        <div id="subscription-edit-period-amount-panel">
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
            <label><%=childActivity.getDescription()%></label>
            <input type="text" name="activity-<%=childActivity.getId()%>" id="activity-<%=childActivity.getId()%>" value="">
<%
}
%>
            <button class="ui-btn">Guardar</button>
        </div>
    </form>
</div>
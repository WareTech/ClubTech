<%@ page import="com.WareTech.ClubTech.facade.ActivityFacade" %>
<%@ page import="com.WareTech.ClubTech.facade.PeriodFacade" %>
<div>
    <form action="#" method="get">
        <h2>Cuotas</h2>

        <div id="subscription-period-panel">
            <label for="subscription-period">Periodo:</label>
            <select name="subscription-period" id="subscription-period" onchange="javascript:subscriptionPeriodChanged();">
<%
for (String period : PeriodFacade.getPeriodList())
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
for (String activity : ActivityFacade.getActivityList())
{
%>
            <label for="subscription-edit-period-<%=activity%>-amount"><%=activity%>:</label>
            <input type="text" name="subscription-edit-period-<%=activity%>-amount" id="subscription-edit-period-<%=activity%>-amount" value="">
<%
}
%>
            <button class="ui-btn">Guardar</button>
        </div>
    </form>
</div>
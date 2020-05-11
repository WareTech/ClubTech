<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>
<%@ page import="com.WareTech.ClubTech.service.ActivityService" %>
<%@ page import="com.WareTech.ClubTech.Context" %>

<div data-role="popup" id="error">
    <p>Error al crear</p>
</div>

<div data-role="popup" id="success">
    <p>Per&iacute;odo creado</p>
</div>

<h3 class="ui-bar ui-bar-a ui-corner-all">Nuevo Per&iacute;odo</h3>

<form id="subscription-update" onsubmit="return false;">

    <div class="ui-grid-a">
        <div class="ui-block-a">
            <select name="year">
<%
for(int year = 2020; year < 2030; year++)
{
%>
                <option value="<%=year%>"><%=year%></option>
<%
}
%>
            </select>
        </div>
        <div class="ui-block-b">
            <select name="month">
                <option value="<%=Parameter.PERIOD_YEARLY%>"><%=Parameter.PERIOD_YEARLY%></option>
<%
    for(String month : Context.MONTH)
    {
%>
            <option value="<%=month%>"><%=month%></option>
<%
    }
%>
            </select>
        </div>
    </div>
    <br>
    <div class="ui-grid-a">
        <div class="ui-block-a">
            <button class="ui-btn ui-corner-all" onclick="javascript:subscriptionCreate(); return;">Crear</button>
        </div>
        <div class="ui-block-b">
            <button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionSearch.jsp'); return;">Volver</button>
        </div>
    </div>
</form>

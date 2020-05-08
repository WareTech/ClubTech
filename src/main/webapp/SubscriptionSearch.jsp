<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="com.WareTech.ClubTech.service.PeriodService" %>

<h3 class="ui-bar ui-bar-a ui-corner-all">Per&iacute;odos</h3>

<div>
	<ul data-role="listview" data-inset="true">
<%
List<Parameter> periodList = PeriodService.toList();

for(Parameter period : periodList)
{
%>
	<li><a href="javascript:goTo('SubscriptionView.jsp?<%=period.getId()%>');"><%=period.getDescription()%></a></li>
<%
}
%>
	</ul>
</div>

<button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionCreate.jsp'); return;">Nuevo Per&iacute;odo</button>

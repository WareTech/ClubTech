<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>

<h3 class="ui-bar ui-bar-a ui-corner-all">Per&iacute;odos</h3>

<div>
	<ul data-role="listview" data-inset="true">
<%
List<Parameter> periodList = Database.getCurrentSession()
	.createQuery(
		new StringBuffer()
			.append("SELECT child FROM Parameter child, Parameter parent")
			.append(" WHERE parent.value = :period AND child.parent = parent")
			.append(" ORDER BY child.position ASC")
			.toString()
	)
	.setParameter("period", Parameter.PERIOD)
	.list();

for(Parameter parameter : periodList)
{
%>
	<li><a href="javascript:goTo('SubscriptionView.jsp?<%=parameter.getId()%>');"><%=parameter.getDescription()%></a></li>
<%
}
%>
	</ul>
</div>

<button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionCreate.jsp'); return;">Nuevo Per&iacute;odo</button>

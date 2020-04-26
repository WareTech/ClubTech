<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>

<%
String filter = request.getQueryString();
if (filter == null)
{
	filter = "";
}
filter = filter.trim().toLowerCase();
%>
<div data-role="popup" id="error">
	<p>Busq&uacute;eda no v&aacute;lida</p>
</div>

<div>
	<label>Buscar cuota</label>
	<input type="text" name="subscription-filter" id="subscription-filter" value="<%=filter%>">
	<button class="ui-btn ui-corner-all" onclick="javascript:subscriptionSearch(); return;">Buscar</button>
</div>

<div>
	<ul data-role="listview" data-inset="true">
<%
if (!"".equals(filter))
{
	List<Parameter> periodList = Database.getCurrentSession()
		.createQuery(
			new StringBuffer()
				.append("SELECT child FROM Parameter child, Parameter parent")
				.append(" WHERE parent.value = :period AND child.parent = parent AND child.description LIKE :description")
				.append(" ORDER BY child.position ASC")
				.toString()
		)
		.setParameter("period", Parameter.PERIOD)
		.setParameter("description", "%" + filter + "%")
		.list();

	for(Parameter parameter : periodList)
	{
%>
		<li><a href="javascript:goTo('SubscriptionView.jsp?<%=parameter.getId()%>');"><%=parameter.getDescription()%></a></li>
<%
	}
}
%>
	</ul>
</div>

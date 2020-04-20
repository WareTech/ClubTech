<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.facade.MemberFacade" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>

<%
String filter = request.getQueryString();
if (filter == null)
{
	filter = "";
}
filter = filter.trim().toLowerCase();
%>
<div>
	<h3>Pagar cuota</h3>

	<div data-role="popup" id="error">
		<p>Busq&uacute;eda no v&aacute;lida</p>
	</div>

	<div id="subscription-create-member-panel">
		<label for="subscription-create-member">Socio:</label>
		<input type="text" name="subscription-create-member" id="subscription-create-member" value="<%=filter%>">
		<button class="ui-btn ui-corner-all" id="subscription-create-member-serach" onclick="javascript:subscriptionCreateSearchMember(); return;">Buscar</button>
	</div>

	<div id="subscription-create-member-list-panel">
		<ul data-role="listview" data-inset="true">
<%
if (!"".equals(filter))
{
	List<Member> memberList = MemberFacade.filter(filter);
	for(Member member : memberList)
	{
%>
			<li><a href="javascript:goTo('SubscriptionCreatePeriod.jsp?<%=member.getId()%>');"><%=member.getFirstname() + " " + member.getLastname()%></a></li>
<%
	}
}
%>
		</ul>
	</div>
</div>

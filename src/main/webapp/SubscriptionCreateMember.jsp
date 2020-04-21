<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.facade.MemberFacade" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Database" %>

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
	filter = "%" + filter + "%";
	List<Member> memberList = Database.getCurrentSession()
			.createQuery("FROM Member WHERE firstname LIKE :firstname OR lastname LIKE :lastname OR dni LIKE :dni")
			.setParameter("firstname", filter)
			.setParameter("lastname", filter)
			.setParameter("dni", filter)
			.list();
	for(Member member : memberList)
	{
%>
			<li>
				<a href="javascript:goTo('SubscriptionCreatePeriod.jsp?<%=member.getId()%>');">
				<%=member.getFirstname()%>&nbsp;<%=member.getLastname()%>&nbsp;(<%=member.getDni()%>)
				</a>
			</li>
<%
	}
}
%>
		</ul>
	</div>
</div>

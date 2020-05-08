<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.service.MemberService" %>

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
	<h3 class="ui-bar ui-bar-a ui-corner-all">Pagos</h3>

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
			.createQuery("FROM Member WHERE firstname LIKE :firstname OR lastname LIKE :lastname OR dni LIKE :dni ORDER BY firstname ASC, lastname ASC")
			.setParameter("firstname", filter)
			.setParameter("lastname", filter)
			.setParameter("dni", filter)
			.list();
	for(Member member : memberList)
	{
%>
			<li>
				<a href="javascript:goTo('PaymentCreateSubscription.jsp?<%=member.getId()%>');">
				<%=MemberService.fullDescription(member)%>
				</a>
			</li>
<%
	}
}
%>
		</ul>
	</div>
</div>

<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.facade.MemberFacade" %>
<%
String id = request.getQueryString();
if (id == null)
{
%>
<%@include file="Error.jsp"%>
<%
	return;
}

Member member = MemberFacade.find(Long.parseLong(id));
%>
<div>
	<h3>Pagar cuota</h3>

	<div id="subscription-create-member-panel">
		<label for="subscription-create-member">Socio:</label>
		<input type="text" name="subscription-create-member" id="subscription-create-member" value="<%=member.getFirstname() + " " + member.getLastname()%>" readonly="true">
		<button class="ui-btn ui-corner-all" id="subscription-create-member-serach" onclick="javascript:goTo('SubscriptionCreateMember.jsp'); return;">Buscar</button>
	</div>

	<div id="subscription-create-member-list-panel">
		<label>Cuota:</label>
		<ul data-role="listview" data-inset="true">
			<li><a href="javascript:goTo('SubscriptionCreateConfirm.jsp');">2020 Anual ($5.000)</a></li>
			<li><a href="javascript:goTo('SubscriptionCreateConfirm.jsp');">2020 Enero ($500)</a></li>
		</ul>
		<input type="text" name="subscription-create-period-custom-amount" id="subscription-create-period-custom-amount" placeholder="Ingrese un monto..." value="" style="text-align: right;">
		<button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionCreateConfirm.jsp');; return;">Pagar</button>
	</div>
</div>

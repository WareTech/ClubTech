<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>

<%
String memberId = request.getParameter("member");
if (memberId == null || "".equals(memberId))
{
%>
<%@include file="Error.jsp"%>
<%
		return;
}

Member member = (Member) Database.getCurrentSession().get(Member.class, Long.parseLong(memberId));
if (member == null)
{
%>
<%@include file="Error.jsp"%>
<%
		return;
}

String subscriptionId = request.getParameter("subscription");
if (subscriptionId == null || "".equals(subscriptionId))
{
%>
<%@include file="Error.jsp"%>
<%
		return;
}

Subscription subscription = (Subscription) Database.getCurrentSession().get(Subscription.class, Long.parseLong(subscriptionId));
if (subscription == null)
{
%>
<%@include file="Error.jsp"%>
<%
		return;
}

String amount = request.getParameter("amount");
if (amount == null || "".equals(amount))
{
	amount = subscription.getAmount().toString();
}
%>

<h3 class="ui-bar ui-bar-a ui-corner-all">Pagos</h3>
<form id="payment">
	<input type="hidden" name="member" value="<%=member.getId()%>">
	<input type="hidden" name="subscription" value="<%=subscription.getId()%>">
	<input type="hidden" name="amount" value="<%=amount%>">
</form>
<ul data-role="listview" data-inset="true" data-divider-theme="a">
	<li data-role="list-divider">Socio</li>
	<li><%=member.getFirstname() + " " + member.getLastname() + (member.getDni() == null ? "" : " (" + member.getDni() + ")")%></li>
	<li data-role="list-divider">Actividad</li>
	<li><%=subscription.getActivity().getDescription()%></li>
	<li data-role="list-divider">Cuota</li>
	<li><%=subscription.getPeriod().getDescription()%></li>
	<li data-role="list-divider">Monto</li>
	<li>$<%=amount%></li>
</ul>
<button class="ui-btn ui-corner-all" id="subscription-create-member-serach" onclick="javascript:paymentCreate(); return;">Confirmar Pago</button>

<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>
<%@ page import="com.WareTech.ClubTech.service.ActivityService" %>
<%@ page import="com.WareTech.ClubTech.service.MemberService" %>
<%@ page import="com.WareTech.ClubTech.entity.Payment" %>

<%
String paymentId = request.getQueryString();
if (paymentId == null || "".equals(paymentId))
{
%>
<%@include file="Error.jsp"%>
<%
		return;
}

Payment payment = (Payment) Database.getCurrentSession().get(Payment.class, Long.parseLong(paymentId));
if (payment == null)
{
%>
<%@include file="Error.jsp"%>
<%
		return;
}

String amount = request.getParameter("amount");
if (amount == null || "".equals(amount))
{
	amount = payment.getAmount().toString();
}
%>

<h3 class="ui-bar ui-bar-a ui-corner-all">Pagos</h3>
<form id="payment">
	<input type="hidden" name="payment" value="<%=payment.getId()%>">
	<input type="hidden" name="amount" value="<%=amount%>">
</form>
<ul data-role="listview" data-inset="true" data-divider-theme="a">
	<li data-role="list-divider">Socio</li>
	<li><%=MemberService.fullDescription(payment.getMember())%></li>
	<li data-role="list-divider">Actividad</li>
	<li><%=ActivityService.fullDescription(payment.getSubscription().getActivity())%></li>
	<li data-role="list-divider">Descuento</li>
	<li><%=payment.getMember().getDiscount().getDescription()%></li>
	<li data-role="list-divider">Cuota</li>
	<li><%=payment.getSubscription().getPeriod().getDescription()%></li>
	<li data-role="list-divider">Monto</li>
	<li>$<%=amount%></li>
</ul>
<button class="ui-btn ui-corner-all" id="subscription-create-member-serach" onclick="javascript:paymentCreate(); return;">Confirmar Pago</button>

<%@ page import="com.WareTech.ClubTech.entity.Payment" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.Context" %>

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
if (payment == null || "".equals(payment))
{
%>
<%@include file="Error.jsp"%>
<%
return;
}
%>

<h3 class="ui-bar ui-bar-a ui-corner-all">Pagos</h3>

<ul data-role="listview" data-inset="true" data-divider-theme="a">
	<li data-role="list-divider">Socio</li>
	<li><%=payment.getMember().getFirstname() + " " + payment.getMember().getLastname() + (payment.getMember().getDni() == null ? "" : " (" + payment.getMember().getDni() + ")")%></li>
	<li data-role="list-divider">Actividad</li>
	<li><%=payment.getSubscription().getActivity().getDescription()%></li>
	<li data-role="list-divider">Cuota</li>
	<li><%=payment.getSubscription().getPeriod().getDescription()%></li>
	<li data-role="list-divider">Monto</li>
	<li>$<%=payment.getAmount()%></li>
	<li data-role="list-divider">Fecha</li>
	<li><%=Context.DATE_TIME_FORMATER.format(Payment.DATE_TIME_FORMATER.parse(payment.getDatetime()))%></li>
	<li data-role="list-divider">Comprobante</li>
	<li><%=payment.getId()%></li>
	<li data-role="list-divider">Autoridad</li>
	<li><%=payment.getUser().getUsername()%></li>
</ul>

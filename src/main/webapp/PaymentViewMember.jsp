<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Payment" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Context" %>
<%@ page import="com.WareTech.ClubTech.Utils" %>


<%
String memberId = request.getQueryString();
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
%>

<h3 class="ui-bar ui-bar-a ui-corner-all">Pagos</h3>

<div>
	<ul data-role="listview" data-inset="true">
<%
List<Payment> paymentList = Database.getCurrentSession()
	.createQuery("FROM Payment p WHERE p.member = :member ORDER BY datetime ASC")
	.setParameter("member", member)
	.list();

for(Payment payment : paymentList)
{
%>
	<li>
		<a href="javascript:goTo('PaymentView.jsp?<%=payment.getId()%>');">
			<%=payment.getSubscription().getPeriod().getDescription()%>
			/
			<%=payment.getSubscription().getActivity().getDescription()%>
			/
			$<%=payment.getAmount()%>
		</a>
	</li>
<%
}
%>
	</ul>
</div>

<button class="ui-btn ui-corner-all" onclick="javascript:goTo('PaymentSearch.jsp'); return;">Volver</button>

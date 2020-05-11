<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.WareTech.ClubTech.service.ActivityService" %>
<%@ page import="com.WareTech.ClubTech.service.MemberService" %>
<%@ page import="com.WareTech.ClubTech.entity.Payment" %>
<%
String memberId = request.getQueryString();
if (memberId == null)
{
%>
<%@include file="Error.jsp"%>
<%
	return;
}

Member member = (Member) Database.getCurrentSession().get(Member.class, Long.parseLong(memberId));
%>
<div>
	<h3 class="ui-bar ui-bar-a ui-corner-all">Pagos</h3>

	<ul data-role="listview" data-inset="true" data-divider-theme="a">
		<li data-role="list-divider">Socio</li>
		<li><%=MemberService.fullDescription(member)%></li>
		<li data-role="list-divider">Actividad</li>
		<li><%=ActivityService.fullDescription(member.getActivity())%></li>
		<li data-role="list-divider">Descuento</li>
		<li><%=member.getDiscount().getDescription()%></li>
		<li data-role="list-divider">Per&iacute;odo</li>
<%
List<Payment> paymentList = Database.getCurrentSession()
	.createQuery("FROM Payment p WHERE p.member = :member ORDER BY subscription")
	.setParameter("member", member)
	.list();

for(Payment payment : paymentList)
{
	if (payment.getDatetime() == null)
	{
%>
		<li>
			<a href="javascript:goTo('PaymentCreateConfirm.jsp?<%=payment.getId()%>');">
				<%=payment.getSubscription().getPeriod().getDescription()%>&nbsp;($<%=payment.getAmount()%>)
			</a>
		</li>
<%
	}
	else
	{
%>
		<li data-icon="check">
			<a href="javascript:goTo('PaymentView.jsp?<%=payment.getId()%>');">
				<%=payment.getSubscription().getPeriod().getDescription()%>&nbsp;($<%=payment.getAmount()%>)
			</a>
		</li>
<%
	}
}

if (paymentList.size() == 0)
{
%>
		<li>No hay cuotas a pagar</li>
<%
}
%>
	</ul>
	<div>
		<button class="ui-btn ui-corner-all" id="subscription-create-member-serach" onclick="javascript:goTo('PaymentCreateMember.jsp'); return;">Cancelar</button>
	</div>
</div>

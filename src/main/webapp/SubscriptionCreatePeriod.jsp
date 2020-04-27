<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>
<%@ page import="java.util.List" %>
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
		<li><%=member.getFirstname() + " " + member.getLastname() + (member.getDni() == null ? "" : " (" + member.getDni() + ")")%></li>
		<li data-role="list-divider">Actividad</li>
		<li><%=member.getActivity().getDescription()%></li>
		<li data-role="list-divider">Per&iacute;odo</li>
<%
List<Subscription> subscriptionList = Database.getCurrentSession()
	.createQuery("FROM Subscription WHERE activity = :activity ORDER BY period.position ASC")
	.setParameter("activity", member.getActivity())
	.list();
for(Subscription subscription : subscriptionList)
{
%>
		<li>
			<a href="javascript:goTo('SubscriptionCreateConfirm.jsp?member=<%=member.getId()%>&subscription=<%=subscription.getId()%>');">
				<%=subscription.getPeriod().getDescription()%>&nbsp;($<%=subscription.getAmount()%>)
			</a>
		</li>
<%
}
%>
	</ul>
	<div>
		<input type="text" name="amount" placeholder="Ingrese un monto..." value="" style="text-align: right;">
		<button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionCreateConfirm.jsp');; return;">Pagar</button>
		<button class="ui-btn ui-corner-all" id="subscription-create-member-serach" onclick="javascript:goTo('SubscriptionCreateMember.jsp'); return;">Cancelar</button>
	</div>
</div>

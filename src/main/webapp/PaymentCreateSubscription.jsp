<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="java.util.ArrayList" %>
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
<%
String string = "";
for (Parameter activity = member.getActivity(); activity.getParent() != null; activity = activity.getParent())
{
	if (string.length() > 0)
	{
		string = " " + string;
	}
	string = activity.getDescription() + string;
}
%>
		<li><%=string%></li>
		<li data-role="list-divider">Per&iacute;odo</li>
<%
List<Subscription> subscriptionList = new ArrayList<>();
for (Parameter activity = member.getActivity(); activity != null; activity = activity.getParent())
{
	subscriptionList = Database.getCurrentSession()
			.createQuery("FROM Subscription WHERE activity = :activity ORDER BY period.position ASC")
			.setParameter("activity", activity)
			.list();
	if (subscriptionList.size() > 0)
	{
		break;
	}
}

for(Subscription subscription : subscriptionList)
{
%>
		<li>
			<a href="javascript:goTo('PaymentCreateConfirm.jsp?member=<%=member.getId()%>&subscription=<%=subscription.getId()%>');">
				<%=subscription.getPeriod().getDescription()%>&nbsp;($<%=subscription.getAmount()%>)
			</a>
		</li>
<%
}
%>
	</ul>
	<div>
		<input type="text" name="amount" placeholder="Ingrese un monto..." value="" style="text-align: right;">
		<button class="ui-btn ui-corner-all" onclick="javascript:goTo('PaymentCreateConfirm.jsp');; return;">Pagar</button>
		<button class="ui-btn ui-corner-all" id="subscription-create-member-serach" onclick="javascript:goTo('PaymentCreateMember.jsp'); return;">Cancelar</button>
	</div>
</div>

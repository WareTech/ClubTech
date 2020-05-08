<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.Utils" %>
<%@ page import="com.WareTech.ClubTech.entity.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.WareTech.ClubTech.service.ActivityService" %>

<%
String periodId = request.getQueryString();
if (periodId == null || "".equals(periodId))
{
%>
<%@include file="Error.jsp"%>
<%
    return;
}

Parameter period = (Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(periodId));
if (period == null)
{
%>
<%@include file="Error.jsp"%>
<%
    return;
}
%>

<h3 class="ui-bar ui-bar-a ui-corner-all"><%=period.getDescription()%></h3>

<ul data-role="listview" data-inset="true" data-divider-theme="a">
<%
User user = Utils.getUser(request, response);
List<Parameter> activityList = ActivityService.toListWithoutRoot();
String datetime = Payment.DATE_TIME_FORMATTER.format(new Date());

for (Parameter activity : activityList)
{
    Subscription subscription = (Subscription) Database.getCurrentSession()
            .createQuery("FROM Subscription WHERE period = :period AND activity = :activity")
            .setParameter("period", period)
            .setParameter("activity", activity)
            .uniqueResult();

    List<Member> memberList = Database.getCurrentSession()
            .createQuery("FROM Member WHERE activity = :activity")
            .setParameter("activity", activity)
            .list();

    for (Member member : memberList)
    {
        Payment payment = new Payment();
        payment.setSubscription(subscription);
        payment.setMember(member);

        Integer amount = subscription.getAmount();
        Parameter discount = member.getDiscount();
        if (discount != null)
        {
            Integer value = Integer.valueOf(discount.getValue().substring(Parameter.DISCOUNT.length() + 1));
            amount = amount * (100 - value) / 100;
        }
        payment.setAmount(amount);

        payment.setUser(user);
        payment.setDatetime(datetime);

        Database.getCurrentSession().save(payment);
    }
}
%>
</ul>

<button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionIssue.jsp?<%=period.getId()%>'); return;">Emitir</button>

<div class="ui-grid-a">
    <div class="ui-block-a">
        <button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionEdit.jsp?<%=period.getId()%>'); return;">Editar</button>
    </div>
    <div class="ui-block-b">
        <button class="ui-btn ui-corner-all" onclick="javascript:goTo('SubscriptionSearch.jsp'); return;">Volver</button>
    </div>
</div>
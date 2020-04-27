<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>
<%@ page import="com.WareTech.ClubTech.entity.Payment" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.WareTech.ClubTech.Utils" %>

<%
String memberId = request.getParameter("member");
if (memberId == null || "".equals(memberId))
{
    out.print(-1);
    return;
}

Member member = (Member) Database.getCurrentSession().get(Member.class, Long.parseLong(memberId));
if (member == null)
{
    out.print(-1);
    return;
}

String subscriptionId = request.getParameter("subscription");
if (subscriptionId == null || "".equals(subscriptionId))
{
    out.print(-1);
    return;
}

Subscription subscription = (Subscription) Database.getCurrentSession().get(Subscription.class, Long.parseLong(subscriptionId));
if (subscription == null)
{
    out.print(-1);
    return;
}

String amount = request.getParameter("amount");
if (amount == null || "".equals(amount))
{
    out.print(-1);
    return;
}

Payment payment = new Payment();
payment.setMember(member);
payment.setSubscription(subscription);
payment.setAmount(Integer.parseInt(amount));
payment.setDatetime(Payment.DATE_TIME_FORMATER.format(new Date()));
payment.setUser(Utils.getUser(request, response));
Database.getCurrentSession().save(payment);

out.print(payment.getId());
%>
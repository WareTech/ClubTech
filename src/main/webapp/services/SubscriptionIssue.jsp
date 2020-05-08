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
    out.print(-1);
    return;
}

Parameter period = (Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(periodId));
if (period == null)
{
    out.print(-1);
    return;
}

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

        Database.getCurrentSession().save(payment);
    }
}

out.print(periodId);
%>

<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.*" %>
<%@ page import="com.WareTech.ClubTech.service.ActivityService" %>

<%
String periodId = request.getParameter("periodId");
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

List<Parameter> activityList = ActivityService.toList();
for(Parameter activity : activityList)
{
    String amount = request.getParameter("activity-" + activity.getId());
    Subscription subscription = (Subscription) Database.getCurrentSession()
        .createQuery("FROM Subscription WHERE period = :period AND activity = :activity")
        .setParameter("period", period)
        .setParameter("activity", activity)
        .uniqueResult();

    if (subscription == null && (amount == null || "".equals(amount)))
    {
        continue;
    }

    if (subscription == null && (amount != null && !"".equals(amount)))
    {
        subscription = new Subscription();
        subscription.setPeriod(period);
        subscription.setActivity(activity);
        subscription.setAmount(Integer.parseInt(amount));
        Database.getCurrentSession().save(subscription);
        continue;
    }

    if (subscription != null && (amount != null && !"".equals(amount)))
    {
        subscription.setAmount(Integer.parseInt(amount));
        Database.getCurrentSession().update(subscription);
        continue;
    }

    if (subscription != null && (amount == null || "".equals(amount)))
    {
        Database.getCurrentSession().delete(subscription);
        continue;
    }
}

out.print(period.getId());
%>
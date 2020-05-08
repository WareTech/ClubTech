<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.entity.Subscription" %>
<%@ page import="com.WareTech.ClubTech.entity.Payment" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.WareTech.ClubTech.Utils" %>

<%
String paymentId = request.getParameter("payment");
if (paymentId == null || "".equals(paymentId))
{
    out.print(-1);
    return;
}

Payment payment = (Payment) Database.getCurrentSession().get(Payment.class, Long.parseLong(paymentId));
if (payment == null)
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

payment.setDatetime(Payment.DATE_TIME_FORMATTER.format(new Date()));
payment.setUser(Utils.getUser(request, response));
Database.getCurrentSession().update(payment);

out.print(payment.getId());
%>
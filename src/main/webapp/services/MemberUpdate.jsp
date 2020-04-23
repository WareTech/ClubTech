<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Database" %>

<%
String memberId = request.getParameter("member-id");
if (memberId == null || memberId.equals(""))
{
    out.print(-1);
}

Member member = (Member) Database.getCurrentSession().get(Member.class, Long.parseLong(memberId));
if (member == null)
{
    out.print(-1);
}

String firstname = request.getParameter("firstname");
member.setFirstname(firstname);

String lastname = request.getParameter("lastname");
member.setLastname(lastname);

String dni = request.getParameter("dni");
if (dni != null && !dni.equals("")) {
    member.setDni(dni);
}
String birthdayDay = request.getParameter("birthday-day");
String birthdayMonth = request.getParameter("birthday-month");
String birthdayYear = request.getParameter("birthday-year");
member.setBirthday(birthdayYear + (birthdayMonth.length() == 1 ? "0" : "") + birthdayMonth + (birthdayDay.length() == 1 ? "0" : "") + birthdayDay);

String phone = request.getParameter("phone");
if (phone != null && !phone.equals("")) {
    member.setPhone(phone);
}

String address = request.getParameter("address");
if (address != null && !address.equals("")) {
    member.setAddress(address);
}

String email = request.getParameter("email");
if (email != null && !email.equals("")) {
    member.setEmail(email);
}

String father = request.getParameter("father-info");
if (father != null && !father.equals("")) {
    member.setFather(father);
}

String mother = request.getParameter("mother-info");
if (mother != null && !mother.equals("")) {
    member.setMother(mother);
}

String paymentType = request.getParameter("payment-type");
if (paymentType != null && !paymentType.equals("")) {
    member.setPaymentType((Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(paymentType)));
}

String discount = request.getParameter("discount");
if (discount != null && !discount.equals("")) {
    member.setDiscount((Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(discount)));
}

String activity = request.getParameter("activity");
if (activity != null && !activity.equals("")) {
    member.setActivity((Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(activity)));
}

String status = request.getParameter("status");
if (status != null && !status.equals("")) {
    member.setStatus((Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(status)));
}

String note = request.getParameter("note");
if (note != null && !note.equals("")) {
    member.setNote(note);
}

Database.getCurrentSession().update(member);
out.print(1);
%>
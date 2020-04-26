<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.Context" %>

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

<div data-role="popup" id="error">
    <p>Error al actualziar el socio</p>
</div>

<div data-role="popup" id="success">
    <p>Socio actualizado con &eacute;xito</p>
</div>

<h3 class="ui-bar ui-bar-a ui-corner-all">Socios</h3>

<form data-role="tabs" id="member-edit" onsubmit="return false;">

    <input type="hidden" name="member-id" id="member-id" value="<%=member.getId()%>">

    <div data-role="navbar">
        <ul>
            <li><a href="#personal" data-ajax="false" class="ui-btn-active">Info</a></li>
            <li><a href="#contact" data-ajax="false">Contacto</a></li>
            <li><a href="#payment" data-ajax="false">Pago</a></li>
            <li><a href="#note" data-ajax="false">Nota</a></li>
        </ul>
    </div>

    <div id="personal">
        <br>

        <label for="member-update-firstname">Nombre</label>
        <input type="text" name="firstname" id="member-update-firstname" value="<%=member.getFirstname()%>">

        <label for="member-update-lastname">Apellido</label>
        <input type="text" name="lastname" id="member-update-lastname" value="<%=member.getLastname()%>">

        <label for="member-update-birthday">Fecha de Nacimiento</label>
        <div class="ui-grid-b" id="member-update-birthday">
            <div class="ui-block-a">
                <select data-mini="true" name="birthday-day">
                    <%Integer birthdayDay = member.getBirthday() == null ? null : Integer.parseInt(member.getBirthdayDay());%>
                    <%for(int day = 1; day < 32; day++){%>
                    <option value="<%=day%>" <%=birthdayDay != null && birthdayDay == day ? "selected" : ""%>><%=day%></option>
                    <%}%>
                </select>
            </div>
            <div class="ui-block-b">
                <select data-mini="true" name="birthday-month">
                    <%Integer birthdayMonth = member.getBirthday() == null ? null : Integer.parseInt(member.getBirthdayMonth());%>
                    <%for(int month = 1; month < 13; month++){%>
                    <option value="<%=month%>"<%=birthdayMonth != null && birthdayMonth == month ? "selected" : ""%>><%=Context.MONTH[month - 1]%></option>
                    <%}%>
                </select>
            </div>
            <div class="ui-block-c">
                <select data-mini="true" name="birthday-year">
                    <%Integer birthdayYear = member.getBirthday() == null ? 2000 : Integer.parseInt(member.getBirthdayYear());%>
                    <%for(int year = 1920; year < 2021; year++){%>
                    <option value="<%=year%>"<%=birthdayYear != null && birthdayYear == year ? "selected" : ""%>><%=year%></option>
                    <%}%>
                </select>
            </div>
        </div>

        <label for="member-update-dni">DNI:</label>
        <input type="number" name="dni" id="member-update-dni" pattern="[0-9]*" value="<%=member.getDni() == null ? "" : member.getDni()%>">
    </div>

    <div id="contact">
        <br>

        <label for="member-update-phone">Tel&eacute;fono:</label>
        <input type="number" name="phone" id="member-update-phone" value="<%=member.getPhone() == null ? "" : member.getPhone()%>">

        <label for="member-update-address">Direcci&oacute;n:</label>
        <input type="text" name="address" id="member-update-address" value="<%=member.getAddress() == null ? "" : member.getAddress()%>">

        <label for="member-update-email">eMail:</label>
        <input type="text" name="email" id="member-update-email" value="<%=member.getEmail() == null ? "" : member.getEmail()%>">

        <label for="member-update-father-info">Nombre y Apellido del Padre:</label>
        <input type="text" name="father-info" id="member-update-father-info" value="<%=member.getFather() == null ? "" : member.getFather()%>">

        <label for="member-update-mother-info">Nombre y Apellido de la Madre:</label>
        <input type="text" name="mother-info" id="member-update-mother-info" value="<%=member.getMother() == null ? "" : member.getMother()%>">
    </div>

    <div id="payment">
        <br>

<%
Parameter paymentType = (Parameter) Database.getCurrentSession()
    .createQuery("FROM Parameter WHERE value = :value")
    .setParameter("value", Parameter.PAYMENT_TYPE)
    .uniqueResult();

if (paymentType != null)
{
%>
        <label for="member-update-payement-method"><%=paymentType.getDescription()%></label>
        <select name="payement-method" id="member-update-payement-method">
<%
List<Parameter> paymentTypeList = Database.getCurrentSession()
    .createQuery("FROM Parameter WHERE parent = :parent ORDER BY position ASC")
    .setParameter("parent", paymentType)
    .list();

    for(Parameter childPaymentType : paymentTypeList)
    {
%>
            <option value="<%=childPaymentType.getId()%>" <%=childPaymentType.getId() == member.getPaymentType().getId() ? "selected" : ""%>><%=childPaymentType.getDescription()%></option>
<%
    }
%>
        </select>
<%
}
%>

<%
Parameter discount = (Parameter) Database.getCurrentSession().createQuery("FROM Parameter WHERE value = :value")
        .setParameter("value", Parameter.DISCOUNT)
        .uniqueResult();

if (paymentType != null)
{
%>
        <label for="member-update-discount"><%=discount.getDescription()%></label>
        <select name="discount" id="member-update-discount">
<%
List<Parameter> discountList = Database.getCurrentSession()
        .createQuery("FROM Parameter WHERE parent = :parent ORDER BY position ASC")
        .setParameter("parent", discount)
        .list();
    for(Parameter childDiscount : discountList)
    {
%>
            <option value="<%=childDiscount.getId()%>" <%=childDiscount.getId() == member.getDiscount().getId() ? "selected" : ""%>><%=childDiscount.getDescription()%></option>
<%
    }
%>
        </select>
<%
}
%>

<%
Parameter activity = (Parameter) Database.getCurrentSession()
        .createQuery("FROM Parameter WHERE value = :value")
        .setParameter("value", Parameter.ACTIVITY)
        .uniqueResult();

if (activity != null)
{
%>
        <label for="member-update-activity"><%=activity.getDescription()%></label>
        <select name="activity" id="member-update-activity">
<%
    List<Parameter> activityList = Database.getCurrentSession()
            .createQuery("FROM Parameter WHERE parent = :parent ORDER BY position ASC")
            .setParameter("parent", activity)
            .list();
    for(Parameter childActivity : activityList)
    {
%>
            <option value="<%=childActivity.getId()%>" <%=childActivity.getId() == member.getActivity().getId() ? "selected" : ""%>><%=childActivity.getDescription()%></option>
<%
    }
%>
        </select>
<%
}
%>

<%
Parameter status = (Parameter) Database.getCurrentSession()
    .createQuery("FROM Parameter WHERE value = :value")
    .setParameter("value", Parameter.STATUS)
    .uniqueResult();

if (status != null)
{
%>
        <label for="member-update-status"><%=status.getDescription()%></label>
        <select name="status" id="member-update-status">
<%
    List<Parameter> statusList = Database.getCurrentSession()
            .createQuery("FROM Parameter WHERE parent = :parent ORDER BY position ASC")
            .setParameter("parent", status)
            .list();

    for(Parameter childStatus : statusList)
    {
%>
            <option value="<%=childStatus.getId()%>" <%=childStatus.getId() == member.getStatus().getId() ? "selected" : ""%>><%=childStatus.getDescription()%></option>
<%
    }
%>
        </select>
<%
}
%>
    </div>

    <div id="note">
        <br>

        <label for="member-update-note">Nota</label>
        <textarea cols="40" rows="8" name="note" id="member-update-note"><%=member.getNote() == null ? "" : member.getNote()%></textarea>
    </div>

    <div class="member-update-button ui-grid-a">
        <div class="ui-block-a">
            <button class="ui-btn ui-corner-all" id="member-update" onclick="javascript:memberUpdate(); return;">Guardar</button>
        </div>
        <div class="ui-block-b">
            <button class="ui-btn ui-corner-all" id="member-cancel" onclick="javascript:goTo('MemberSearch.jsp'); return;">Cancelar</button>
        </div>
    </div>
</form>

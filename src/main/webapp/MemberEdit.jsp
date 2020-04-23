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

<div data-role="tabs" id="tabs">

    <div data-role="navbar">
        <ul>
            <li><a href="#personal" data-ajax="false" class="ui-btn-active">Info</a></li>
            <li><a href="#contact" data-ajax="false">Contacto</a></li>
            <li><a href="#payment" data-ajax="false">Pago</a></li>
            <li><a href="#note" data-ajax="false">Nota</a></li>
        </ul>
    </div>

    <div id="personal">
        <h3></h3>

        <label for="member-create-firstname">Nombre</label>
        <input type="text" name="member-create-firstname" id="member-create-firstname" value="<%=member.getFirstname()%>">

        <label for="member-create-lastname">Apellido</label>
        <input type="text" name="member-create-lastname" id="member-create-lastname" value="<%=member.getLastname()%>">

        <label for="member-create-birthday">Fecha de Nacimiento</label>
        <div class="ui-grid-b" id="member-create-birthday">
            <div class="ui-block-a">
                <select data-mini="true" name="member-create-birthday-day">
                    <%Integer birthdayDay = member.getBirthday() == null ? null : Integer.parseInt(member.getBirthdayDay());%>
                    <%for(int day = 1; day < 32; day++){%>
                    <option value="<%=day%>" <%=birthdayDay != null && birthdayDay == day ? "selected" : ""%>><%=day%></option>
                    <%}%>
                </select>
            </div>
            <div class="ui-block-b">
                <select data-mini="true" name="member-create-birthday-month">
                    <%Integer birthdayMonth = member.getBirthday() == null ? null : Integer.parseInt(member.getBirthdayMonth());%>
                    <%for(int month = 1; month < 13; month++){%>
                    <option value="<%=month%>"<%=birthdayMonth != null && birthdayMonth == month ? "selected" : ""%>><%=Context.MONTH[month - 1]%></option>
                    <%}%>
                </select>
            </div>
            <div class="ui-block-c">
                <select data-mini="true" name="member-create-birthday-year">
                    <%Integer birthdayYear = member.getBirthday() == null ? null : Integer.parseInt(member.getBirthdayYear());%>
                    <%for(int year = 1920; year < 2021; year++){%>
                    <option value="<%=year%>"<%=birthdayYear != null && birthdayYear == year ? "selected" : ""%>><%=year%></option>
                    <%}%>
                </select>
            </div>
        </div>

        <label for="member-create-dni">DNI:</label>
        <input type="number" name="member-create-dni" id="member-create-dni" pattern="[0-9]*" value="<%=member.getDni() == null ? "" : member.getDni()%>">
    </div>

    <div id="contact">
        <h3></h3>

        <label for="member-create-phone">Tel&eacute;fono:</label>
        <input type="text" name="member-create-phone" id="member-create-phone" value="">

        <label for="member-create-address">Direcci&oacute;n:</label>
        <input type="text" name="member-create-address" id="member-create-address" value="">

        <label for="member-create-email">eMail:</label>
        <input type="text" name="member-create-email" id="member-create-email" value="">

        <label for="member-create-father-info">Nombre y Apellido del Padre:</label>
        <input type="text" name="member-create-father-info" id="member-create-father-info" value="">

        <label for="member-create-mother-info">Nombre y Apellido de la Madre:</label>
        <input type="text" name="member-create-mother-info" id="member-create-mother-info" value="">
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
        <label for="member-create-payement-method"><%=paymentType.getDescription()%></label>
        <select name="member-create-payement-method" id="member-create-payement-method">
            <%
                List<Parameter> paymentTypeList = Database.getCurrentSession()
                        .createQuery("FROM Parameter WHERE parent = :parent ORDER BY position")
                        .setParameter("parent", paymentType)
                        .list();
                for(Parameter childPaymentType : paymentTypeList)
                {
            %>
            <option value="<%=childPaymentType.getValue()%>"><%=childPaymentType.getDescription()%></option>
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
        <label for="member-create-discount"><%=discount.getDescription()%></label>
        <select name="member-create-discount" id="member-create-discount">
            <%
                List<Parameter> discountList = Database.getCurrentSession()
                        .createQuery("FROM Parameter WHERE parent = :parent ORDER BY position")
                        .setParameter("parent", discount)
                        .list();
                for(Parameter childDiscount : discountList)
                {
            %>
            <option value="<%=childDiscount.getValue()%>"><%=childDiscount.getDescription()%></option>
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
        <label for="member-create-activity"><%=activity.getDescription()%></label>
        <select name="member-create-activity" id="member-create-activity">
            <%
                List<Parameter> activityList = Database.getCurrentSession()
                        .createQuery("FROM Parameter WHERE parent = :parent ORDER BY position")
                        .setParameter("parent", activity)
                        .list();
                for(Parameter childActivity : activityList)
                {
            %>
            <option value="<%=childActivity.getValue()%>"><%=childActivity.getDescription()%></option>
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
        <label for="member-create-status"><%=status.getDescription()%></label>
        <select name="member-create-status" id="member-create-status">
            <%
                List<Parameter> statusList = Database.getCurrentSession()
                        .createQuery("FROM Parameter WHERE parent = :parent ORDER BY position")
                        .setParameter("parent", status)
                        .list();
                for(Parameter childStatus : statusList)
                {
            %>
            <option value="<%=childStatus.getValue()%>"><%=childStatus.getDescription()%></option>
            <%
                }
            %>
        </select>
        <%
            }
        %>
    </div>

    <div id="note">
        <h3></h3>

        <label for="member-create-note">Nota:</label>
        <textarea cols="40" rows="8" name="member-create-note" id="member-create-note"></textarea>
    </div>

    <br>

    <div class="member-create-button ui-grid-a">
        <div class="ui-block-a">
            <button class="ui-btn ui-corner-all" id="member-update" onclick="javascript:goTo('MemberView.jsp'); return;">Guardar</button>
        </div>
        <div class="ui-block-b">
            <button class="ui-btn ui-corner-all" id="member-cancel" onclick="javascript:goTo('MemberSearch.jsp'); return;">Cancelar</button>
        </div>
    </div>
</div>

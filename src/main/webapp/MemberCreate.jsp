<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.List" %>
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

		<label for="member-create-firstname">Nombre:</label>
		<input type="text" name="member-create-firstname" id="member-create-firstname" value="">

		<label for="member-create-lastname">Apellido:</label>
		<input type="text" name="member-create-lastname" id="member-create-lastname" value="">

		<label for="member-create-birthday">Fecha de Nacimiento:</label>
		<input type="text" name="member-create-birthday" id="member-create-birthday" value="">

		<label for="member-create-dni">DNI:</label>
		<input type="number" name="member-create-dni" id="member-create-dni" pattern="[0-9]*" value="">
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

	<div class="member-create-button">
		<button class="ui-btn ui-corner-all" id="member-create" onclick="javascript:goTo('MemberView.jsp'); return;">Crear Socio</button>
	</div>
</div>

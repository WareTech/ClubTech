<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.Context" %>

<div data-role="popup" id="error">
	<p>Error al actualziar el socio</p>
</div>

<div data-role="popup" id="success">
	<p>Socio actualizado con &eacute;xito</p>
</div>

<form data-role="tabs" id="member-create" onsubmit="return false;">

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
		<input type="text" name="firstname" id="member-create-firstname" value="">

		<label for="member-create-lastname">Apellido</label>
		<input type="text" name="lastname" id="member-create-lastname" value="">

		<label for="member-create-birthday">Fecha de Nacimiento</label>
		<div class="ui-grid-b" id="member-create-birthday">
			<div class="ui-block-a">
				<select data-mini="true" name="birthday-day">
					<%for(int day = 1; day < 32; day++){%>
					<option value="<%=day%>"><%=day%></option>
					<%}%>
				</select>
			</div>
			<div class="ui-block-b">
				<select data-mini="true" name="birthday-month">
					<%for(int month = 1; month < 13; month++){%>
					<option value="<%=month%>"><%=Context.MONTH[month - 1]%></option>
					<%}%>
				</select>
			</div>
			<div class="ui-block-c">
				<select data-mini="true" name="birthday-year">
					<%for(int year = 1920; year < 2021; year++){%>
					<option value="<%=year%>"<%=year == 2000 ? "selected" : ""%>><%=year%></option>
					<%}%>
				</select>
			</div>
		</div>

		<label for="member-create-dni">DNI:</label>
		<input type="number" name="dni" id="member-create-dni" pattern="[0-9]*" value="">
	</div>

	<div id="contact">
		<h3></h3>

		<label for="member-create-phone">Tel&eacute;fono</label>
		<input type="number" name="phone" id="member-create-phone" value="">

		<label for="member-create-address">Direcci&oacute;n</label>
		<input type="text" name="address" id="member-create-address" value="">

		<label for="member-create-email">eMail</label>
		<input type="text" name="email" id="member-create-email" value="">

		<label for="member-create-father-info">Datos del Padre</label>
		<input type="text" name="father-info" id="member-create-father-info" value="">

		<label for="member-create-mother-info">Datos de la Madre</label>
		<input type="text" name="mother-info" id="member-create-mother-info" value="">
	</div>

	<div id="payment">
		<br>

<%
Parameter paymentType = (Parameter) Database.getCurrentSession()
	.createQuery("FROM Parameter WHERE value = :value")
	.setParameter("value", Parameter.PAYMENT_TYPE)
	.uniqueResult();
%>
		<label for="member-create-payment-type"><%=paymentType.getDescription()%></label>
		<select name="payment-type" id="member-create-payment-type">
<%
List<Parameter> paymentTypeList = Database.getCurrentSession()
	.createQuery("FROM Parameter WHERE parent = :parent ORDER BY position ASC")
	.setParameter("parent", paymentType)
	.list();

for(Parameter childPaymentType : paymentTypeList)
{
%>
			<option value="<%=childPaymentType.getId()%>"><%=childPaymentType.getDescription()%></option>
<%
}
%>
		</select>

<%
Parameter discount = (Parameter) Database.getCurrentSession()
	.createQuery("FROM Parameter WHERE value = :value")
	.setParameter("value", Parameter.DISCOUNT)
	.uniqueResult();
%>
		<label for="member-create-discount"><%=discount.getDescription()%></label>
		<select name="discount" id="member-create-discount">
<%
List<Parameter> discountList = Database.getCurrentSession()
	.createQuery("FROM Parameter WHERE parent = :parent ORDER BY position ASC")
	.setParameter("parent", discount)
	.list();
for(Parameter childDiscount : discountList)
{
%>
			<option value="<%=childDiscount.getId()%>"><%=childDiscount.getDescription()%></option>
<%
}
%>
		</select>

<%
Parameter activity = (Parameter) Database.getCurrentSession()
	.createQuery("FROM Parameter WHERE value = :value")
	.setParameter("value", Parameter.ACTIVITY)
	.uniqueResult();
%>
		<label for="member-create-activity"><%=activity.getDescription()%></label>
		<select name="activity" id="member-create-activity">
<%
List<Parameter> activityList = Database.getCurrentSession()
	.createQuery("FROM Parameter WHERE parent = :parent ORDER BY position ASC")
	.setParameter("parent", activity)
	.list();
for(Parameter childActivity : activityList)
{
%>
			<option value="<%=childActivity.getId()%>"><%=childActivity.getDescription()%></option>
<%
}
%>
		</select>

<%
Parameter status = (Parameter) Database.getCurrentSession()
	.createQuery("FROM Parameter WHERE value = :value")
	.setParameter("value", Parameter.STATUS)
	.uniqueResult();
%>
		<label for="member-create-status"><%=status.getDescription()%></label>
		<select name="status" id="member-create-status">
<%
List<Parameter> statusList = Database.getCurrentSession()
	.createQuery("FROM Parameter WHERE parent = :parent ORDER BY position ASC")
	.setParameter("parent", status)
	.list();

for(Parameter childStatus : statusList)
{
%>
			<option value="<%=childStatus.getId()%>"><%=childStatus.getDescription()%></option>
<%
}
%>
		</select>

	</div>

	<div id="note">
		<h3></h3>

		<label for="member-create-note">Nota</label>
		<textarea cols="40" rows="8" name="note" id="member-create-note"></textarea>
	</div>

	<div class="member-create-button ui-grid-a">
		<div class="ui-block-a">
			<button class="ui-btn ui-corner-all" id="member-create" onclick="javascript:memberCreate(); return;">Guardar</button>
		</div>
		<div class="ui-block-b">
			<button class="ui-btn ui-corner-all" id="member-cancel" onclick="javascript:goTo('MemberCreate.jsp'); return;">Cancelar</button>
		</div>
	</div>
</form>

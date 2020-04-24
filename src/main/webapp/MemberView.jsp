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

if (member == null)
{
%>
<%@include file="Error.jsp"%>
<%
}
%>

<div data-role="tabs">

	<div data-role="navbar">
		<ul>
			<li><a href="#personal" data-ajax="false" class="ui-btn-active">Info</a></li>
			<li><a href="#contact" data-ajax="false">Contacto</a></li>
			<li><a href="#payment" data-ajax="false">Pago</a></li>
			<li><a href="#note" data-ajax="false">Nota</a></li>
		</ul>
	</div>

	<div id="personal">
		<ul data-role="listview" data-inset="true" data-divider-theme="a">
			<li data-role="list-divider">Nombre</li>
			<li><%=member.getFirstname()%></li>
			<li data-role="list-divider">Apellido</li>
			<li><%=member.getLastname()%></li>
			<li data-role="list-divider">Fecha de Nacimiento</li>
			<li><%=member.getBirthday() == null ? "" : member.getFriendlyBirthday()%></li>
			<li data-role="list-divider">DNI</li>
			<li><%=member.getDni() == null ? "" : member.getDni()%></li>
		</ul>
	</div>

	<div id="contact">
		<ul data-role="listview" data-inset="true" data-divider-theme="a">
			<li data-role="list-divider">Tel&eacute;fono</li>
			<li><%=member.getPhone() == null ? "" : member.getPhone()%></li>
			<li data-role="list-divider">Direcci&oacute;n</li>
			<li><%=member.getAddress() == null ? "" : member.getAddress()%></li>
			<li data-role="list-divider">Tel&eacute;fono</li>
			<li><%=member.getEmail() == null ? "" : member.getEmail()%></li>
			<li data-role="list-divider">Datos del Padre</li>
			<li><%=member.getFather() == null ? "" : member.getFather()%></li>
			<li data-role="list-divider">Datos de la Madre</li>
			<li><%=member.getMother() == null ? "" : member.getMother()%></li>
		</ul>
	</div>

	<div id="payment">
		<ul data-role="listview" data-inset="true" data-divider-theme="a">
			<li data-role="list-divider">M&eacute;todo de Pago</li>
			<li><%=member.getPaymentType() == null ? "" : member.getPaymentType().getDescription()%></li>
			<li data-role="list-divider">Descuento</li>
			<li><%=member.getDiscount() == null ? "" : member.getDiscount().getDescription()%></li>
			<li data-role="list-divider">Actividad</li>
			<li><%=member.getActivity() == null ? "" : member.getActivity().getDescription()%></li>
			<li data-role="list-divider">Estado</li>
			<li><%=member.getStatus() == null ? "" : member.getStatus().getDescription()%></li>
		</ul>
	</div>

	<div id="note">
		<ul data-role="listview" data-inset="true" data-divider-theme="a">
			<li data-role="list-divider">Nota</li>
			<li><div style="white-space : pre-wrap;"><%=member.getNote() == null ? "" : member.getNote()%></div></li>
		</ul>
	</div>
</div>

<div class="member-update-button ui-grid-a">
	<div class="ui-block-a">
		<button class="ui-btn ui-corner-all" id="member-update" onclick="javascript:goTo('MemberEdit.jsp?<%=memberId%>'); return;">Editar</button>
	</div>
	<div class="ui-block-b">
		<button class="ui-btn ui-corner-all" id="member-cancel" onclick="javascript:goTo('MemberSearch.jsp'); return;">Cancelar</button>
	</div>
</div>
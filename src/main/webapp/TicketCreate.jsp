<%@ page import="com.WareTech.ClubTech.Utils" %>
<div>
	<ul data-role="listview" data-inset="true" data-divider-theme="a">
		<li data-role="list-divider">Partido</li>
		<li>ADIP vs Gimnasia</li>
		<li data-role="list-divider">Precio</li>
		<li>$250,00</li>
		<li data-role="list-divider">Fecha</li>
		<li><%=Utils.dateTimeNow()%></li>
		<li data-role="list-divider">Comprobante</li>
		<li>1234567890</li>
		<li data-role="list-divider">Autodidad</li>
		<li><%=Utils.getUser(request, response).getUsername()%></li>
	</ul>
	<button class="ui-btn ui-corner-all" id="ticket-create" onclick="javascript:goTo('TicketView.jsp'); return;">Confirmar Pago</button>
</div>
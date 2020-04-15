<%@include file="Utils.jsp"%>

<div> 
	<ul data-role="listview" data-inset="true" data-divider-theme="a">
		<li data-role="list-divider">Partido</li>
		<li><%=matchDescription%></li>
		<li data-role="list-divider">Precio</li>
		<li><%=ticketPrice%></li>
		<li data-role="list-divider">Fecha</li>
		<li><%=date%></li>
		<li data-role="list-divider">Comprobante</li>
		<li>1234567890</li>
		<li data-role="list-divider">Autodidad</li>
		<li><%=username%></li>
	</ul>
	<button class="ui-btn ui-corner-all" id="ticket-create" onclick="javascript:ticketCreate(); return;">Confirmar Pago</button>
</div>
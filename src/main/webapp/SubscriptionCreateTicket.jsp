<%@ page import="com.WareTech.ClubTech.Utils" %>
<div>
	<h3>Pagar cuota</h3>

	<ul data-role="listview" data-inset="true" data-divider-theme="a">
		<li data-role="list-divider">Socio</li>
		<li>Soncini, Leandro (24.952.726)</li>
		<li data-role="list-divider">Cuota</li>
		<li>2020 Anual ($5.000)</li>
		<li data-role="list-divider">Fecha</li>
		<li><%=Utils.dateTimeNow()%></li>
		<li data-role="list-divider">Comprobante</li>
		<li>1234567890</li>
		<li data-role="list-divider">Autodidad</li>
		<li><%=Utils.getUser(request, response).getUsername()%></li>
	</ul>
</div>

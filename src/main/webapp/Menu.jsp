<%@ page import="com.WareTech.ClubTech.Utils" %>

<div data-role="panel" id="menu" data-display="overlay">
	<ul data-role="listview">

<%if (Utils.checkAuthorization(request, response, new String[]{"SubscriptionCreateMember.jsp", "SubscriptionSearch.jsp"})) {%>
		<li data-role="list-divider">Cuotas</li>
	<%if (Utils.checkAuthorization(request, response, "SubscriptionCreateMember.jsp")) {%>
		<li><a href="javascript:goTo('SubscriptionCreateMember.jsp');" data-rel="close" class="ui-btn ui-icon-plus ui-btn-icon-right">Pagar Cuota</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "SubscriptionSearch.jsp")) {%>
		<li><a href="javascript:goTo('SubscriptionSearch.jsp')" data-rel="close" class="ui-btn ui-icon-search ui-btn-icon-right">Buscar Pago</a></li>
	<%}%>
<%}%>

<%if (Utils.checkAuthorization(request, response, new String[]{"MemberCreate.jsp", "MemberSearch.jsp"})) {%>
		<li data-role="list-divider">Socios</li>
	<%if (Utils.checkAuthorization(request, response, "MemberCreate.jsp")) {%>
		<li><a href="javascript:goTo('MemberCreate.jsp')" data-rel="close" class="ui-btn ui-icon-plus ui-btn-icon-right">Nuevo Socio</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "MemberSearch.jsp")) {%>
		<li><a href="javascript:goTo('MemberSearch.jsp')" data-rel="close" class="ui-btn ui-icon-search ui-btn-icon-right">Buscar Socio</a></li>
	<%}%>
<%}%>

<%if (Utils.checkAuthorization(request, response, new String[]{"TicketCreate.jsp", "TicketList.jsp"})) {%>
		<li data-role="list-divider">Partido</li>
	<%if (Utils.checkAuthorization(request, response, "TicketCreate.jsp")) {%>
		<li><a href="javascript:goTo('TicketCreate.jsp')" data-rel="close" class="ui-btn ui-icon-plus ui-btn-icon-right">Vender Entrada</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "TicketList.jsp")) {%>
		<li><a href="javascript:goTo('TicketList.jsp');" data-rel="close">Resumen de ventas</a></li>
	<%}%>
<%}%>

<%if (Utils.checkAuthorization(request, response, new String[]{"BuffetTicketCreate.jsp", "BuffetTicketResume.jsp"})) {%>
		<li data-role="list-divider">Buffet</li>
	<%if (Utils.checkAuthorization(request, response, "BuffetTicketCreate.jsp")) {%>
		<li><a href="javascript:goTo('BuffetTicketCreate.jsp')" data-rel="close" class="ui-btn ui-icon-plus ui-btn-icon-right">Vender</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "BuffetTicketResume.jsp")) {%>
		<li><a href="javascript:goTo('BuffetTicketResume.jsp');" data-rel="close">Resumen de ventas</a></li>
	<%}%>
<%}%>

<%if (Utils.checkAuthorization(request, response, new String[]{"StoreTicketCreate.jsp", "StoreTicketResume.jsp"})) {%>
		<li data-role="list-divider">Store</li>
	<%if (Utils.checkAuthorization(request, response, "StoreTicketCreate.jsp")) {%>
		<li><a href="javascript:goTo('StoreTicketCreate.jsp')" data-rel="close" class="ui-btn ui-icon-plus ui-btn-icon-right">Vender</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "StoreTicketResume.jsp")) {%>
		<li><a href="javascript:goTo('StoreTicketResume.jsp');" data-rel="close">Resumen de ventas</a></li>
	<%}%>
<%}%>

<%if (Utils.checkAuthorization(request, response, new String[]{"SubscriptionEdit.jsp", "Activities.jsp"})) {%>
		<li data-role="list-divider">Administraci&oacute;n</li>
	<%if (Utils.checkAuthorization(request, response, "SubscriptionEdit.jsp")) {%>
		<li><a href="javascript:goTo('SubscriptionEdit.jsp');" data-rel="close">Cuota</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "Activities.jsp")) {%>
		<li><a href="javascript:goTo('Activities.jsp');" data-rel="close">Actividades</a></li>
	<%}%>
<%}%>

<%if (Utils.checkAuthorization(request, response, new String[]{"UserList.jsp", "AccessList.jsp"})) {%>
		<li data-role="list-divider">Sistema</li>
	<%if (Utils.checkAuthorization(request, response, "UserList.jsp")) {%>
		<li><a href="javascript:goTo('UserList.jsp');" data-rel="close">Usuarios</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "AccessList.jsp")) {%>
		<li><a href="javascript:goTo('AccessList.jsp');" data-rel="close">Accesos</a></li>
	<%}%>
<%}%>

<%if (Utils.checkAuthorization(request, response, new String[]{"DEVELOPER_ACCESS"})) {%>
	<li data-role="list-divider">Desarrollo</li>
		<%if (Utils.checkAuthorization(request, response, "ProcessList.jsp")) {%>
		<li><a href="javascript:goTo('ProcessList.jsp');" data-rel="close">Procesos</a></li>
		<%}%>
		<%if (Utils.checkAuthorization(request, response, "Unauthorized.jsp")) {%>
		<li><a href="javascript:goTo('Unauthorized.jsp');" data-rel="close">Acceso NO autorizado</a></li>
		<%}%>
		<%if (Utils.checkAuthorization(request, response, "Error.jsp")) {%>
		<li><a href="javascript:goTo('Error.jsp');" data-rel="close">Error</a></li>
		<%}%>
		<%if (Utils.checkAuthorization(request, response, "TestCookie.jsp")) {%>
		<li><a href="javascript:goTo('TestCookie.jsp');" data-rel="close">Test Cookie</a></li>
		<%}%>
<%}%>

<%if (Utils.checkAuthorization(request, response, new String[]{"UserProfile.jsp", "Settings.jsp", "Logout.jsp"})) {%>
		<li data-role="list-divider">General</li>
	<%if (Utils.checkAuthorization(request, response, "Home.jsp")) {%>
		<li><a href="javascript:home();" data-rel="close" class="ui-btn ui-icon-home ui-btn-icon-right">Inicio</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "UserProfile.jsp") && Utils.getUser(request, response) != null) {%>
		<li><a href="javascript:goTo('UserProfile.jsp');" data-rel="close" class="ui-btn ui-icon-user ui-btn-icon-right">Perfil</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "Settings.jsp")) {%>
		<li><a href="javascript:goTo('Settings.jsp');" data-rel="close" class="ui-btn ui-icon-gear ui-btn-icon-right">Ajustes</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "Logout.jsp") && Utils.getUser(request, response) != null) {%>
		<li><a href="javascript:logout();" data-rel="close" class="ui-btn ui-icon-power ui-btn-icon-right">Salir</a></li>
	<%}%>
	<%if (Utils.checkAuthorization(request, response, "Login.jsp") && Utils.getUser(request, response) == null) {%>
		<li><a href="javascript:goTo('Login.jsp');" data-rel="close" class="ui-btn ui-icon-lock ui-btn-icon-right">Ingresar</a></li>
	<%}%>
<%}%>
	</ul>
</div> 

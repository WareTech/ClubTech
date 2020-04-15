<div> 
	<h3>Pagar cuota</h3>

	<div id="suscripton-create-member-panel">
		<label for="suscripton-create-member">Socio:</label>
		<input type="text" name="suscripton-create-member" id="suscripton-create-member" value="Soncini, Leandro (24.952.726)">
		<button class="ui-btn ui-corner-all" id="suscripton-create-member-serach" onclick="javascript:suscriptionPay(); return;">Buscar</button>
	</div>

	<div id="suscripton-create-member-list-panel">
		<label for="suscripton-create-period">Cuota:</label>
		<ul data-role="listview" data-inset="true">
			<li><a href="javascript:suscriptionCreateConfirm();">2020 Anual ($5.000)</a></li>
			<li><a href="javascript:suscriptionCreateConfirm();">2020 Enero ($500)</a></li>
		</ul>
		<input type="text" name="suscripton-create-period-custom-amount" id="suscripton-create-period-custom-amount" placeholder="Ingrese un monto..." value="" style="text-align: right;">
		<button class="ui-btn ui-corner-all" onclick="javascript:suscriptionCreateConfirm(); return;">Pagar</button>
	</div>
</div>

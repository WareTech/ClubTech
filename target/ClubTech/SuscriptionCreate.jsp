<div> 
	<form action="#" method="get">
		<h2>Pagar cuota</h2>

		<div id="suscripton-create-member-panel">
			<label for="suscripton-create-member">Socio:</label>
			<input type="text" name="suscripton-create-member" id="suscripton-create-member" value="">
			<button class="ui-btn" id="suscripton-create-member-serach">Buscar</button>
		</div>

		<div id="suscripton-create-member-list-panel" style="display: none">
		</div>

		<div id="suscripton-create-period-panel" style="display: none">
			<label for="suscripton-create-period">Periodo:</label>
			<select name="suscripton-create-period" id="suscripton-create-period" onchange="javascript:suscriptionCreatePeriodChanged();">
			</select>
		</div>

		<div id="suscripton-create-period-amount-panel" style="display: none">
			<label for="suscripton-create-period-amounts">Monto:</label>
			<button class="ui-btn" id="suscripton-create-period-amount" style="display: none"></button>
			<button class="ui-btn">Otro...</button>
		</div>
	</form>
</div>
<div> 
	<h3>Crear Socio</h3>

	<div id="member-create-panel">
		<label for="member-create-firstname">Nombre:</label>
		<input type="text" name="member-create-firstname" id="member-create-firstname" value="">

		<label for="member-create-lastname">Apellido:</label>
		<input type="text" name="member-create-lastname" id="member-create-lastname" value="">

		<label for="member-create-category"">Categor&iacute;a:</label>
		<select name="member-create-category" id="member-create-category">
			<optgroup label="Mayores">
				<option value="Primera">Primera</option>
				<option value="Tercera">Tercera</option>
				<option value="Cuarta">Cuarta</option>
				<option value="Senior">Senior</option>
			<optgroup label="Juveniles">
				<option value="5ta">5ta</option>
				<option value="6ta">6ta</option>
				<option value="7ma">7ma</option>
				<option value="8va">8va</option>
				<option value="9na">9na</option>
				<option value="Pre 9na">Pre 9na</option>
			<optgroup label="Infantiles">
				<option value="2007">2007</option>
				<option value="2008">2008</option>
				<option value="2009">2009</option>
				<option value="2010">2010</option>
				<option value="2011">2011</option>
				<option value="2012/2013">2012/2013</option>
			<optgroup label="Femenino">
				<option value="Primera">Primera</option>
				<option value="Tercera">Tercera</option>
				<option value="Sub-18">Sub-18</option>
				<option value="Sub-17">Sub-17</option>
				<option value="Sub-16">Sub-16</option>
				<option value="Sub-14">Sub-14</option>
				<option value="Sub-10">Sub-10</option>
		</select>
		
		<label for="member-create-birthday">Fecha de Nacimiento:</label>
		<input type="text" name="member-create-birthday" id="member-create-birthday" value="">

		<label for="member-create-dni">DNI:</label>
		<input type="text" name="member-create-dni" id="member-create-dni" value="">

		<label for="member-create-phone">Tel&eacute;fono:</label>
		<input type="text" name="member-create-phone" id="member-create-phone" value="">

		<label for="member-create-state"">Estado:</label>
		<select name="member-create-category" id="member-create-category">
			<option value="Fichado">Fichado</option>
			<option value="Listado">Listado</option>
			<option value="Habilitado">Habilitado</option>
			<option value="Agregado">Agregado</option>
			<option value="Pre Inscripcion">Pre Inscripci&oacute;n</option>
		</select>

		<label for="member-create-note">Nota:</label>
		<input type="text" name="member-create-note" id="member-create-note" value="">

		<button class="ui-btn ui-corner-all" id="member-create" onclick="javascript:memberCreate(); return;">Crear Socio</button>
	</div>
</div>
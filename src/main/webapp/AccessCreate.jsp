<div data-role="popup" id="error">
    <p>Error al creat</p>
</div>

<div data-role="popup" id="success">
    <p>Acceso creado</p>
</div>

<h3 class="ui-bar ui-bar-a ui-corner-all">Accesos</h3>

<form data-role="tabs" id="access" onsubmit="return false;">

    <label>Acceso</label>
    <input type="text" name="value">
    <label>Descripci&oacute;n</label>
    <input type="text" name="description">

    <button class="ui-btn ui-corner-all" onclick="javascript:accessCreate(); return;">Crear</button>
</form>



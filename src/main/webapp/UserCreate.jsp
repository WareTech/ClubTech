<div data-role="popup" id="error">
    <p>Error al crear</p>
</div>

<div data-role="popup" id="success">
    <p>Usuario creado</p>
</div>

<h3 class="ui-bar ui-bar-a ui-corner-all">Usuarios</h3>

<form id="user" onsubmit="return false;">
    <label>Usuario</label>
    <input type="text" name="username" value="">
    <button class="ui-btn ui-corner-all" id="user-edit-search" onclick="javascript:userCreate(); return;">Crear Usuario</button>
</form>

<div data-role="popup" id="error">
    <p>Error al crear la actividad</p>
</div>

<div data-role="popup" id="success">
    <p>Actividad creada</p>
</div>

<form data-role="tabs" id="activity-create" onsubmit="return false;">

    <h3></h3>

    <label>Clave</label>
    <input type="text" name="value" value="">
    <label>Descripci&oacute;n</label>
    <input type="text" name="description" value="">

    <div class="ui-grid-a">
        <div class="ui-block-a">
            <button class="ui-btn ui-corner-all" onclick="javascript:activityCreate(); return;">Guardar</button>
        </div>
        <div class="ui-block-b">
            <button class="ui-btn ui-corner-all" onclick="javascript:goTo('ActivitySearch.jsp'); return;">Cancelar</button>
        </div>
    </div>
</form>



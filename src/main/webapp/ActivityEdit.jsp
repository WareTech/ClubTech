<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>

<%
String activityId = request.getQueryString();
if (activityId == null)
{
%>
<%@include file="Error.jsp"%>
<%
    return;
}
Parameter parameter = (Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(activityId));
if (parameter == null)
{
%>
<%@include file="Error.jsp"%>
<%
    return;
}
%>

<div data-role="popup" id="error">
    <p>Error al actualizar</p>
</div>

<div data-role="popup" id="success">
    <p>Actividad actualizado</p>
</div>

<form data-role="tabs" id="activity-edit" onsubmit="return false;">

    <input type="hidden" name="activityId" value="<%=parameter.getId()%>">

    <h3></h3>
    <label>Clave</label>
    <input type="text" name="value" value="<%=parameter.getValue()%>">
    <label>Descripci&oacute;n</label>
    <input type="text" name="description" value="<%=parameter.getDescription()%>">

    <div class="ui-grid-a">
        <div class="ui-block-a">
            <button class="ui-btn ui-corner-all" onclick="javascript:activityUpdate(); return;">Guardar</button>
        </div>
        <div class="ui-block-b">
            <button class="ui-btn ui-corner-all" onclick="javascript:goTo('ActivitySearch.jsp'); return;">Cancelar</button>
        </div>
    </div>
</form>



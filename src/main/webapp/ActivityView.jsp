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
Parameter activity = (Parameter) Database.getCurrentSession().get(Parameter.class, Long.parseLong(activityId));
if (activity == null)
{
%>
<%@include file="Error.jsp"%>
<%
    return;
}
%>

<h3 class="ui-bar ui-bar-a ui-corner-all">Actividades</h3>

<ul data-role="listview" data-inset="true" data-divider-theme="a">
    <li data-role="list-divider">Clave</li>
    <li><%=activity.getValue()%></li>
    <li data-role="list-divider">Descripcion</li>
    <li><%=activity.getDescription()%></li>
</ul>

<div class="member-create-button ui-grid-a">
    <div class="ui-block-a">
        <button class="ui-btn ui-corner-all" id="user-view" onclick="javascript:goTo('ActivityEdit.jsp?<%=activity.getId()%>'); return;">Editar</button>
    </div>
    <div class="ui-block-b">
        <button class="ui-btn ui-corner-all" id="user-edit-cancel" onclick="javascript:goTo('ActivitySearch.jsp'); return;">Volver</button>
    </div>
</div>


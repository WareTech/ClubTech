<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Access" %>
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

<ul data-role="listview" data-inset="true" data-divider-theme="a">
    <li data-role="list-divider">Usuario</li>
    <li><%=user.getUsername()%></li>
    <li data-role="list-divider">Accesos</li>
<%
List<Access> accessList = Database.getCurrentSession()
    .createQuery("SELECT access FROM UserAccess WHERE user = :user ORDER BY description ASC")
    .setParameter("user", user)
    .list();
for(Access access : accessList)
{
%>
    <li><%=access.getDescription()%></li>
<%
}

if (accessList.size() == 0)
{
%>
    <li>No hay accesos para mostrar</li>
<%
}
%>
</ul>

<div class="member-create-button ui-grid-a">
    <div class="ui-block-a">
        <button class="ui-btn ui-corner-all" id="user-view" onclick="javascript:goTo('UserEdit.jsp?<%=user.getId()%>'); return;">Editar</button>
    </div>
    <div class="ui-block-b">
        <button class="ui-btn ui-corner-all" id="user-edit-cancel" onclick="javascript:goTo('UserSearch.jsp'); return;">Volver</button>
    </div>
</div>


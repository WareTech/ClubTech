<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.entity.Access" %>
<%@ page import="com.WareTech.ClubTech.Database" %>

<%
String accessId = request.getQueryString();
if (accessId == null)
{
%>
<%@include file="Error.jsp"%>
<%
    return;
}
Access access = (Access) Database.getCurrentSession().get(Access.class, Long.parseLong(accessId));
if (access == null)
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
    <p>Acceso actualizado</p>
</div>

<form data-role="tabs" id="access-edit" onsubmit="return false;">

    <input type="hidden" name="accessId" id="accessId" value="<%=access.getId()%>">

    <div data-role="navbar">
        <ul>
            <li><a href="#info" data-ajax="false" class="ui-btn-active">Info</a></li>
            <li><a href="#users" data-ajax="false">Usuarios</a></li>
        </ul>
    </div>

    <div id="info">
        <h3></h3>
        <label for="access-edit-value">Acceso</label>
        <input type="text" name="value" id="access-edit-value" value="<%=access.getValue()%>">
        <label for="access-edit-description">Descripci&oacute;n</label>
        <input type="text" name="description" id="access-edit-description" value="<%=access.getDescription()%>">
    </div>

    <div id="users">
<%
List<User> userList = Database.getCurrentSession()
        .createQuery("FROM User ORDER BY username ASC")
        .list();
List<Long> userIdList = Database.getCurrentSession()
        .createQuery("SELECT user.id FROM UserAccess WHERE access = :access")
        .setParameter("access", access)
        .list();
%>
        <fieldset data-role="controlgroup">
<%
for(User user : userList)
{
%>
            <input type="checkbox" name="user" id="user-<%=user.getId()%>" value="<%=user.getId()%>" <%=userIdList.contains(user.getId()) ? "checked" : ""%>>
            <label for="user-<%=user.getId()%>"><%=user.getUsername()%></label>
<%
}
%>
        </fieldset>

    </div>

    <div class="ui-grid-a">
        <div class="ui-block-a">
            <button class="ui-btn ui-corner-all" id="user-access-save" onclick="javascript:accessUpdate(); return;">Guardar</button>
        </div>
        <div class="ui-block-b">
            <button class="ui-btn ui-corner-all" id="user-edit-cancel" onclick="javascript:goTo('AccessSearch.jsp'); return;">Cancelar</button>
        </div>
    </div>
</form>



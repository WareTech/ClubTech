<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.facade.UserFacade" %>
<%@ page import="com.WareTech.ClubTech.entity.Access" %>
<%@ page import="com.WareTech.ClubTech.Database" %>

<%
String userId = request.getQueryString();
if (userId == null)
{
%>
<%@include file="Error.jsp"%>
<%
    return;
}
User user = UserFacade.find(Long.parseLong(userId));
if (user == null)
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
    <p>Usuario actualizado</p>
</div>

<form data-role="tabs" id="user-edit" onsubmit="return false;">

    <input type="hidden" name="userId" id="user-edit-id" value="<%=user.getId()%>">

    <div data-role="navbar">
        <ul>
            <li><a href="#info" data-ajax="false" class="ui-btn-active">Info</a></li>
            <li><a href="#access" data-ajax="false">Accesos</a></li>
            <li><a href="#member" data-ajax="false">Socio</a></li>
        </ul>
    </div>

    <div id="info">
        <h3></h3>

        <label for="user-edit-username">Usuario</label>
        <input type="text" name="username" id="user-edit-username" value="<%=user.getUsername()%>">
        <button class="ui-btn ui-corner-all" id="user-edit-serach" onclick="javascript:goTo('UserList.jsp'); return;">Buscar</button>
        <label for="user-edit-password1">Clave</label>
        <input type="password" name="password1" id="user-edit-password1" value="">
        <label for="user-edit-password2">Repita la Clave</label>
        <input type="password" name="password2" id="user-edit-password2" value="">
        <div class="member-create-button ui-grid-a">
            <div class="ui-block-a">
                <button class="ui-btn ui-corner-all" id="user-edit-save" onclick="javascript:userEditSave(); return;">Guardar</button>
            </div>
            <div class="ui-block-b">
                <button class="ui-btn ui-corner-all" id="user-edit-cancel" onclick="javascript:goTo('UserList.jsp'); return;">Cancelar</button>
            </div>
        </div>
    </div>

    <div id="access">
<%
List<Access> accessList = Database.getCurrentSession().createQuery("FROM Access ORDER BY value").list();
List<Long> userAccessIdList = Database.getCurrentSession().createQuery("SELECT access.id FROM UserAccess WHERE user = :user").setParameter("user", user).list();
%>
        <fieldset data-role="controlgroup">
<%
for(Access access : accessList)
{
%>
            <input type="checkbox" name="access-<%=access.getId()%>" id="access-<%=access.getId()%>" value="<%=access.getId()%>" <%=userAccessIdList.contains(access.getId()) ? "checked" : ""%>>
            <label for="access-<%=access.getId()%>"><%=access.getDescription()%></label>
<%
}
%>
        </fieldset>
        <button class="ui-btn ui-corner-all" id="user-access-save" onclick="javascript:userAccessSave(); return;">Guardar</button>
    </div>
</form>


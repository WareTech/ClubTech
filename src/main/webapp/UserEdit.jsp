<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.User" %>
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
User user = (User) Database.getCurrentSession().get(User.class, Long.parseLong(userId));
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

<div data-role="popup" id="error-wrong-password-1">
    <p>Las claves no coinciden</p>
</div>

<div data-role="popup" id="error-wrong-password-2">
    <p>La clave no puede ser nula</p>
</div>

<div data-role="popup" id="error-wrong-password-3">
    <p>La clave no puede ser vac&iacute;a</p>
</div>

<div data-role="popup" id="error-wrong-password-4">
    <p>La clave debe tener al menos 8 caracteres</p>
</div>

<div data-role="popup" id="success">
    <p>Usuario actualizado</p>
</div>

<div data-role="tabs">

    <div data-role="navbar">
        <ul>
            <li><a href="#info" data-ajax="false" class="ui-btn-active">Info</a></li>
            <li><a href="#password" data-ajax="false">Clave</a></li>
            <li><a href="#member" data-ajax="false">Socio</a></li>
        </ul>
    </div>

    <form id="info" onsubmit="return false;">
        <h3></h3>
        <input type="hidden" name="userId" value="<%=user.getId()%>">
        <label for="user-edit-username">Usuario</label>
        <input type="text" name="username" id="user-edit-username" value="<%=user.getUsername()%>">

<%
List<Access> accessList = Database.getCurrentSession()
    .createQuery("FROM Access ORDER BY description ASC")
    .list();
List<Long> userAccessIdList = Database.getCurrentSession()
    .createQuery("SELECT access.id FROM UserAccess WHERE user = :user")
    .setParameter("user", user)
    .list();
%>
        <label for="user-edit-access">Accesos</label>
        <fieldset data-role="controlgroup" id="user-edit-access">
<%for(Access access : accessList) {%>
            <input type="checkbox" name="access" id="access-<%=access.getId()%>" value="<%=access.getId()%>" <%=userAccessIdList.contains(access.getId()) ? "checked" : ""%>>
            <label for="access-<%=access.getId()%>"><%=access.getDescription()%></label>
<%}%>
        </fieldset>
        <div class="ui-grid-a">
            <div class="ui-block-a">
                <button class="ui-btn ui-corner-all" id="user-edit-save" onclick="javascript:userUpdate(); return;">Guardar</button>
            </div>
            <div class="ui-block-b">
                <button class="ui-btn ui-corner-all" id="user-edit-cancel" onclick="javascript:goTo('UserSearch.jsp'); return;">Cancelar</button>
            </div>
        </div>
    </form>

    <form id="password" onsubmit="return false;">
        <h3></h3>
        <input type="hidden" name="userId" value="<%=user.getId()%>">
        <label for="user-edit-password1">Clave</label>
        <input type="password" name="password1" id="user-edit-password1" value="">
        <label for="user-edit-password2">Repita la Clave</label>
        <input type="password" name="password2" id="user-edit-password2" value="">
        <button class="ui-btn ui-corner-all" id="user-edit-search" onclick="javascript:userPasswordUpdate(); return;">Cambiar Clave</button>
    </form>

    <div id="member">
    </div>
</div>


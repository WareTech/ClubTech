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

<h3 class="ui-bar ui-bar-a ui-corner-all">Usuarios</h3>

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


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

<ul data-role="listview" data-inset="true" data-divider-theme="a">
    <li data-role="list-divider">Acceso</li>
    <li><%=access.getDescription()%></li>
    <li data-role="list-divider">Usuarios</li>
<%
List<User> userList = Database.getCurrentSession()
    .createQuery("SELECT user FROM UserAccess WHERE access = :access ORDER BY username ASC")
    .setParameter("access", access)
    .list();
for(User user : userList)
{
%>
    <li><%=user.getUsername()%></li>
<%
}

if (userList.size() == 0)
{
%>
    <li>No hay usuarios para mostrar</li>
<%
}
%>
</ul>

<div class="ui-grid-a">
    <div class="ui-block-a">
        <button class="ui-btn ui-corner-all" id="access-view-edit" onclick="javascript:goTo('AccessEdit.jsp?<%=access.getId()%>'); return;">Editar</button>
    </div>
    <div class="ui-block-b">
        <button class="ui-btn ui-corner-all" id="access-view-back" onclick="javascript:goTo('AccessSearch.jsp'); return;">Volver</button>
    </div>
</div>


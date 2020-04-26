<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Database" %>

<%
String filter = request.getQueryString();
if (filter == null)
{
    filter = "";
}
filter = filter.trim().toLowerCase();
%>
<div data-role="popup" id="error">
    <p>Busq&uacute;eda no v&aacute;lida</p>
</div>

<h3 class="ui-bar ui-bar-a ui-corner-all">Usuarios</h3>

<div>
    <div id="user-list-panel">
        <label for="user-list">Buscar usuario</label>
        <input type="text" name="user-list" id="user-list" value="<%=filter%>">
        <button class="ui-btn ui-corner-all" id="user-list-search" onclick="javascript:userSearch(); return;">Buscar</button>
    </div>

    <div id="user-list-list-panel">
        <ul data-role="listview" data-inset="true">
<%
if (!"".equals(filter))
{
    List<User> userList = Database.getCurrentSession()
        .createQuery("FROM User WHERE username LIKE :username ORDER BY username ASC")
        .setParameter("username", "%" + filter + "%")
        .list();
    for(User user : userList)
    {
%>
            <li><a href="javascript:goTo('UserView.jsp?<%=user.getId()%>');"><%=user.getUsername()%></a></li>
<%
    }
}
%>
        </ul>
    </div>
</div>
<button class="ui-btn ui-corner-all" onclick="javascript:goTo('UserCreate.jsp'); return;">Nuevo Usuario</button>

<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.facade.UserFacade" %>

<%
String filter = request.getQueryString();
if (filter == null)
{
    filter = "";
}
filter = filter.trim().toLowerCase();
%>
<div>
    <h3>Usuarios</h3>

    <div data-role="popup" id="error">
        <p>Busq&uacute;eda no v&aacute;lida</p>
    </div>

    <div id="user-list-panel">
        <label for="user-list">Usuario:</label>
        <input type="text" name="user-list" id="user-list" value="<%=filter%>">
        <button class="ui-btn ui-corner-all" id="user-list-search" onclick="javascript:userListSearch(); return;">Buscar</button>
    </div>

    <div id="user-list-list-panel">
        <ul data-role="listview" data-inset="true">
<%
if (!"".equals(filter))
{
    List<User> userList = UserFacade.filter(filter);
    for(User user : userList)
    {
%>
            <li><a href="javascript:goTo('UserEdit.jsp?<%=user.getId()%>');"><%=user.getUsername()%></a></li>
<%
    }
}
%>
        </ul>
    </div>
</div>

<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Access" %>

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

<h3 class="ui-bar ui-bar-a ui-corner-all">Accesos</h3>

<div>
    <div id="access-list-panel">
        <label for="access-list">Buscar acceso</label>
        <input type="text" name="access-list" id="access-list" value="<%=filter%>">
        <button class="ui-btn ui-corner-all" id="access-list-search" onclick="javascript:accessSearch(); return;">Buscar</button>
    </div>

    <div id="access-list-list-panel">
        <ul data-role="listview" data-inset="true">
<%
if (!"".equals(filter))
{
    List<Access> accessList = Database.getCurrentSession()
            .createQuery("FROM Access WHERE description LIKE :description ORDER BY description ASC")
            .setParameter("description", "%" + filter + "%")
            .list();
    for(Access access : accessList)
    {
%>
            <li><a href="javascript:goTo('AccessView.jsp?<%=access.getId()%>');"><%=access.getDescription()%></a></li>
<%
    }
}
%>
        </ul>
    </div>
</div>

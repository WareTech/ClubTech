<div>
    <ul data-role="listview" data-inset="true" data-divider-theme="a">
<%for (Cookie cookie : request.getCookies()) {%>
        <li data-role="list-divider"><%=cookie.getName()%></li>
        <li>Value: <%=cookie.getValue()%></li>
        <li>Comment: <%=cookie.getComment()%></li>
        <li>Domain: <%=cookie.getDomain()%></li>
        <li>MaxAge: <%=cookie.getMaxAge()%></li>
        <li>Path: <%=cookie.getPath()%></li>
        <li>Secure: <%=cookie.getSecure()%></li>
        <li>Version: <%=cookie.getVersion()%></li>
<%}%>
    </ul>
</div>

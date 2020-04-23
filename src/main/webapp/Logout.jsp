<%@ page import="com.WareTech.ClubTech.Utils" %>
<%
session.invalidate();
Utils.setUserCached(request, response, Utils.USER_EMPTY);
%>




<%@page import="com.google.gson.Gson"%>
<%@ page import="com.WareTech.ClubTech.facade.MemberFacade" %>
<%
out.print(new Gson().toJson(MemberFacade.getMemberList()));
%>
<%
String APPLICATION_NAME = "ClubTech";
String LOGIN_PAGE = "Login.jsp";

String username = (String) session.getAttribute("USER");
if (!request.getRequestURI().endsWith(LOGIN_PAGE) && username == null)
{
	response.sendRedirect(LOGIN_PAGE);
	return;
}

String date = "13/04/2020";
String ticketPrice = "$100";
String matchDescription = "ADIP vs Gimnasia";
%>
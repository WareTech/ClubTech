<div data-role="footer" data-position="fixed">
	<h1>
<%
if (username == null)
{
%>
	<a href="javascript:login();">Ingresar</a>
<%
} 
else 
{
	out.print(username);
}
%>
	</h1>
</div>

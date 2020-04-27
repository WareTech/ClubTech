<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>
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

<h3 class="ui-bar ui-bar-a ui-corner-all">Pagos</h3>

<div>
	<div>
		<label>Buscar socio</label>
		<input type="text" id="filter" value="<%=filter%>">
		<button class="ui-btn ui-corner-all" onclick="javascript:paymentSearch();return;">Buscar</button>
	</div>

	<div id="member-search-filter-list-panel">
		<ul data-role="listview" data-inset="true">
<%
if (!"".equals(filter))
{
filter = "%" + filter + "%";
List<Member> memberList = Database.getCurrentSession()
		.createQuery("FROM Member WHERE firstname LIKE :firstname OR lastname LIKE :lastname OR dni LIKE :dni ORDER BY firstname ASC, lastname ASC")
		.setParameter("firstname", filter)
		.setParameter("lastname", filter)
		.setParameter("dni", filter)
		.list();
for(Member member : memberList)
{
%>
			<li>
				<a href="javascript:goTo('PaymentViewMember.jsp?<%=member.getId()%>');">
					<%=member.getFirstname()%>&nbsp;<%=member.getLastname()%>&nbsp;<%=member.getDni() == null ? "" : "(" + member.getDni() +")"%>
				</a>
			</li>
<%
	}
}
%>
		</ul>
	</div>
</div>

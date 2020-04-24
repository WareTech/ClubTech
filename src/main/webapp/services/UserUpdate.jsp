<%@ page import="com.WareTech.ClubTech.entity.User" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.WareTech.ClubTech.entity.UserAccess" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.Access" %>

<%
String userId = request.getParameter("userId");
if (userId == null || "".equals(userId))
{
    out.print(-1);
    return;
}

User user = (User) Database.getCurrentSession().get(User.class, Long.parseLong(userId));
if (user == null)
{
    out.print(-1);
    return;
}

String username = request.getParameter("username");
if (username == null || "".equals(username))
{
    out.print(-1);
    return;
}
user.setUsername(username);

Database.getCurrentSession().update(user);

String[] accessList = request.getParameterValues("access");
if (accessList == null)
{
    accessList = new String[]{};
}

List<UserAccess> userAccessList = Database.getCurrentSession()
        .createQuery("FROM UserAccess WHERE user = :user")
        .setParameter("user", user)
        .list();
Long accessIdLong;
for (UserAccess userAccess : userAccessList)
{
    boolean toDelete = true;
    for(String accessId : accessList)
    {
        accessIdLong = Long.parseLong(accessId);
        if (accessIdLong == userAccess.getAccess().getId())
        {
            toDelete = false;
            break;
        }
    }

    if (toDelete)
    {
        Database.getCurrentSession().delete(userAccess);
    }
}

for(String accessId : accessList)
{
    accessIdLong = Long.parseLong(accessId);
    boolean toAdd = true;
    for (UserAccess userAccess : userAccessList)
    {
        if (accessIdLong == userAccess.getAccess().getId())
        {
            toAdd = false;
        }
    }

    if (toAdd)
    {
        UserAccess userAccess = new UserAccess();
        userAccess.setUser(user);
        Access access = (Access) Database.getCurrentSession().get(Access.class, accessIdLong);
        userAccess.setAccess(access);
        Database.getCurrentSession().save(userAccess);
    }
}

out.print(user.getId());
%>
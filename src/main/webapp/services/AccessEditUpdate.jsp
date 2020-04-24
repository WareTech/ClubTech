<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Access" %>
<%@ page import="com.WareTech.ClubTech.entity.UserAccess" %>
<%@ page import="java.util.List" %>
<%@ page import="com.WareTech.ClubTech.entity.User" %>

<%
String accessId = request.getParameter("accessId");
if (accessId == null || "".equals(accessId))
{
    out.print(-1);
    return;
}

Access access = (Access) Database.getCurrentSession().get(Access.class, Long.parseLong(accessId));
if (access == null)
{
    out.print(-1);
    return;
}

String value = request.getParameter("value");
if (value == null || "".equals(value))
{
    out.print(-1);
    return;
}

String description = request.getParameter("description");
if (description == null || "".equals(description))
{
    out.print(-1);
    return;
}

access.setValue(value);
access.setDescription(description);

Database.getCurrentSession().update(access);

String[] userList = request.getParameterValues("user");
if (userList == null)
{
    userList = new String[]{};
}

List<UserAccess> userAccessList = Database.getCurrentSession()
        .createQuery("FROM UserAccess WHERE access = :access")
        .setParameter("access", access)
        .list();
Long userIdLong;
for (UserAccess userAccess : userAccessList)
{
    boolean toDelete = true;
    for(String userId : userList)
    {
        userIdLong = Long.parseLong(userId);
        if (userIdLong == userAccess.getUser().getId())
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

for(String userId : userList)
{
    userIdLong = Long.parseLong(userId);
    boolean toAdd = true;
    for (UserAccess userAccess : userAccessList)
    {
        if (userIdLong == userAccess.getUser().getId())
        {
            toAdd = false;
        }
    }

    if (toAdd)
    {
        UserAccess userAccess = new UserAccess();
        userAccess.setAccess(access);
        User user = (User) Database.getCurrentSession().get(User.class, userIdLong);
        userAccess.setUser(user);
        Database.getCurrentSession().save(userAccess);
    }
}

out.print(1);
%>
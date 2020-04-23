package com.WareTech.ClubTech.service;

import com.WareTech.ClubTech.Database;
import com.WareTech.ClubTech.entity.Access;
import com.WareTech.ClubTech.entity.User;
import com.WareTech.ClubTech.entity.UserAccess;

public class DatabaseSecurityService
    implements SecurityService
{
    @Override
    public boolean checkAuthorization(
        User user,
        String url
        )
    {
        System.out.println(String.format("DatabaseSecurityService#checkAuthorization user=%s url=%s", user, url));

        if (url == null || "".equals(url))
        {
            return true;
        }

        Access access = (Access) Database.getCurrentSession()
                .createQuery("FROM Access WHERE value = :value")
                .setParameter("value", url)
                .uniqueResult();

        if (access == null)
        {
            return true;
        }

        if (user == null)
        {
            return false;
        }

        UserAccess userAccess = (UserAccess) Database.getCurrentSession()
                .createQuery("FROM UserAccess WHERE user = :user AND access = :access")
                .setParameter("user", user)
                .setParameter("access", access)
                .uniqueResult();

        return userAccess != null;
    }

    @Override
    public User login(String username, String password)
    {
        try
        {
            User user = (User) Database.getCurrentSession()
                    .createQuery("FROM User WHERE username = :username AND password = :password")
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .uniqueResult();

            return user;
        }
        catch(Exception exception)
        {
            return null;
        }
    }
}

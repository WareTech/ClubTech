package com.WareTech.ClubTech.facade;

import com.WareTech.ClubTech.Database;
import com.WareTech.ClubTech.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserFacade
{
    /**
     *
     * @param userId
     * @return
     */
    static public User find(Long userId)
    {
        return (User) Database.getCurrentSession().get(User.class, userId);
    }

    /**
     *
     * @param user
     */
    static public void update(User user)
    {
        Database.getCurrentSession().update(user);
    }

    /**
     *
     * @param filter
     * @return
     */
    static public List<User> filter(String filter)
    {
        if (filter == null)
        {
            return new ArrayList<>();
        }

        filter = filter.trim().toLowerCase();
        if ("".equals(filter))
        {
            return new ArrayList<>();
        }

        List<User> userList = Database.getCurrentSession()
                .createQuery("FROM User WHERE username LIKE :username")
                .setParameter("username", "%" + filter +"%")
                .list();

        return userList;
    }
}

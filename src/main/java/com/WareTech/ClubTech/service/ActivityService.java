package com.WareTech.ClubTech.service;

import com.WareTech.ClubTech.Database;
import com.WareTech.ClubTech.entity.Parameter;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class ActivityService
{
    /**
     *
     * @param activity
     * @return
     */
    static public List<Parameter> toList(Parameter activity)
    {
        List<Parameter> activityList = new ArrayList<>();
        activityList.add(activity);

        List<Parameter> childrenList = Database.getCurrentSession()
                .createQuery("FROM Parameter WHERE parent = :parent ORDER BY position ASC")
                .setParameter("parent", activity)
                .list();

        if (childrenList.size() > 0)
        {
            for(Parameter child : childrenList)
            {
                activityList.addAll(toList(child));
            }
        }

        return activityList;
    }

    /**
     *
     * @return
     */
    static public List<Parameter> toList()
    {
        Parameter activity = (Parameter) Database.getCurrentSession()
            .createQuery("FROM Parameter WHERE value = :activity")
            .setParameter("activity", Parameter.ACTIVITY)
            .uniqueResult();

        return toList(activity);
    }

    /**
     *
     * @return
     */
    static public List<Parameter> toListWithoutRoot()
    {
        List<Parameter> activityList = ActivityService.toList();
        activityList.remove(0);

        return  activityList;
    }
    /**
     *
     * @param activity
     * @return
     */
    static public String fullDescription(Parameter activity)
    {
        String description = activity.getDescription();
        for(Parameter _activity = activity.getParent(); _activity.getParent() != null; _activity = _activity.getParent())
        {
            description = _activity.getDescription() + " - " + description;
        }

        return description;
    }
}

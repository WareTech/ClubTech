package com.WareTech.ClubTech.facade;

import com.WareTech.ClubTech.entity.Subscription;

import java.util.ArrayList;
import java.util.List;

public class SubscriptionFacade
{
    static public List<Subscription> getSubscriptionList()
    {
        Subscription subscription;
        List<Subscription> subscriptionList = new ArrayList<>();

        for(String activity : ActivityFacade.getActivityList())
        {
            subscription = new Subscription();
            subscription.setActivity("");
        }

        return subscriptionList;
    }
}

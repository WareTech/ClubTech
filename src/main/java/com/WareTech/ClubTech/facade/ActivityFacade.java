package com.WareTech.ClubTech.facade;

import java.util.Arrays;
import java.util.List;

/**
 *
 */
public class ActivityFacade
{
    static public List<String> getActivityList()
    {
        return Arrays.asList(new String[]{"Socio", "Zumba", "Gimnasia"});
    }
}

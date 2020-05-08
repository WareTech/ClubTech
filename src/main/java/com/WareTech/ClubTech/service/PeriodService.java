package com.WareTech.ClubTech.service;

import com.WareTech.ClubTech.Database;
import com.WareTech.ClubTech.entity.Parameter;

import java.util.List;

/**
 *
 */
public class PeriodService
{
    /**
     *
     * @return
     */
    static public List<Parameter> toList()
    {
        List<Parameter> periodList = Database.getCurrentSession()
            .createQuery(
                new StringBuffer()
                    .append("SELECT child FROM Parameter child, Parameter parent")
                    .append(" WHERE parent.value = :period AND child.parent = parent")
                    .append(" ORDER BY child.position ASC")
                    .toString()
                )
                .setParameter("period", Parameter.PERIOD)
                .list();

        return periodList;
    }
}

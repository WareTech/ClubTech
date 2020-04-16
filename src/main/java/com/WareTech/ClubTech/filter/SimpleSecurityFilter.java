package com.WareTech.ClubTech.filter;

import com.WareTech.ClubTech.entity.User;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import java.util.*;

/**
 *
 */
public class SimpleSecurityFilter
    extends SecurityFilter
{
    final static public List<String> BLACK_LIST = Arrays.asList(new String[]{
        "/SuscriptionCreateMember.jsp",
        "/SuscriptionSearch.jsp",
        "/TicketCreate.jsp"
        });

    @Override
    public void init(FilterConfig filterConfig)
        throws ServletException
    {
    }

    /**
     *
     * @param user
     * @param url
     * @return
     */
    public boolean checkAuthorization(
        User user,
        String url
        )
    {
        if (BLACK_LIST.contains(url) && user == null)
        {
            return false;
        }

        return true;
    }
}

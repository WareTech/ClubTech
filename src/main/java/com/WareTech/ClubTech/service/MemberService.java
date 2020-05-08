package com.WareTech.ClubTech.service;

import com.WareTech.ClubTech.entity.Member;

/**
 *
 */
public class MemberService
{
    /**
     *
     * @param member
     * @return
     */
    static public String fullDescription(Member member)
    {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(member.getFirstname());
        stringBuffer.append(" ");
        stringBuffer.append(member.getLastname());
        if (member.getDni() != null)
        {
            stringBuffer.append(" (");
            stringBuffer.append(member.getDni());
            stringBuffer.append(")");
        }

        return stringBuffer.toString();
    }
}

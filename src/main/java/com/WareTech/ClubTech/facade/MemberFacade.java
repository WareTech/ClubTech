package com.WareTech.ClubTech.facade;

import com.WareTech.ClubTech.entity.Member;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class MemberFacade
{
    /**
     *
     * @return
     */
    static public List<Member> getMemberList()
    {
        Member member;
        List<Member> memberList = new ArrayList<>();

        member = new Member();
        member.setId(1l);
        member.setFirstname("Augusto");
        member.setLastname("Soncini");
        member.setDni("25952726");
        memberList.add(member);

        member = new Member();
        member.setId(2l);
        member.setFirstname("Valentino");
        member.setLastname("Soncini");
        member.setDni("43952726");
        memberList.add(member);

        member = new Member();
        member.setId(3l);
        member.setFirstname("Leandro");
        member.setLastname("Soncini");
        member.setDni("24952726");
        memberList.add(member);

        member = new Member();
        member.setId(4l);
        member.setFirstname("Ignacio");
        member.setLastname("Soncini");
        member.setDni("29952726");
        memberList.add(member);

        member = new Member();
        member.setId(5l);
        member.setFirstname("Manuel");
        member.setLastname("Soncini");
        member.setDni("51952726");
        memberList.add(member);

        member = new Member();
        member.setId(6l);
        member.setFirstname("Ines");
        member.setLastname("Soncini");
        member.setDni("53952726");
        memberList.add(member);

        member = new Member();
        member.setId(7l);
        member.setFirstname("Katia");
        member.setLastname("Olchansky");
        member.setDni("40511381");
        memberList.add(member);

        return memberList;
    }

    /**
     *
     * @param filter
     * @return
     */
    static public List<Member> filter(String filter)
    {
        List<Member> memberList = new ArrayList<>();

        if (filter == null)
        {
            return memberList;
        }

        filter = filter.trim().toLowerCase();
        for(Member member : MemberFacade.getMemberList())
        {
            if (member.getFirstname().toLowerCase().contains(filter) || member.getLastname().toLowerCase().contains(filter))
            {
                memberList.add(member);
            }
        }
        return memberList;
    }

    /**
     *
     * @param id
     * @return
     */
    static public Member find(Long id)
    {
        for(Member member : MemberFacade.getMemberList())
        {
            if (member.getId() == id)
            {
                return member;
            }
        }
        return null;
    }
}

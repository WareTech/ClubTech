package com.WareTech.ClubTech.test;

import com.WareTech.ClubTech.Database;
import com.WareTech.ClubTech.entity.Member;
import com.WareTech.ClubTech.entity.Payment;

import java.util.Base64;
import java.util.List;

public class Test
{
    static public void main(String[] args)
        throws Exception
    {
        Database.getCurrentSession().beginTransaction();
        Member member = (Member) Database.getCurrentSession().get(Member.class, 127l);
        List<Payment> paymentList = Database.getCurrentSession()
            .createQuery("FROM Payment p WHERE p.member = :member")
            .setParameter("member", member)
            .list();
        System.out.println(paymentList);

        String token = new StringBuffer().append(987).append(":").append(System.currentTimeMillis()).toString();
        token = Base64.getEncoder().encodeToString(token.getBytes());
        System.out.println(token);

        token = new String(Base64.getDecoder().decode(token));
        System.out.println(token);

        String birthday = "19770612";
        System.out.println(
            new StringBuffer()
                .append(birthday.substring(6, 8))
                .append("/")
                .append(birthday.substring(4, 6))
                .append("/")
                .append(birthday.substring(0, 4))
                .toString()
            );
    }
}

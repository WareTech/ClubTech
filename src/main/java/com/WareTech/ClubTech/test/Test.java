package com.WareTech.ClubTech.test;

import java.util.Base64;

public class Test
{
    static public void main(String[] args)
        throws Exception
    {
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

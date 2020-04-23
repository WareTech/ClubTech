package com.WareTech.ClubTech.test;

import java.util.Base64;

public class Test
{
    static public void main(String[] args)
        throws Exception
    {
        String password = "Globant202004!";
        password = Base64.getEncoder().encodeToString(password.getBytes());
        System.out.println(password);

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

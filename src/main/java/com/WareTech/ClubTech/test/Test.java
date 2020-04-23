package com.WareTech.ClubTech.test;

public class Test
{
    static public void main(String[] args)
        throws Exception
    {
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

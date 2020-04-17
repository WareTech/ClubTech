package com.WareTech.ClubTech.service;

import com.WareTech.ClubTech.entity.Access;
import com.WareTech.ClubTech.entity.User;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.*;

public class BasicSecurityService
    implements SecurityService
{
    static protected List<String> ACCESS_LIST = new ArrayList<>();
    static protected Map<String, List<String>> USER_ACCESS_MAP = new HashMap<>();
    static protected Map<String, String> USER_PASSWORD_MAP = new HashMap<>();

    @Override
    public boolean checkAuthorization(User user, String url)
    {
        if (!ACCESS_LIST.contains(url))
        {
            return true;
        }

        if (user == null)
        {
            return false;
        }

        return user.getAccessList().contains(url);
    }

    /**
     *
     * @param username
     * @param password
     * @return
     */
    public User login(String username, String password)
    {
        if (username == null || "".equals(username) || password == null || "".equals(password))
        {
            return null;
        }

        if (!password.equals(USER_PASSWORD_MAP.get(username)))
        {
            return null;
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setAccessList(USER_ACCESS_MAP.get(username));

        return user;
    }

    {
        try
        {
            InputStream inputStream = BasicSecurityService.class.getResourceAsStream("/data.txt");
            byte[] dataByte = new byte[inputStream.available()];
            inputStream.read(dataByte);
            inputStream.close();

            String dataString = new String(dataByte);
            String[] lines = dataString.split("\n");

            String[] lineString;
            String key;
            String[] values;
            String[] userString;
            String username;
            String password;
            for(String line : lines)
            {
                lineString = line.split("=");
                key = lineString[0].trim();
                values = lineString[1].trim().split(",");
                if ("Access".equals(key))
                {
                    ACCESS_LIST = Arrays.asList(values);
                }
                else
                {
                    userString = key.split(":");
                    username = userString[0].trim();
                    password = userString[1].trim();
                    USER_PASSWORD_MAP.put(username, password);
                    USER_ACCESS_MAP.put(username, Arrays.asList(values));
                }
            }
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
    }
}

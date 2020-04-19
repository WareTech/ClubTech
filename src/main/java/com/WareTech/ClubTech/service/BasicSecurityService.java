package com.WareTech.ClubTech.service;

import com.WareTech.ClubTech.entity.User;

import java.io.InputStream;
import java.util.*;

public class BasicSecurityService
    implements SecurityService
{
    final static public String ACCESS_LIST = "ACCESS_LIST";

    static protected Map<String, List<String>> USER_ACCESS_MAP = new HashMap<>();
    static protected Map<String, String> USER_PASSWORD_MAP = new HashMap<>();

    /**
     *
     * @return
     */
    public List<String> getAccessList()
    {
        return USER_ACCESS_MAP.get(ACCESS_LIST);
    }

    @Override
    public boolean checkAuthorization(User user, String url)
    {
        if (!this.getAccessList().contains(url))
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
            List<String> accessList;
            List<String> userAccessList;
            for(String line : lines)
            {
                line = line.trim();
                if (line.isEmpty())
                {
                    continue;
                }

                if (line.startsWith("#"))
                {
                    continue;
                }

                lineString = line.split("=");
                key = lineString[0].trim();

                if (key.isEmpty())
                {
                    continue;
                }

                userString = key.split(":");
                username = userString[0].trim();
                if (userString.length > 1) {
                    password = userString[1].trim();
                    USER_PASSWORD_MAP.put(username, password);
                }

                accessList = new ArrayList<>();
                values = lineString[1].trim().split(",");
                for(String access : values)
                {
                    userAccessList = USER_ACCESS_MAP.get(access);
                    if (userAccessList == null) {
                        accessList.add(access);
                        continue;
                    }
                    accessList.addAll(userAccessList);
                }

                USER_ACCESS_MAP.put(username, accessList);
            }
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
    }
}

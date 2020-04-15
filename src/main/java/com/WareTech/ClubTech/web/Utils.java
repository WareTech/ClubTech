package com.WareTech.ClubTech.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WareTech.ClubTech.entity.User;

public class Utils 
{
	final static public String USER = "USER";
	
	static public User getUser(
			HttpServletRequest httpServletRequest, 
			HttpServletResponse httpServletResponse
			)
		throws Exception
	{
		HttpSession httpSession = httpServletRequest.getSession();
		return (User) httpSession.getAttribute(USER);
	}

	static public void setUser(
			HttpServletRequest httpServletRequest, 
			HttpServletResponse httpServletResponse,
			User user
			)
		{
			HttpSession httpSession = httpServletRequest.getSession();
			httpSession.setAttribute(USER, user);
		}
}

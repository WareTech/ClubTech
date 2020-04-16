package com.WareTech.ClubTech.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WareTech.ClubTech.entity.User;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils 
{
	final static public String URL_BASE = "/";
	final static public String URL_HOME = URL_BASE + "Home.jsp";
	final static public String URL_LOGIN = URL_BASE + "Login.jsp";
	final static public String URL_LOGOUT = URL_BASE + "Logout.jsp";
	final static public String URL_UNATHORIZED = URL_BASE + "Unauthorized.jsp";

	final static public DateFormat DATE_FORMAT = new SimpleDateFormat("dd//MM//yyyy HH:mm");

	final static public String APPLICATION_NAME = "ClubTech";
	final static public String USER = "USER";

	/**
	 *
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @return
	 */
	static public User getUser(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse
		)
	{
		HttpSession httpSession = httpServletRequest.getSession();

		return (User) httpSession.getAttribute(USER);
	}

	/**
	 *
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @param user
	 */
	static public void setUser(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse,
		User user
		)
	{
		HttpSession httpSession = httpServletRequest.getSession();
		httpSession.setAttribute(USER, user);
	}

	/**
	 *
	 * @return
	 */
	static public String dateTimeNow()
	{
		return DATE_FORMAT.format(new Date());
	}

}

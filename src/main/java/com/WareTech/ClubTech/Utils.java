package com.WareTech.ClubTech;

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
	final static public String URL_UNAUTHORIZED = URL_BASE + "Unauthorized.jsp";

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
		return Context.DATE_TIME_FORMATER.format(new Date());
	}

	/**
	 *
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @return
	 */
	static public boolean chechAuthorization(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse
		)
	{
		String url = httpServletRequest.getServletPath();
		return chechAuthorization(httpServletRequest, httpServletResponse, url);
	}

	/**
	 *
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @param url
	 * @return
	 */
	static public boolean chechAuthorization(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse,
		String url
		)
	{
		User user = (User) Utils.getUser(httpServletRequest, httpServletResponse);
		return Context.getSecurityService().checkAuthorization(user, url);
	}

	/**
	 *
	 * @param user
	 * @param url
	 * @return
	 */
	static public boolean chechAuthorization(
		User user,
		String url
		)
	{
		return Context.getSecurityService().checkAuthorization(user, url);
	}

	/**
	 *
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @param url
	 * @return
	 */
	static public String visibility(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse,
		String url
		)
	{
		if (chechAuthorization(httpServletRequest, httpServletResponse, url))
		{
			return "";
		}
		else
		{
			return " style=\"display:none\"";
		}
	}

	/**
	 *
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @param urls
	 * @return
	 */
	static public String visibility(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse,
		String[] urls
		)
	{
		for (String url : urls)
		{
			if (chechAuthorization(httpServletRequest, httpServletResponse, url))
			{
				return "";
			}
		}

		return " style=\"display:none\"";
	}

	/**
	 *
	 * @param username
	 * @param password
	 * @return
	 */
	static public User login(
		String username,
		String password
		)
	{
		return Context.getSecurityService().login(username, password);
	}

	/**
	 *
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @return
	 */
	static public User login(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse
		)
	{
		String username = httpServletRequest.getParameter("username");
		String password = httpServletRequest.getParameter("password");
		User user = Utils.login(username, password);

		if (user != null)
		{
			Utils.setUser(httpServletRequest, httpServletResponse, user);
		}

		return user;
	}
}

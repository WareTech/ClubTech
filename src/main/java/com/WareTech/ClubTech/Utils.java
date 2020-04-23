package com.WareTech.ClubTech;

import javax.servlet.http.Cookie;
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
	final static public String USER_EMPTY = "";
	final static public Integer USER_COOKIE_DURATION = 60 * 60 * 24 * 30;

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
		User user = (User) httpSession.getAttribute(USER);

		if (user != null)
		{
			return user;
		}

		return Utils.getUserCached(httpServletRequest, httpServletResponse);
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
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @return
	 */
	static public User getUserCached(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse
		)
	{
		for (Cookie cookie : httpServletRequest.getCookies())
		{
			if (USER.equals(cookie.getName()))
			{
				String token = cookie.getValue();
				if (USER_EMPTY.equals(token))
				{
					return null;
				}

				User user = (User) Database.getCurrentSession()
						.createQuery("FROM User WHERE token = :token")
						.setParameter("token", token)
						.uniqueResult();

				if (user == null)
				{
					return null;
				}

				Utils.setUser(httpServletRequest, httpServletResponse, user);

				return user;
			}
		}

		return null;
	}

	/**
	 *
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @param user
	 */
	static public void setUserCached(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse,
		String user
		)
	{
		Cookie cookie = new Cookie(USER, user);
		cookie.setPath(httpServletRequest.getContextPath());
		cookie.setMaxAge(USER_COOKIE_DURATION);
		httpServletResponse.addCookie(cookie);
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
	static public boolean checkAuthorization(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse
		)
	{
		String url = httpServletRequest.getServletPath();
		return checkAuthorization(httpServletRequest, httpServletResponse, url);
	}

	/**
	 *
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @param url
	 * @return
	 */
	static public boolean checkAuthorization(
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
	static public boolean checkAuthorization(
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
	 * @param urls
	 * @return
	 */
	static public boolean checkAuthorization(
		HttpServletRequest httpServletRequest,
		HttpServletResponse httpServletResponse,
		String[] urls
		)
	{
		for (String url : urls)
		{
			if (checkAuthorization(httpServletRequest, httpServletResponse, url))
			{
				return true;
			}
		}

		return false;
	}

}
